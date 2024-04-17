class_name Player
extends CharacterBody2D

@export var move_speed : float = 2
@export var player_data : PlayerData # to co moze byc przekazane do innych obiektow
@export var inventory : Inventory
@export var hand_tscn: PackedScene # przedmiot w rece (jako scena)

@onready var animation_tree : AnimationTree = $AnimationTree
@onready var player_hand = $Hand/item

var input_direction : Vector2 = Vector2.ZERO


func _ready(): # przygotowanie animacji na start
	animation_tree.set("parameters/conditions/idle", true)
	var new_texture = preload("res://Art/Assets/objects/none.png")
	player_hand.texture = new_texture
	animation_tree.active = true
	call_deferred("_update_player_data")
		
func _physics_process(_delta):
	#ruch
	input_direction = Input.get_vector("left", "right", "up", "down").normalized()

	if input_direction:
		velocity = input_direction * move_speed # node ma juz velocity wiec nie trzeba definiowac
	else:
		velocity = Vector2.ZERO	
	
func update_animation_parameters(): # zmiana animacji wzgledem kierunku
	if(velocity == Vector2.ZERO):
		animation_tree["parameters/conditions/idle"] = true
		animation_tree["parameters/conditions/is_moving"] = false
	else:
		animation_tree["parameters/conditions/idle"] = false
		animation_tree["parameters/conditions/is_moving"] = true

	animation_tree["parameters/idle/blend_position"] =  input_direction
	animation_tree["parameters/walk/blend_position"] =  input_direction	
	
	if(input_direction.y == -1):
		player_hand.z_index = -1
	else:
		player_hand.z_index = 0
	
func _process(_delta): 
	update_animation_parameters()
	move_and_collide(velocity)
	

	
func _update_player_data():
	player_data.player = self
	player_data.inventory = inventory

