extends Control

@onready var top: Control = $Top
@onready var right: Control = $Right
@onready var bottom: Control = $Bottom
@onready var left: Control = $Left

@onready var upper_left_corner: Control = $UpperLeftCorner
@onready var upper_right_corner: Control = $UpperRightCorner
@onready var bottom_right_corner: Control = $BottomRightCorner
@onready var bottom_left_corner: Control = $BottomLeftCorner

var resizing : bool = false
var resize_node : Control
var initial_window_pos: Vector2i
var initial_window_size: Vector2i
var initial_mouse_pos: Vector2

func _ready() -> void:
	var handles : Array[Control] = [
		top, bottom, right, left, 
		upper_left_corner, upper_right_corner, 
		bottom_right_corner, bottom_left_corner
	]
	
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
		#if resize_node in [top, upper_left_corner]:
			#get_window().size.y = int(get_global_mouse_position().y)
		#if resize_node in [left, upper_left_corner]:
			#get_window().size.x = int(get_global_mouse_position().x)
		#
		#if resize_node in [top, upper_right_corner]:
			#get_window().size.y = int(get_global_mouse_position().y)
		#if resize_node in [right, upper_right_corner]:
			#get_window().size.x = int(get_global_mouse_position().x)
		
		if resize_node in [bottom, bottom_right_corner]:
			get_window().size.y = int(get_global_mouse_position().y)
		if resize_node in [right, bottom_right_corner]:
			get_window().size.x = int(get_global_mouse_position().x)
		
		if resize_node in [bottom, bottom_left_corner]:
			get_window().size.y = int(get_global_mouse_position().y)
		if resize_node in [left, bottom_left_corner]:
			get_window().size.x = int(get_global_mouse_position().x)
