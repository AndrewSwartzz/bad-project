extends CharacterBody2D

var speed = 100
var health = 5
var bugs = 0

@onready var door = get_parent().get_node("Door")
@onready var bug_label = get_parent().get_node("CanvasLayer/Label")


func _physics_process(delta):

	# Movement logic
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed

	if Input.is_action_pressed("ui_down"):
		velocity.y = speed
	elif Input.is_action_pressed("ui_up"):
		velocity.y = -speed

	move_and_slide()

	# BAD: player controlling progression system
	if bugs >= 4:
		door.visible = true
		door.monitoring = true

	# BAD: player handling door interaction
	if Input.is_action_just_pressed("interact"):
		if global_position.distance_to(door.global_position) < 50:
			get_tree().change_scene_to_file("res://outside.tscn")


func _on_area_entered(body):

	# BAD: string comparisons
	if body.name == "enemy":
		health -= 1

		if health <= 0:
			get_tree().reload_current_scene()

	# BAD: collection logic inside player
	if body.name == "bug":
		bugs += 1
		body.queue_free()

	# BAD: UI logic inside player
	bug_label.text = "Bugs: " + str(bugs)
