extends Node2D

@export var _item: Item = null

func set_item(item: Item) -> void:
	_item = item
	$Sprite2D.texture = item.item_texture

func _ready() -> void:
	if _item:
		set_item(_item)

func _process(_delta: float) -> void:
	if Globals.player.global_position.distance_to(global_position) < 30:
		if not $Label.visible:
			$Label.visible = true
		
		if Input.is_action_just_pressed("action_collect"):
			Globals.player_hand.set_item(_item)
			queue_free()
		return
	if $Label.visible:
		$Label.visible = false
