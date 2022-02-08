extends PathFollow2D

export(float) var speed = 50.0

func _ready():
	pass # Replace with function body.

func _process(delta):
	pass
	"""
	if global_position.x <= 480 + 50:
		set_offset(get_offset() + self.speed * delta)
	"""
	
