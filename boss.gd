extends CharacterBody2D

var speed = 60
var health = 10

func _physics_process(delta):
	var player = get_parent().get_node("Player")
	var dir = (player.global_position - global_position).normalized()
	velocity = dir * speed
	move_and_slide()

func take_damage():
	health -= 1
	if health <= 0:
		queue_free()
