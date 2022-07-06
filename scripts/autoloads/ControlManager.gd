extends Node

var gameshell_action_list = [
	{
		"action_button": "a_button",
		"action_key": KEY_J
	},
	{
		"action_button": "b_button",
		"action_key": KEY_K
	},
	{
		"action_button": "x_button",
		"action_key": KEY_U
	},
	{
		"action_button": "y_button",
		"action_key": KEY_I
	},
	{
		"action_button": "start_button",
		"action_key": KEY_ENTER
	},
	{
		"action_button": "select_button",
		"action_key": KEY_SPACE
	},
	{
		"action_button": "menu_button",
		"action_key": KEY_ESCAPE
	},
	{
		"action_button": "up_button",
		"action_key": KEY_UP
	},
	{
		"action_button": "right_button",
		"action_key": KEY_RIGHT
	},
	{
		"action_button": "left_button",
		"action_key": KEY_LEFT
	},
	{
		"action_button": "down_button",
		"action_key": KEY_DOWN
	},
]

func _ready():
	# Run this is the export has the "GameShell" feature
	if OS.has_feature("GameShell"):
		
		# For each forseen action, destroy the previous
		# action event and override it with the gameshell one
		for action in gameshell_action_list:
			InputMap.action_erase_events(action.action_button)
			var new_action_event : InputEventKey = InputEventKey.new()
			new_action_event.pressed = true
			new_action_event.scancode = action.action_key
			InputMap.action_add_event(action.action_button, new_action_event)


func _process(delta):
	# Comment if you want to handle the Menu/ESC button
	if OS.has_feature("GameShell") && Input.is_action_pressed("menu_button"):
		get_tree().quit()
