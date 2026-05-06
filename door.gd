extends Area2D

var unlocked = false
var player_near = false

@onready var escape_label = get_parent().get_node("CanvasLayer/EscapeLabel")


func _ready():
	visible = false
	monitoring = false
	
	# hide message at start
	escape_label.visible = false


func unlock():
	unlocked = true
	visible = true
	monitoring = true


func _on_body_entered(body):
	if body.is_in_group("player"):
		player_near = true


func _on_body_exited(body):
	if body.is_in_group("player"):
		player_near = false


func _process(delta):
	if unlocked and player_near:
		if Input.is_action_just_pressed("interact"):
			escape_label.visible = true
			escape_label.text = "You Escaped!"
