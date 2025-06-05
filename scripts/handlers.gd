extends Control

@onready var right: Control = $Right
@onready var bottom: Control = $Bottom
@onready var bottom_right_corner: Control = $BottomRightCorner

var resizing : bool = false
var resize_node : Control

func _ready() -> void:
	var handles : Array[Control] = [bottom, right, bottom_right_corner]
	
	for handle in handles:
		handle.gui_input.connect(
			func (event):
				if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
					_gui_input_handling(handle)
		)

func _gui_input_handling(node : Control):
	resizing = !resizing
	resize_node = node

func _process(_delta: float) -> void:
	if resizing:
		if resize_node in [bottom, bottom_right_corner]:
			get_window().size.y = int(get_global_mouse_position().y)
		if resize_node in [right, bottom_right_corner]:
			get_window().size.x = int(get_global_mouse_position().x)
