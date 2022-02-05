extends Area2D

signal on_collision

func get_class(): return "Item"

onready var sprite := $Sprite
onready var animation := $AnimationPlayer

export(Global.ItemType) var type = Global.ItemType.ITEM_BEAM

func _ready():
	self.animation.play("item")

func _on_ItemBeam_area_entered(area):
	emit_signal("on_collision", self, area)
