extends CharacterBody2D

# Shared stats
@export var speed = 50
@export var health = 3

# Reference to player
var player = null


func _ready():
	# TODO:
	# Find player using groups instead of hardcoded paths
	pass


func _physics_process(delta):
	
	# TODO:
	# Move toward player
	# This should replace duplicated movement logic
	
	pass


func move_toward_player():
	
	# TODO:
	# Calculate direction
	# Apply velocity
	# Move enemy
	
	pass


func take_damage(amount):
	
	# TODO:
	# Reduce health
	# Check if enemy dies
	
	pass


func die():
	
	# TODO:
	# Remove enemy from scene
	
	pass
