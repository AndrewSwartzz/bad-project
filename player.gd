extends CharacterBody2D

var speed = 100
var health = 5
var bugs = 0

@onready var door = get_parent().get_node("Door")
@onready var bug_label = get_parent().get_node("CanvasLayer/Label")

# keeps track of nearby bug
var nearby_bug = null


func _physics_process(delta):

	# BAD movement logic (intentionally flawed for assignment)
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	else:
		velocity.x = 0

	if Input.is_action_pressed("ui_down"):
		velocity.y = speed
	elif Input.is_action_pressed("ui_up"):
		velocity.y = -speed
	else:
		velocity.y = 0

	move_and_slide()

	# BAD: player controlling progression system
	if bugs >= 3:
		if door.has_method("unlock"):
			door.unlock()

	# BAD: player handling door interaction
	if Input.is_action_just_pressed("interact"):
		
		# interact with nearby bug
		if nearby_bug:
			bugs += 1
			nearby_bug.queue_free()
			nearby_bug = null
			
			# BAD: UI logic inside player
			bug_label.text = "Bugs: " + str(bugs)

		


func _on_area_2d_body_entered(body):
		# BAD: string comparisons
	if body.name == "enemy":
		health -= 1

		if health <= 0:
			get_tree().reload_current_scene()

	if body.is_in_group("bug"):
		nearby_bug = body



func _on_area_2d_body_exited(body):
	if body == nearby_bug:
		nearby_bug = null
