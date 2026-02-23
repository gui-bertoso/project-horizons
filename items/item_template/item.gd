extends Resource
class_name Item

@export var item_name: String = ""
@export_enum("weapon", "armor", "acessory", "consumable") var item_type: String = ""
@export_enum("mellee", "mage", "fisher", "wizard", "paladin", "archer", "ranged", "bommet") var item_class: String = ""
@export var item_texture: CompressedTexture2D = null
@export var item_scene: PackedScene = null
