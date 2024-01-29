extends Node2D

@export_category('main_hero')
@export var MaxHP : int = 5
@export var Damage : int = 4
@export var Gold : int 
var hp = MaxHP

var PlayerStatsTemp = "HP: %s\nDamage: %s\nGold: %s"
var EnemyStatsTemp = "%s\nHP: %s\nDamage: %s\nReward: %s"

var CurrentEnemy

var enemy1 = {
	"name" : 'angry rat v1',
	"HP" : 4,
	"Damage" : 1,
	"Reward" : 3
}
var enemy2 = {
	"name" : 'angry rat v2',
	"HP" : 6,
	"Damage" : 2,
	"Reward" : 6
}
var enemy3 = {
	"name" : 'angry rat v3',
	"HP" : 9,
	"Damage" : 3,
	"Reward" : 10
}

var enemyList = ['enemy1','enemy1','enemy1','enemy1','enemy2','enemy2','enemy3']

func _ready():
	enemyList.shuffle()
	spawn_enemy()
	$VBoxContainer/playerStats.text = PlayerStatsTemp % [hp,Damage,Gold]

func _on_button_attack_pressed():
	pass # Replace with function body.


func _on_button_hpupg_pressed():
	if Gold >= 3:
		MaxHP += 1
		Gold -= 3
		$VBoxContainer/playerStats.text = PlayerStatsTemp % [hp,Damage,Gold]

func _on_button_dmgupg_pressed():
	if Gold >= 4:
		Damage += 1
		Gold -= 4
		$VBoxContainer/playerStats.text = PlayerStatsTemp % [hp,Damage,Gold]


func _on_button_heal_pressed():
	if Gold >= 3:
		hp = MaxHP
		Gold -= 3
		$VBoxContainer/playerStats.text = PlayerStatsTemp % [hp,Damage,Gold]

func spawn_enemy():
	match enemyList[0]:
		'enemy1':
			CurrentEnemy = enemy1.duplicate()
		'enemy2':
			CurrentEnemy = enemy2.duplicate()
		'enemy3':
			CurrentEnemy = enemy3.duplicate()
	enemyList.remove_at(0)
	$VBoxContainer/enemyStats.text = EnemyStatsTemp % [CurrentEnemy['name'],CurrentEnemy['HP'],CurrentEnemy['Damage'],CurrentEnemy['Reward']]
