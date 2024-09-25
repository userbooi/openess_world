extends CharacterBody2D


@export var speed = 300.0
@export var decel = 300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(delta):
	if velocity == Vector2.ZERO:
		$AnimatedSprite2D.play("idle")
	else:
		$AnimatedSprite2D.stop()

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	
	velocity = direction * speed * 50 * delta

	move_and_slide()
