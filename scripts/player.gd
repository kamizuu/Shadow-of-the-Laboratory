class_name Player extends CharacterBody2D



var move_speed : float = 500.0

@onready var sprite : AnimatedSprite2D = $Sprite

func _ready():
	pass

func _process( _delta ):

	var direction : Vector2 = Vector2.ZERO
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")

<<<<<<< Updated upstream
	velocity = direction * move_speed
=======
	velocity = direction * move_speed

	if direction != Vector2.ZERO:
		if abs(direction.x) > abs(direction.y):
			if direction.x > 0:
				$AnimatedSprite2D.animation = "look right"
			else:
				$AnimatedSprite2D.animation = "look left"
		else:
			if direction.y > 0:
				$AnimatedSprite2D.animation = "look down"
			else:
				$AnimatedSprite2D.animation = "look up"
	
>>>>>>> Stashed changes

	pass


func _physics_process( _delta ):
<<<<<<< Updated upstream
	move_and_slide()
=======
	move_and_slide()
	
>>>>>>> Stashed changes
