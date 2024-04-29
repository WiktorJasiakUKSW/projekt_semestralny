## Dokumentacja klas i pól
class_name AutoDocumentation extends Node
## 
# player
# Player
var player_data : PlayerData ## dane gracza przekazywane do innych scen [player]
var inventory : Inventory ## węzeł przechowujący ekwipunek gracza [player]
var hand_tscn: PackedScene ## przedmiot trzymany w rece przechowywany w formie sceny, niezbędne do stworzenia obiektu wyrzuconego przedmiotu na ziemię [player]
# InteractionArea
var selected_interactable : Interactable ## najbliższy obiekt możliwy do interakcji [player]
var nerby_interatables : Array[Interactable] ## tablica z dostępnymi w obszarze interakcji obiektami do interakcji [player]



## sprawdza wartość w wektorze i w zależności od wartości zmienia animacje [player]
func update_animation_parameters(): 
	pass
## wybiera najbliższy obiekt do interakcji z możliwych w obszarze [player] 
func _set_selected_interactable_to_closest():
	pass
## funkcja nadpisywana przez każdy obiekt interaktywny
func interact(user: Node2D):
	pass
## opcjonalne akcje wykonywane po zakończeniu interakcji z obiektem, funkcja nadpisywana przez ka zdy obiekt interaktywny
func stop_interaction(user: Node2D):
	pass
## akcja wykonywana, lub możliwa do wykonania po wejściu do obszaru obiektu 	
func _on_area_entered(area):
	pass
## akcja wykonywana, lub możliwa do wykonania po wyjściu z obszaru obiektu 
func _on_area_exited(area):
	pass
## zmiana przedmiotu w ręce w zależności od interakcji, funkcja nadpisywana
func update_hand():
	pass
## dodawanie komponentów do stołu służącego do robienia mebli
func add_com(user: Node2D):
	pass
## zmiana wybranego przedmiotu do zrobienia przy stole stolarskim
func switchItem(select):
	pass
