extends CharacterBody2D

var hp = 2
var can_reciev_damage = true

var can_upgrade = true
var double_jump = false
var upgraded = false

var push_force = 80

const SPEED = 500.0
const JUMP_VELOCITY = -600.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(delta):
	$Camera2D/Label.text = str(hp)

func _physics_process(delta):	
	if is_on_floor() and !double_jump and upgraded:
		double_jump = true
	
	if Input.is_action_just_pressed("ui_accept") and !is_on_floor() and double_jump:
		double_jump = false
		velocity.y = JUMP_VELOCITY
	
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	for collider in get_slide_collision_count():
		var collid = get_slide_collision(collider)
		#print(collid1)
		if collid.get_collider() == null:
			pass
		elif collid.get_collider().is_in_group('upgrade') and can_upgrade:
			can_upgrade = false
			upgraded = true
			collid.get_collider().queue_free()
		elif collid.get_collider().is_in_group('enemy'):
			if hp - 1 > 0 and can_reciev_damage:
				hp -= 1
				$Timer.start()
				can_reciev_damage = false
				self.modulate   = "ffffff7d"
			elif hp - 1 == 0 and can_reciev_damage:
				get_tree().quit()
		elif collid.get_collider() is RigidBody2D:
			collid.get_collider().apply_central_impulse(-collid.get_normal() * push_force)
				
	
	
	move_and_slide()
	
	


func _on_timer_timeout():
	self.modulate   = "ffffff"
	can_reciev_damage = true
