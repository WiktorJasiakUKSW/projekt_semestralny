extends Interactable

@export var player_data : PlayerData

func interact(user: Node2D):
	if(player_data.inventory.hands_string == "wood" or player_data.inventory.hands_string == "empty"):
		return
	if(player_data.inventory.hands_string == "plank"):
		player_data.inventory.hands_string = "big_component"
		var big_component_scene = preload("res://objects/resources/dropping/big_component_dropped.tscn")
		player_data.player.hand_tscn = big_component_scene
	elif(player_data.inventory.hands_string == "big_component"):
		player_data.inventory.hands_string = "medium_component"
		var medium_component_scene = preload("res://objects/resources/dropping/medium_component_dropped.tscn")
		player_data.player.hand_tscn = medium_component_scene
	elif(player_data.inventory.hands_string == "medium_component"):
		player_data.inventory.hands_string = "small_component"
		var small_component_scene = preload("res://objects/resources/dropping/small_component_dropped.tscn")
		player_data.player.hand_tscn = small_component_scene
	elif(player_data.inventory.hands_string == "small_component"):
		player_data.inventory.hands_string = "shavings"
		var shavings_scene = preload("res://objects/resources/dropping/shavings_dropped.tscn")
		player_data.player.hand_tscn = shavings_scene
	update_hand()
	
func stop_interaction(user: Node2D):
	pass
	
func update_hand():
	if(player_data.inventory.hands_string == "big_component"):
		var big_component_texture = preload("res://Art/Assets/objects/big_component.png")
		player_data.player.player_hand.texture = big_component_texture
	elif(player_data.inventory.hands_string == "medium_component"):
		var medium_component_texture = preload("res://Art/Assets/objects/medium_component.png")
		player_data.player.player_hand.texture = medium_component_texture
	elif(player_data.inventory.hands_string == "small_component"):
		var small_component_texture = preload("res://Art/Assets/objects/small_component.png")
		player_data.player.player_hand.texture = small_component_texture
	elif(player_data.inventory.hands_string == "shavings"):
		var shavings_texture = preload("res://Art/Assets/objects/shavings.png")
		player_data.player.player_hand.texture = shavings_texture

	
func _ready():
	$Label.visible = false
	
func _on_area_entered(area):
	$Label.visible = true

func _on_area_exited(area):
	$Label.visible = false


	
