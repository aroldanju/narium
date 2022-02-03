extends Area2D

export(float) var speed = 300.0
export(Vector2) var velocity = Vector2(0, 0)
export(float) var rateOfFire = 50.0

func _ready():
	pass

func _process(delta):
	self.position += self.velocity.normalized() * self.speed * delta
	
	if self.position.x >= get_viewport().size.x:
		_free_bullet()
	elif self.position.x < 0:
		_free_bullet()
	elif self.position.y < 0:
		_free_bullet()
	elif self.position.y >= get_viewport().size.y:
		_free_bullet()

func _free_bullet():
	get_parent().queue_free()
