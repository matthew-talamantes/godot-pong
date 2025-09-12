extends RigidBody2D

@export var initial_speed: float = 400.0
@export var gravityModifier: float = 0.0

# func _integrate_forces(_state: PhysicsDirectBodyState2D) -> void:
#     rotation_degrees = 0

func _ready() -> void:
	lock_rotation  = true
	randomize()
	if randi() % 2 == 0:
		initial_speed = -initial_speed
		gravity_scale = gravityModifier * -1.0
	apply_central_impulse(Vector2(initial_speed, 0))



func _on_body_entered(body: Node) -> void:
	print("Collided with: ", body.name)
	if body.is_in_group("player"):
		print("Hit Player")
		print("Gravity Scale Before: ", gravity_scale)
		gravity_scale = gravity_scale * -1.0
