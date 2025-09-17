extends CharacterBody2D

var collision: KinematicCollision2D
var lastCollider: Object = null
signal position_changed(new_position: Vector2)

@export var initial_speed: float = 400.0
@export var maxSpeed: float = 800.0
@export var slowDownChance: float = 0.1

func _ready() -> void:
	randomize()
	set_ball()

func set_ball() -> void:
	velocity = Vector2.ZERO
	var viewportSize: Vector2 = get_viewport().get_visible_rect().size
	position = viewportSize / 2.0
	if randi() % 2 == 0:
		initial_speed = -initial_speed
	await get_tree().create_timer(1.0).timeout
	velocity = Vector2(initial_speed, 0)


func _process(_delta: float) -> void:
	emit_signal("position_changed", position)

func _physics_process(delta: float) -> void:
	collision = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()
		var normal = collision.get_normal()
		var colVelocity = collision.get_collider_velocity()
		if colVelocity != Vector2.ZERO:
			velocity += colVelocity
		velocity = velocity.bounce(normal)
		if collider.is_in_group("player") and collider != lastCollider:
			if randf() <= slowDownChance:
				if velocity.x > 0:
					velocity.x = initial_speed
				else:
					velocity.x = -initial_speed
				if velocity.y > 0:
					velocity.y = initial_speed
				elif velocity.y < 0:
					velocity.y = -initial_speed
					
		velocity = velocity.clampf(-maxSpeed, maxSpeed)
		if velocity.x == 0:
			velocity.x = initial_speed
		lastCollider = collider
