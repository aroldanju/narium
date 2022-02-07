extends PathFollow2D

export(float) var speed = 50.0

func _ready():
	pass # Replace with function body.

func _process(delta):
	set_offset(get_offset() + self.speed * delta)
	
