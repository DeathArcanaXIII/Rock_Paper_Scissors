extends Sprite

enum cards_2 {Paper = 0, Scissors = 2}

var mouse_over = false
var x


func _drawed_3():#Ajusta as posições das cartas
	if(Table.draw_three == 3):
		Table.xAxys = 512
		Table.yAxys = 580
# Called when the node enters the scene tree for the first time.
func _instance_cards():
	if(Table.actual_hand == 0):
		if(mouse_over == true && Table.deck_size > 0 && Table.actual_hand < 3 && Input.is_action_just_pressed("mouse_left_click")):
			for n in range(3,0,-1):
				if(Table.paper_total > 0 && Table.rock_total == 0 && Table.scissors_total == 0): # Só Papel
					x = Table.cards.Paper
				elif(Table.rock_total > 0 && Table.paper_total == 0 && Table.scissors_total == 0): # Só Pedra
					x = Table.cards.Rock
				elif(Table.scissors_total > 0 && Table.paper_total == 0 && Table.rock_total == 0): # Só Tesoura
					x = Table.cards.Scissors
				elif(Table.paper_total > 0 && Table.rock_total > 0 && Table.scissors_total == 0): # Só Papel e Pedra
					randomize()
					x = randi() % 2
				elif(Table.paper_total > 0 && Table.scissors_total > 0 && Table.rock_total == 0): # Só Papel e Tesoura
					x = randi() % cards_2.size()
				elif(Table.rock_total > 0 && Table.scissors_total > 0 && Table.paper_total == 0): # Só Pedra e Tesoura
					randomize()
					x = randi() % 2 + 1
				elif(Table.paper_total > 0 && Table.rock_total > 0 && Table.scissors_total > 0):# Todas as cartas
					randomize()
					x = randi() % Table.cards.size()
				print(x)
				if(x == Table.cards.Paper):
					var scene = preload("res://scenes/Paper.tscn")
					var card = scene.instance()
					add_child(card)
					card.set_global_position(Vector2(Table.xAxys,Table.yAxys))#Posiciona a cena
					Table.xAxys += 192
					Table.deck_size -= 1 #"Tira" uma carta do deck
					Table.actual_hand += 1#"Aumenta" uma carta na mão
					Table.draw_three += 1#confirma se 3 cartas foram compradas
					Table.paper_total -= 1
				elif(x == Table.cards.Rock):
					var scene = preload("res://scenes/Rock.tscn")
					var card = scene.instance()
					add_child(card)
					card.set_global_position(Vector2(Table.xAxys,Table.yAxys))#Posiciona a cena
					Table.xAxys += 192
					Table.deck_size -= 1 #"Tira" uma carta do deck
					Table.actual_hand += 1#"Aumenta" uma carta na mão
					Table.draw_three += 1#confirma se 3 cartas foram compradas
					Table.rock_total -= 1
				elif(x == Table.cards.Scissors):
					var scene = preload("res://scenes/Scissors.tscn")
					var card = scene.instance()
					add_child(card)
					card.set_global_position(Vector2(Table.xAxys,Table.yAxys))#Posiciona a cena
					Table.xAxys += 192
					Table.deck_size -= 1 #"Tira" uma carta do deck
					Table.actual_hand += 1#"Aumenta" uma carta na mão
					Table.draw_three += 1#confirma se 3 cartas foram compradas
					Table.scissors_total -= 1

func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_instance_cards()
	_drawed_3()
	pass
	
func _on_Area2D_mouse_entered():
	mouse_over = true
	pass # Replace with function body.


func _on_Area2D_mouse_exited():
	mouse_over = false
	pass # Replace with function body.
