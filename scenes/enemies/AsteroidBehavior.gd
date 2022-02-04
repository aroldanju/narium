extends KinematicBody2D

signal on_collision

onready var sprite := $Sprite
onready var collision := $CollisionPolygon2D

export(float) var rotationSpeed = 10.0
export(float) var movementSpeed = 50.0
export(Vector2) var velocity = Vector2(0, 0)

func _ready():
	pass

func _process(delta):
	rotate(deg2rad(self.rotationSpeed) * delta)
	var collision = move_and_collide(self.velocity * self.movementSpeed * delta)
	
	if collision:
		emit_signal("on_collision", collision)
