extends Area2D

class_name BaseItem

signal on_collision
signal on_out_screen

onready var sprite := $Sprite
onready var itemAnimation := $AnimationPlayer
onready var externalAnimation := $ExternalAnimationPlayerItem

export(Global.ItemType) var type = Global.ItemType.ITEM_NONE

func _ready():
	self.externalAnimation.play("item")
	
	connect("area_entered", self, "_on_area_entered")
	
	if self.itemAnimation:
		self.itemAnimation.play("item")

func _process(delta):
	# Out of screen
	if self.global_position.x < -50 or self.global_position.y < -50 or self.global_position.y >= ProjectSettings.get_setting("narium/engine/ai_action").y:
		queue_free()
		emit_signal("on_out_screen", self)

func _on_area_entered(area):
	emit_signal("on_collision", self, area)
