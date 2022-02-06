extends Area2D

signal on_collision_enemy
signal on_collision_wall

func get_class(): return "Bullet"

export(float) var speed = 300.0
export(Vector2) var velocity = Vector2(0, 0)
export(float) var rateOfFire = 50.0

func _ready():
	pass

func _process(delta):
	self.velocity.y += self.gravity * delta
	
	self.position += self.velocity.normalized() * self.speed * delta
	
	self.rotation = self.velocity.angle()

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

func _on_bullet_area_entered(area):
	# Enemies collision
	emit_signal("on_collision_enemy", self, area)
	_free_bullet()

func _on_bullet_body_entered(body):
	# Level walls collision
	emit_signal("on_collision_wall", self, body)
	_free_bullet()
