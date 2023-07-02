extends CharacterBody2D

const speed = 60
const limit = 0.5

var startPosition
var endPosition

@onready var anim = get_node("AnimatedSprite2D")

func _ready():
	startPosition = position
	endPosition = startPosition + Vector2(0, 3*64)
	
	
func changeDirection():
	var tempEnd = endPosition
	endPosition = startPosition
	startPosition = tempEnd

func updateVelocity():
	var moveDirection = endPosition - position
	if moveDirection.length() < limit:
		# Once we finished to walk we need to back to the same point
		changeDirection()
	
	velocity = moveDirection.normalized() * speed
	
	
func updateAnimation():
	var animationString = "Walk_Up"
	if velocity.y > 0:
		animationString = "Walk_Down"
	anim.play(animationString)
	
func _physics_process(delta):
	updateVelocity()
	move_and_slide()
	updateAnimation()
