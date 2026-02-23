extends Marker2D
class_name PlayerHand

var equipped_item: Item = null
var equipped_item_reference: WeaponTemplate = null

func _ready() -> void:
	Globals.player_hand = self

func set_item(item: Item) -> void:
	for i in get_children():
		i.queue_free()
	if item.item_scene:
		equipped_item_reference = item.item_scene.instantiate()
		add_child(equipped_item_reference)
	else:
		var sprite = Sprite2D.new()
		sprite.texture = item.item_texture
		add_child(sprite)
	equipped_item = item

func _process(_delta: float) -> void:
	if equipped_item:
		if Input.is_action_pressed("action"):
			if equipped_item_reference:
				equipped_item_reference.action()
