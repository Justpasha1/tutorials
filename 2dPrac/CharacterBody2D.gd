extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -800.0

@export var hp : int = 2
var flag = true
var push_furcona = 200

var double_jump = false
var canDoubleJump = false

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	$Camera2D/Label.text = str(hp)

func _physics_process(delta):
	
	if double_jump and canDoubleJump and  !is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		print(1)
		velocity.y = JUMP_VELOCITY
		double_jump = false
	
	if is_on_floor() and canDoubleJump:
		double_jump = true
	
	if hp <= 0:
		get_tree().quit()
	
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider().is_in_group('spikes') and flag:
			print(1)
			$Hamster.modulate = 'ffffff88'
			hp -= 1
			flag = false
			$Camera2D/Label.text = str(hp)
			$Timer.start()
		elif c.get_collider() is RigidBody2D:
			c.get_collider().apply_central_impulse(-c.get_normal() * push_furcona) 
		elif  c.get_collider().is_in_group('upgrade'):
			canDoubleJump = true
			c.get_collider().queue_free()


func _on_timer_timeout():
	$Hamster.modulate = 'ffffff'
	flag = true
