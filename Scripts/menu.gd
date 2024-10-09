extends Control

@onready var v_box_container: VBoxContainer = $VBoxContainer
@onready var v_box_container_2: VBoxContainer = $VBoxContainer2

func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_1.tscn")


func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_2.tscn")


func _on_start_pressed() -> void:
	v_box_container.visible = false
	v_box_container_2.visible = true


func _on_exit_pressed() -> void:
	get_tree().quit()
