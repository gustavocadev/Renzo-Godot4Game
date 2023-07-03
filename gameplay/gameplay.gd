extends Node2D

@onready var heartsContainer = $CanvasLayer/heartsContainer
@onready var player = $RenzoCharacter
@onready var alien = $Alien

func _ready():
	heartsContainer.setMaxHearts(player.maxHealth)
	heartsContainer.updateHearts(player.currentHealth)
	alien.healthChanged.connect(heartsContainer.updateHearts)
	

func _input(event: InputEvent) -> void:
	if event.is_action_released("pause"):
		call_deferred("_pause")
		
func _pause() -> void:
	$Paused.pause()
	get_tree().paused = true
