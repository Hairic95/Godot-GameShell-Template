extends Sprite


export (Texture) var normal_texture = null
export (Texture) var pressed_texture = null

export (String, "a_button", "b_button", "x_button", "y_button",
		"start_button", "select_button", "menu_button",
		"up_button", "down_button", "right_button", "left_button") var action_input = "a_button"

func _ready():
	texture = normal_texture

func _process(delta):
	if Input.is_action_pressed(action_input):
		if texture != pressed_texture:
			texture = pressed_texture
	else:
		if texture != normal_texture:
			texture = normal_texture
