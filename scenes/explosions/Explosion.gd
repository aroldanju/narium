extends Node2D

class_name Explosion

onready var animation := $ExplosionAnimation

export(Global.ExplosionType) var type = Global.ExplosionType.EXPLOSION_YELLOW_LARGE setget set_type, get_type

func _ready():
	pass

func _on_AnimationPlayer_animation_finished(anim_name):
	print("_on_AnimationPlayer_animation_finished: " + anim_name)
	queue_free()

func set_type(t):
	type = t
	_create_explosion()

func get_type():
	return type

func explode():
	print("explode")
	#$xplosionAnimation").play("explode")
	#$ExplosionAnimation.play("explode")
	
	print("CHILDREN: " + String(get_child_count()))
	
	for chil in get_children():
		print(chil)
		
	#get_node("ExplosionAnimation").play("explode")
	get_node("ExplosionAnimation").play("explode")
	print(get_node("ExplosionAnimation"))
	#self.animation.play("explode")
	

func _create_explosion():
	print("_create_explosion")
	var sprite = get_node("Sprite")
	sprite.texture = _get_texture_by_explosion_type(self.type)
		#self.texture = tex
	#	self.hframes = 7
	#self.vframes = 1
	
func _get_texture_by_explosion_type(type):
	var asset = "res://assets/images/explosions/"
	
	match type:
		Global.ExplosionType.EXPLOSION_YELLOW_LARGE:
			asset += "explosion_yellow_large.png"
		Global.ExplosionType.EXPLOSION_YELLOW_MEDIUM:
			asset += "explosion_yellow_medium.png"
		Global.ExplosionType.EXPLOSION_YELLOW_SMALL:
			asset += "explosion_yellow_small.png"
	
	return load(asset)
