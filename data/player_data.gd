class_name PlayerData
extends Resource

#signal player_changed(new_player: Player, old_player: Player)
#signal inventory_changed(new_inventory: Inventory, old_inventory: Inventory)

var player : Player#:
	#set(value):
		#if(player == value):
			#return
		#var last_player = player
		#player = value
		#player_changed.emit(player, last_player)
var inventory: Inventory#:
	#set(value):
		#if(inventory == value):
			#return
		#var last_inventory = inventory
		#inventory = value
		#inventory_changed.emit(inventory, last_inventory)

