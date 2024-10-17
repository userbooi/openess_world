extends Node2D
signal end_cutscene

@onready var scene = $scene
@onready var label = $Label
@onready var instruction = $instruction

var scene_num = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	scene.self_modulate.a = 0
	label.self_modulate.a = 0
	label.position = Vector2(200, 520)
	instruction.self_modulate.a = 0

func update_scene():
	if scene_num < 7:
		if scene_num == 1:
			scene.texture = ResourceLoader.load("res://Sprites/opening_scene/scene1.png")
			label.text = "There once was a guy whos goes by the name \"Openess\""
		elif scene_num == 2:
			scene.texture = ResourceLoader.load("res://Sprites/opening_scene/scene2.png")
			label.text = "He has many aspirations, but most of all..."
		elif scene_num == 3:
			scene.texture = ResourceLoader.load("res://Sprites/opening_scene/scene3.png")
			label.text = "He loved Burgers"
		elif scene_num == 4:
			scene.texture = ResourceLoader.load("res://Sprites/opening_scene/scene4.png")
			label.text = "However, The Menace likes it too"
		elif scene_num == 5:
			scene.texture = ResourceLoader.load("res://Sprites/opening_scene/scene5.png")
			label.text = "And he vows to keep all the burgers for himself"
		else:
			scene.texture = null
			label.position.y = 300
			label.text = "For Openess, however, he will get his burgers back"

		await get_tree().create_timer(0.5).timeout
		$AnimationPlayer.play("fade_in")
		
		get_parent().game_state = get_parent().STATE.OPENING
	else:
		await get_tree().create_timer(1.5).timeout
		end_cutscene.emit()
	
func out():
	scene_num += 1
	$AnimationPlayer.play("fade_out")
	await get_tree().create_timer(2).timeout
	
	update_scene()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
