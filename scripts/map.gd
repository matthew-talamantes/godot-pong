extends Node2D

func _ready() -> void:
    Globals.paused = false
    Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
    if event.is_action_pressed("pause"):
        Globals.paused = not Globals.paused
        if Globals.paused:
            Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
        else:
            Input.mouse_mode = Input.MOUSE_MODE_CAPTURED