extends Panel

@onready var close: Button = $TitleBarBackground/Close

var moving : bool = false
var mouse_initial : Vector2i

func _ready() -> void:
	close.pressed.connect(_on_close_pressed)

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			moving = !moving
			mouse_initial = get_viewport().get_mouse_position()

func _process(_delta: float) -> void:
	if moving:
		var mouse_now = Vector2i(get_viewport().get_mouse_position())
		get_window().position += mouse_now - mouse_initial

func _on_close_pressed():
	get_tree().quit()
