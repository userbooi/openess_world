extends CharacterBody2D

@export var inv:Inv

@export var speed = 300.0
@export var decel = 300.0

var idle_facing = "s"
var walk_facing = "s"
var move = false

func _process(delta):
	if velocity.is_equal_approx(Vector2.ZERO):
		if idle_facing == "s":
			$AnimatedSprite2D.play("idle_s")
		elif idle_facing == "n":
			$AnimatedSprite2D.play("idle_n")
		elif idle_facing == "e":
			$AnimatedSprite2D.play("idle_e")
		else:
			$AnimatedSprite2D.play("idle_w")
	else:
		if walk_facing == "s":
			$AnimatedSprite2D.play("walk_s")
		elif walk_facing == "n":
			$AnimatedSprite2D.play("walk_n")
		elif walk_facing == "e":
			$AnimatedSprite2D.play("walk_e")
		else:
			$AnimatedSprite2D.play("walk_w")

func _physics_process(delta):
	if move:
		var direction = Input.get_vector("left", "right", "up", "down")
		
		if direction == Vector2(0, 1):
			walk_facing = "s"
			idle_facing = "s"
		elif direction == Vector2(0, -1):
			walk_facing = "n"
			idle_facing = "n"
		elif direction == Vector2(1, 0) or direction == Vector2(1, -1).normalized() or direction == Vector2(1, 1).normalized():
			walk_facing = "e"
			idle_facing = "e"
		elif direction == Vector2(-1, 0) or direction == Vector2(-1, 1).normalized() or direction == Vector2(-1, -1).normalized():
			walk_facing = "w"
			idle_facing = "w"
		
		velocity = direction * speed * 50 * delta
		
		move_and_slide()
		
func collect(item):
	for slot in range(inv.items.size()):
		if !inv.items[slot].item:
			inv.items[slot].item = item
			inv.items[slot].amount = 1
		elif inv.items[slot].amount <= 99 and inv.items[slot].item == item:
			inv.items[slot].amount += 1
		return true
	return false
