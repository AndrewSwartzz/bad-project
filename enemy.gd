extends CharacterBody2D

var speed = 60
var health = 1

@onready var player = get_parent().get_node("Player")


func _physics_process(delta):
	var direction = (player.global_position - global_position).normalized()
	velocity = direction * speed
	move_and_slide()


func take_damage():
	health -= 1

	if health <= 0:
		queue_free()
