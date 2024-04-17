extends Interactable


@export var player_data : PlayerData

func interact(user: Node2D):
	player_data.inventory.hands_string = "empty"
	update_hand()


func update_hand():
	var none_texture = preload("res://Art/Assets/objects/none.png")
	player_data.player.player_hand.texture = none_texture
