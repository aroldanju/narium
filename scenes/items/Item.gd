extends Area2D

signal on_collision

onready var sprite := $Sprite
onready var animation := $AnimationPlayer

func _ready():
	self.animation.play("item")

func _on_ItemBeam_area_entered(area):
	emit_signal("on_collision", self, area)
