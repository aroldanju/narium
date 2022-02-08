extends Area2D

signal on_collision
signal on_free

class_name Asteroid

func get_class(): return "Asteroid"

onready var sprite := $Sprite
onready var collision := $CollisionPolygon2D
onready var animationHit := $AnimationPlayer

export(int) var score = 100
export(float) var rotationSpeed = 10.0
export(float) var movementSpeed = 50.0
export(Vector2) var velocity = Vector2(0, 0)
export(Global.AsteroidType) var type = Global.AsteroidType.ASTEROID_LARGE setget set_type, get_type
export(float) var strength = 10

func _ready():
	pass

func set_type(t):
	type = t
	
	match self.type:
		Global.AsteroidType.ASTEROID_LARGE:
			self.strength = 16
			self.score = ProjectSettings.get_setting("narium/scores/large_asteroid")
		Global.AsteroidType.ASTEROID_MEDIUM:
			self.strength = 8
			self.score = ProjectSettings.get_setting("narium/scores/medium_asteroid")
		Global.AsteroidType.ASTEROID_SMALL:
			self.strength = 4
			self.score = ProjectSettings.get_setting("narium/scores/small_asteroid")

func get_type():
	return type

func _process(delta):
	if global_position.x <= 480 + 50:
		rotate(deg2rad(self.rotationSpeed) * delta)
		# Move container
		get_parent().position += self.velocity.normalized() * self.movementSpeed * delta
		
		if global_position.x < -50 or global_position.y < -50 or global_position.y > 270 + 50:
			queue_free()

func _on_AsteroidEnemy_area_entered(area):
	if area.get_class() != "Bullet":
		emit_signal("on_collision", self, area)

func hit(damage):
	self.animationHit.play("hit")
	self.strength -= damage
	if self.strength <= 0:
		_on_destroy()
		return true
	
	return false

func enable():
	visible = true
	$CollisionPolygon2D.disabled = false

func disable():
	visible = false
	$CollisionPolygon2D.disabled = true

func _on_destroy():
	queue_free()

