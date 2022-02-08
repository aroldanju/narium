extends Area2D

class_name BaseEnemy
func get_class(): return "Enemy"

signal on_collision
signal on_out_screen
signal on_destroy
signal on_damage

var Bullet = preload("res://scenes/bullets/enemy/BulletEnemy.tscn")

export(float) var rotateSpeed = 0.0
export(float) var speed = 40.0
export(Vector2) var velocity = Vector2(-1, 0)
export(int) var score = 100
export(int) var strength = 5

onready var sprite := $Sprite
#onready var collision := $CollisionPolygon2D
onready var animationHit := $AnimationHit

var level = null
var path = null

func _ready():
	# Set path
	if get_parent() is PathFollow2D:
		self.path = get_parent()
	
	connect("area_entered", self, "_on_area_entered")

func _process(delta):
	if self.global_position.x <= ProjectSettings.get_setting("narium/engine/ai_action").x:
		var step = self.speed * delta
		
		if self.path:
			self.path.offset += step
		else:
			self.position += self.velocity.normalized() * self.speed * delta
			rotate(deg2rad(self.rotateSpeed) * delta)
	
	# Out of screen
	if self.global_position.x < -50 or self.global_position.y < -50 or self.global_position.y >= ProjectSettings.get_setting("narium/engine/ai_action").y:
		queue_free()
		emit_signal("on_out_screen", self)

func _on_area_entered(area):
	if area.get_class() == "Player":
		emit_signal("on_collision", self, area)

func shoot(bulletType, velocity):
	var bullet = Bullet.instance()
	bullet.create(self, bulletType)
	bullet.velocity = velocity
	self.level.add_child(bullet)
	bullet.connect("on_collision", self.level, "_on_bullet_collision")

func hit(damage):
	self.animationHit.play("hit")
	self.strength -= damage
	
	emit_signal("on_damage", self, damage)
	
	if self.strength <= 0:
		queue_free()
		emit_signal("on_destroy", self)
