extends Area2D

signal on_collision

class_name Asteroid

func get_class(): return "Asteroid"

onready var sprite := $Sprite
onready var collision := $CollisionPolygon2D
onready var animationHit := $AnimationPlayer

export(float) var rotationSpeed = 10.0
export(float) var movementSpeed = 50.0
export(Vector2) var velocity = Vector2(0, 0)

func _ready():
	pass

func _process(delta):
	rotate(deg2rad(self.rotationSpeed) * delta)
	self.position += self.velocity.normalized() * self.movementSpeed * delta

func _on_AsteroidEnemy_area_entered(area):
	if area.get_class() != "Bullet":
		emit_signal("on_collision", self, area)

func hit():
	self.animationHit.play("hit")
