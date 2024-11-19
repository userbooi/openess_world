extends Node2D

@onready var bamboo = preload("res://inventory/items/bamboo/bamboo_collectable.tscn")
@export var max_bamboo = 5

enum STATE {OPENING, START_MENU, PLAYING, TRANSITION}

@export var game_state = STATE.OPENING

# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect.self_modulate.a = 1
	$Player/Camera2D.enabled = false
	if game_state == STATE.OPENING:
		$Cutscenes.update_scene()
	elif game_state == STATE.START_MENU:
		game_state = STATE.TRANSITION
		$StartMenu.start_menu_construction()
	else:
		set_up_game()
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("continue") and game_state == STATE.OPENING:
		game_state = STATE.TRANSITION
		$Cutscenes.out()

func add_bamboo():
	var count = 1
	while count <= max_bamboo:
		var bamboo_child = bamboo.instantiate()
		bamboo_child.position.x = randf_range(0, 1152)
		bamboo_child.position.y = randf_range(0, 648)
		
		add_child(bamboo_child)
		
		count += 1

func _on_cutscenes_end_cutscene():
	$StartMenu.start_menu_construction()

func set_up_game():
	$Cutscenes.self_modulate.a = 0
	$ColorRect.modulate.a = 0
	$StartMenu.modulate.a = 0
	# create the bamboos
	add_bamboo()
	$Player.move = true
	$Player/Camera2D.enabled = true

func _on_start_menu_start_game():
	set_up_game()
