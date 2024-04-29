class_name Orders
extends Interactable

@export var x: int = 1

func interact(user: Node2D):
	if(!global.fifo.is_empty()):
		print(global.fifo[0])
		global.fifo[0].queue_free()
		array_shift(global.fifo)
		change_position(global.fifo)
		global.x_pos += 15
	
	
func stop_interaction(user: Node2D):
	pass



func array_shift(array: Array):
	if(!array.is_empty()):
		for i in array.size():
			if(i == array.size()-1):
				array.pop_at(i)
			else:
				array[i] = array[i+1]
			
func change_position(array: Array):
	if(!array.is_empty()):
		for i in array.size():
			array[i].position.x += 15
