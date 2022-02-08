extends Area2D

signal on_collision_player

func get_class(): return "EnemyBullet"

onready var sprite := $Sprite
onready var collision := $CollisionShape2D

export(float) var speed = 0.0
export(float) var damage = 0.0

var velocity = Vector2(-1.0, 0.0)

func _ready():
	pass

func _process(delta):
	self.velocity.y += self.gravity * delta
	self.position += self.velocity.normalized() * self.speed * delta
	
	_check_bounds()

func _check_bounds():
	if self.global_position.x >= 480 + 50:
		_free_bullet()
	elif self.global_position.x < -50:
		_free_bullet()
	elif self.global_position.y < -50:
		_free_bullet()
	elif self.global_position.y >= 270 + 50:
		_free_bullet()

func _free_bullet():
	get_parent().queue_free()
	
func _on_bullet_area_entered(area):
	# Player collision
	emit_signal("on_collision_player", self, area)
	_free_bullet()

"""
func disable():
	$CollisionShape2D.disabled = true
	visible = true
	set_process(false)

func enable():
	$CollisionShape2D.disabled = false
	visible = true
	set_process(true)
"""
