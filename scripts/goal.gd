extends Area2D

enum GoalSide { PLAYER, OPPONENT }
@export var side: GoalSide = GoalSide.PLAYER

@onready var collisionShape: CollisionShape2D = $CollisionShape2D

signal ball_scored(side: GoalSide)

func _ready() -> void:
	collisionShape.disabled = true
	
	var shape: WorldBoundaryShape2D = collisionShape.shape.duplicate_deep()
	collisionShape.shape = shape
	if side == GoalSide.PLAYER:
		collisionShape.shape.set_normal(Vector2.RIGHT)
	else:
		collisionShape.shape.set_normal(Vector2.LEFT)
	
	await get_tree().create_timer(0.2).timeout
	collisionShape.disabled = false



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("ball"):
		if side == GoalSide.PLAYER:
			Globals.opponent_score += 1
			emit_signal("ball_scored", GoalSide.PLAYER)
		else:
			Globals.player_score += 1
			emit_signal("ball_scored", GoalSide.OPPONENT)