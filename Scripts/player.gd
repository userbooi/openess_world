extends CharacterBody2D


@export var speed = 300.0
@export var decel = 300.0

var idle_facing = "s"
var walk_facing = "s"

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

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
