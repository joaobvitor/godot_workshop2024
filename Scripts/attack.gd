extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	monitoring = false;


func _on_body_entered(body: Node2D) -> void:
	Game.score_change.emit(10)
	body.queue_free()
