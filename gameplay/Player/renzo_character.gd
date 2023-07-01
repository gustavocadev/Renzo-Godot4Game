extends CharacterBody2D

const SPEED = 300.0

@onready var anim = get_node("AnimationPlayer")

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	var isWalkingDown = direction.y == 1
	var isWalkingUp = direction.y == -1
	
	var isWalkingLeft = direction.x == -1
	var isWalkingRight = direction.x == 1
	
	velocity = direction * SPEED

	if isWalkingLeft:
		get_node("AnimatedSprite2D").flip_h = true
		anim.play("Walk_Left_Right")
	if isWalkingRight:
		get_node("AnimatedSprite2D").flip_h = false
		anim.play("Walk_Left_Right")
	if isWalkingUp:
		anim.play("Walk_Up")
	if isWalkingDown:
		anim.play("Walk_Down")
	if velocity.length() == 0:
		anim.stop()
	move_and_slide()
