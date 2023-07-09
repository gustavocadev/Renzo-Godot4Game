extends Node2D

@onready var heartsContainer = $CanvasLayer/heartsContainer
@onready var player = $RenzoCharacter

func _ready():
	# Reset HP
	Game.playerHP = Game.playerMaxHP
	
func _input(event: InputEvent) -> void:
	if event.is_action_released("pause"):
		call_deferred("_pause")
		
func _pause() -> void:
	$Paused.pause()
	get_tree().paused = true
