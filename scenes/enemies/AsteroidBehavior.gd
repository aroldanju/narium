extends StaticBody2D

onready var sprite := $Sprite
onready var collision := $CollisionPolygon2D

export(float) var rotationSpeed = 10.0
export(float) var movementSpeed = 50.0
export(Vector2) var velocity = Vector2(0, 0)

func _ready():
	pass

func _process(delta):
	rotate(deg2rad(self.rotationSpeed) * delta)
	self.position += self.velocity.normalized() * self.movementSpeed * delta

"""
	move_and_slide(self.velocity * self.movementSpeed)
	for i in range(get_slide_count()):
		var collision = get_slide_collision(i)
		emit_signal("on_collision", collision)
"""
