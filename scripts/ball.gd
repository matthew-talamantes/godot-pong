extends CharacterBody2D

var collision: KinematicCollision2D
signal position_changed(new_position: Vector2)

@export var initial_speed: float = 400.0

func _ready() -> void:
	randomize()
	if randi() % 2 == 0:
		initial_speed = -initial_speed
	velocity = Vector2(initial_speed, 0)


func _process(delta: float) -> void:
	emit_signal("position_changed", position)

func _physics_process(delta: float) -> void:
	collision = move_and_collide(velocity * delta)
	if collision:
		var normal = collision.get_normal()
		var colVelocity = collision.get_collider_velocity()
		if colVelocity != Vector2.ZERO:
			velocity += colVelocity
		velocity = velocity.bounce(normal)
