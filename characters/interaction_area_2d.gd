extends Area2D

@export var interactor : Node2D
@export var interaction_action : StringName = "interact"
@export var add_com_action : StringName = "add_com"

var selected_interactable : Interactable
var nerby_interatables : Array[Interactable]

func _ready():
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)
	
func _process(delta):
	_set_selected_interactable_to_closest()
			
			
func _input(event : InputEvent):
	if(event.is_action_pressed(interaction_action)):
		if(selected_interactable != null):
			selected_interactable.interact(interactor)
	if(event.is_action_pressed(add_com_action)):
		if(selected_interactable != null):
			selected_interactable.add_com(interactor)
			
		
func _on_area_entered(area : Area2D):
	if(area is Interactable):
		nerby_interatables.push_back(area)
		
		if(selected_interactable == null):
			selected_interactable = nerby_interatables[0]
			print(selected_interactable)
			
func _on_area_exited(area : Area2D):
	if(area is Interactable):
		nerby_interatables.erase(area)
	
	selected_interactable.stop_interaction(interactor)
	
	if(nerby_interatables.size() > 0):
		selected_interactable = nerby_interatables[0]
	else:
		selected_interactable = null
	
func _set_selected_interactable_to_closest():
	if(nerby_interatables.size() > 0):
		var closest_distance : float = INF
		var closest_interactable : Interactable
		for interactable in nerby_interatables:
			var distance_to_interactable = interactor.global_position.distance_to(interactable.global_position)
			if(distance_to_interactable < closest_distance):
				closest_distance = distance_to_interactable
				closest_interactable = interactable
		selected_interactable = closest_interactable





	
	
