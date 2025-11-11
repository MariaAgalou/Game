extends Button

func _ready():
	modulate.a = 0  # Make the button fully transparent
	mouse_filter = Control.MOUSE_FILTER_STOP  # Ensure it detects input
	connect("mouse_entered", _on_mouse_entered)
	connect("mouse_exited", _on_mouse_exited)

func _pressed():
	print("Hello World!")

func _on_mouse_entered():
	modulate.a = 1  # Show button when hovered

func _on_mouse_exited():
	modulate.a = 0  # Hide button when not hovered

func _process(delta):
	pass 
