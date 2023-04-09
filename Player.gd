extends CharacterBody3D

# constants
const SPEED = 4

# attributes
var destination: Vector3
var is_moving = false

# definitions
const TOP = Vector3(0,0,1)
const DOWN = Vector3(0,0,-1)
const LEFT = Vector3(-1,0,0)
const RIGHT = Vector3(1,0,1)

func move(towards):
	destination = self.position + towards
	is_moving = true

func _physics_process(delta):
	if !is_moving:
		if Input.is_action_pressed("ui_up"):
			move(TOP)
		elif Input.is_action_pressed("ui_down"):
			move(DOWN)
		elif Input.is_action_pressed("ui_left"):
			move(LEFT)
		elif Input.is_action_pressed("ui_right"):
			move(RIGHT)
	elif ((destination - self.position).length() < 0.01):
		self.position = destination
		is_moving = false
	else:
		velocity = SPEED * (destination - self.position).normalized()
		move_and_slide()
		
		#	velocity.x = direction.x * SPEED
		#	velocity.z = direction.z * SPEED
		#else:
		#	velocity.x = move_toward(velocity.x, 0, SPEED)
		#	velocity.z = move_toward(velocity.z, 0, SPEED)

	#move_and_slide()
