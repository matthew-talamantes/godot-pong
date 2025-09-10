extends CharacterBody2D

var targetPosition: float = 0.0
var xPosition: float = 0.0
var playerHeight: float
var viewportHeight: float

@onready var collider = $CollisionShape2D

func _ready() -> void:
	viewportHeight = get_viewport().get_visible_rect().size.y
	targetPosition = viewportHeight / 2.0
	position.y = targetPosition
	xPosition = position.x
	playerHeight = collider.shape.extents.y

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and not Globals.paused:
		targetPosition += event.screen_relative.y
		targetPosition = clamp(targetPosition, playerHeight, viewportHeight - playerHeight)

func _physics_process(_delta: float) -> void:
	position.x = xPosition
	position.y = targetPosition
