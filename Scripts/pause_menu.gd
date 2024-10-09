extends CanvasLayer

@onready var color_rect: ColorRect = $ColorRect

func _ready() -> void:
	Game.pause.connect(_on_pause)

func _on_pause() -> void:
	color_rect.visible = !color_rect.visible
	
func _on_resume_pressed() -> void:
	get_tree().paused = !get_tree().paused
	color_rect.visible = false

func _on_back_pressed() -> void:
	get_tree().paused = !get_tree().paused
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
