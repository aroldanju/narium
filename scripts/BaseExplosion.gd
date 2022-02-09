extends Node2D

class_name BaseExplosion

onready var sprite := $AnimatedSprite
onready var audio := $AudioStreamPlayer

func _ready():
	self.sprite.connect("animation_finished", self, "_on_animation_finished")

func _on_animation_finished():
	queue_free()

func explode():
	get_node("AnimatedSprite").play()
	get_node("AudioStreamPlayer").play()
