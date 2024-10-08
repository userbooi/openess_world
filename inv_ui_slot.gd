extends Panel

@onready var item_visual: Sprite2D = $CenterContainer/Panel/item_display
@onready var num_item_label: Label = $CenterContainer/Panel/Label

func update(item:InvSlot):
	if !item.item:
		item_visual.visible = false
	else:
		item_visual.visible = true
		item_visual.texture = item.item.texture
		num_item_label.text = str(item.amount)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
