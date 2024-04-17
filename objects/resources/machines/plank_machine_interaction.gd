extends Interactable

@export var player_data : PlayerData

var plank_scene = preload("res://objects/resources/dropping/plank_dropped.tscn")

func interact(user: Node2D):
	if(player_data.inventory.hands_string != "wood"):
		return
	if(player_data.inventory.hands_string == "wood"):
		player_data.inventory.hands_string = "plank"
		player_data.player.hand_tscn = plank_scene
	update_hand()
	
func stop_interaction(user: Node2D):
	pass
	
func update_hand():
	var plank_texture = preload("res://Art/Assets/objects/plank.png")
	player_data.player.player_hand.texture = plank_texture

	
func _ready():
	$Label.visible = false
	
func _on_area_entered(area):
	$Label.visible = true

func _on_area_exited(area):
	$Label.visible = false


	
