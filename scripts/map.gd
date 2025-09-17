extends Node2D

var ballScene: PackedScene = preload("uid://cq0iphrr2vvtt")
var opponentScene: PackedScene = preload("uid://caxkwchtoc7j5")

var ball: CharacterBody2D


func _ready() -> void:
	# Initialize game state
	Globals.paused = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

	ball = ballScene.instantiate()
	add_child(ball)
	var opponent: CharacterBody2D = opponentScene.instantiate()
	add_child(opponent)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		Globals.paused = not Globals.paused
		if Globals.paused:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _on_goal_2_ball_scored(_side: int) -> void:
	ball.set_ball()

func _on_goal_ball_scored(_side: int) -> void:
	ball.set_ball()