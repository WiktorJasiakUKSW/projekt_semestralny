extends Interactable

@export var player_data : PlayerData

var chair_scene = preload("res://objects/resources/dropping/ready_products/chair_dropped.tscn")

func interact(user: Node2D):
	if(player_data.inventory.hands_string == "chair"):
		return
	if(player_data.inventory.hands_string == "empty"):
		player_data.inventory.hands_string = "chair"
		player_data.player.hand_tscn = chair_scene
	else:
		var dropped_item = player_data.player.hand_tscn.instantiate()
		player_data.player.get_parent().add_child(dropped_item)
		dropped_item.position.x = player_data.player.position.x
		dropped_item.position.y = player_data.player.position.y
		player_data.inventory.hands_string = "chair"
		player_data.player.hand_tscn = chair_scene
	
	update_hand()
	self.queue_free()
		
	
func stop_interaction(user: Node2D):
	pass
	
func update_hand():
	var chair_texture = preload("res://Art/Assets/objects/box.png")
	player_data.player.player_hand.texture = chair_texture
