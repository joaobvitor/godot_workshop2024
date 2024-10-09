extends CanvasLayer

@onready var rich_text_label: RichTextLabel = $RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Game.score_change.connect(update_score)
	rich_text_label.text = "[font_size=30]Score: " + str(Game.score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_score(score_increment : int) -> void:
	rich_text_label.text = "[font_size=30]Score: " + str(Game.score)
