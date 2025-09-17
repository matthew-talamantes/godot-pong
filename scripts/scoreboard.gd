extends CanvasLayer


@onready var playerLabel: Label = $CenterContainer/GridContainer/PlayerScore
@onready var opponentLabel: Label = $CenterContainer/GridContainer/OpponentScore

func _ready() -> void:
	playerLabel.text = "0"
	opponentLabel.text = "0"

func update_player_score(score: int) -> void:
	playerLabel.text = str(score)

func update_opponent_score(score: int) -> void:
	opponentLabel.text = str(score)

func reset_scores() -> void:
	playerLabel.text = "0"
	opponentLabel.text = "0"

func update_scores() -> void:
	playerLabel.text = str(Globals.player_score)
	opponentLabel.text = str(Globals.opponent_score)
