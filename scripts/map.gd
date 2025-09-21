extends Node2D

var ballScene: PackedScene = preload("uid://cq0iphrr2vvtt")
var opponentScene: PackedScene = preload("uid://caxkwchtoc7j5")

var ball: CharacterBody2D

@onready var scoreboard := $Scoreboard
@onready var mainMenu := $MainMenu


func start_game() -> void:
	Globals.paused = false
	mainMenu.visible = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if !Globals.ongoing_game:	
		Globals.ongoing_game = true
		scoreboard.reset_scores()
		ball = ballScene.instantiate()
		var opponent: CharacterBody2D = opponentScene.instantiate()
		add_child(ball)
		add_child(opponent)

func _ready() -> void:
	# Initialize game state
	Globals.paused = true
	mainMenu.visible = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		Globals.paused = not Globals.paused
		if Globals.paused:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _on_goal_2_ball_scored(_side: int) -> void:
	ball.set_ball()
	scoreboard.update_scores()

func _on_goal_ball_scored(_side: int) -> void:
	ball.set_ball()
	scoreboard.update_scores()