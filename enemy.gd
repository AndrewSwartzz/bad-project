extends CharacterBody2D


var speed = 60

func _physics_process(delta):
	var player = get_parent().get_node("Player")

	var dir = (player.global_position - global_position).normalized()
	velocity = dir * speed

	move_and_slide()
