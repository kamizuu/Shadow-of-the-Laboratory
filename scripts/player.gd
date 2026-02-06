class_name Player extends CharacterBody2D



var move_speed : float = 500.0

@onready var anim_sprite : AnimatedSprite2D = $Sprite
var last_anim := "look down"

func _ready():
	pass

func _process( _delta ):

	var direction : Vector2 = Vector2.ZERO
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")


	velocity = direction * move_speed

	if direction != Vector2.ZERO:
		if direction.x > 0 and direction.y < 0:
			last_anim = "look up right"
		elif direction.x < 0 and direction.y < 0:
			last_anim = "look up left"
		elif direction.x > 0 and direction.y > 0:
			last_anim = "look down right"
		elif direction.x < 0 and direction.y > 0:
			last_anim = "look down left"
		elif direction.x > 0:
			last_anim = "look right"
		elif direction.x < 0:
			last_anim = "look left"
		elif direction.y > 0:
			last_anim = "look down"
		elif direction.y < 0:
			last_anim = "look up"
		anim_sprite.animation = last_anim
		anim_sprite.play()
	elif (last_anim.ends_with("up right") or last_anim.ends_with("up left") or last_anim.ends_with("down left") or last_anim.ends_with("down right")):
		anim_sprite.animation = "look up"
		anim_sprite.play()
	else:
		anim_sprite.animation = last_anim.replace("look", "idle")
		anim_sprite.play()


func _physics_process( _delta ):
	move_and_slide()
