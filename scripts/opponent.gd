extends CharacterBody2D


@export var speed: float = 400.0
var target_position: float = 0.0
var viewportHeight: float
var viewportWidth: float
var opponentHeight: float
var xPosition: float

func _ready() -> void:
	# Connect to the ball's position_changed signal
	var ball = get_node("/root/Map/Ball")
	ball.connect("position_changed", Callable(self, "_on_ball_position_changed"))
	viewportHeight = get_viewport().get_visible_rect().size.y
	viewportWidth = get_viewport().get_visible_rect().size.x
	opponentHeight = $CollisionShape2D.shape.extents.y
	xPosition = viewportWidth - 20.0

func _on_ball_position_changed(new_position: Vector2) -> void:
	target_position = new_position.y

func _physics_process(delta: float) -> void:
	position.x = xPosition
	velocity.y = (target_position - position.y) * speed * delta
	velocity.x = 0
	# Clamp the opponent's position within the screen bounds
	position.y = clamp(position.y, opponentHeight, viewportHeight - opponentHeight)
	move_and_slide()
