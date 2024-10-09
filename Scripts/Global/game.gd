extends Node

signal score_change(score_increment : int)
signal pause()

var score = 0

func _ready() -> void:
	score_change.connect(update_score)
	
func _process(delta : float) -> void:
	if Input.is_action_just_pressed("pause"):
		pause.emit()
		get_tree().paused = !get_tree().paused

func update_score(score_increment : int) -> void:
	score += score_increment
	
