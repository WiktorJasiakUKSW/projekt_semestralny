class_name TableInteraction
extends Interactable
@export var player_data : PlayerData
@export var table_storage : TableStorage

func add_com(user: Node2D):
	
	var hand = player_data.player.inventory.hands_string 
	if(hand == "empty" or hand == "wood" or hand == "plank" or hand == "shavings"):
		pass
	else:
		if(hand == "big_component"):
			table_storage.b_com += 1
			player_data.player.inventory.hands_string = "empty"
			update_hand()
			get_node("making_table_ui/Control/req/big/n_in").text = str(table_storage.b_com)
		if(hand == "medium_component"):
			table_storage.m_com += 1
			player_data.player.inventory.hands_string = "empty"
			update_hand()
			get_node("making_table_ui/Control/req/medium/n_in").text = str(table_storage.m_com)
		if(hand == "small_component"):
			table_storage.s_com += 1 
			player_data.player.inventory.hands_string = "empty"
			update_hand()
			get_node("making_table_ui/Control/req/small/n_in").text = str(table_storage.s_com)
			
			
func interact(user: Node2D):
	$making_table_ui.visible = true
	
func stop_interaction(user: Node2D):
	$making_table_ui.visible = false
	
func update_hand():
	var none_texture = preload("res://Art/Assets/objects/none.png")
	player_data.player.player_hand.texture = none_texture

	
func _ready():
	$Label.visible = false
	$making_table_ui.visible = false
	
func _on_area_entered(area):
	$Label.visible = true

func _on_area_exited(area):
	$Label.visible = false


	
