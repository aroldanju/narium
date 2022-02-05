extends StaticBody2D

onready var sprite := $Sprite
onready var animation := $AnimationPlayer

export(Global.ItemType) var type = Global.ItemType.ITEM_BEAM

func _ready():
	self.animation.play("item")
