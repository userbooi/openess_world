extends Control
signal start_game

@onready var title_label = $Title
@onready var start_button = $Start
@onready var credit_label = $credits

# Called when the node enters the scene tree for the first time.
func _ready():
	title_label.position = Vector2(166.5, 292.5)
	title_label.self_modulate.a = 0
	start_button.position = Vector2(-301.44, 271)
	credit_label.position = Vector2(-382.93, 424.32)

func start_menu_construction():
	$AnimationPlayer.play("start_up")
	await get_tree().create_timer(3.5).timeout
	
	get_parent().game_state = get_parent().STATE.START_MENU

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	if get_parent().game_state == get_parent().STATE.START_MENU:
		start_game.emit()
