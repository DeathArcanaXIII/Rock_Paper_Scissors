extends Sprite

enum cards_2 {Paper = 0, Scissors = 2}

var xAxys = 512
var yAxys = 128
#func _instance_enemy_hand():
#	if(Table.enemy_actual_hand == 0):
#		for n in range (3,0,-1):
#			var packed_scene = [
#				preload("res://scenes/Enemy_Paper.tscn"),
#				preload("res://scenes/Enemy_Scissors.tscn"),
#				preload("res://scenes/Enemy_Rock.tscn"),
#			]
#			randomize()
#			var x = randi() % packed_scene.size()
#			var enemy_cards = packed_scene[x].instance()
#			add_child(enemy_cards)
#			enemy_cards.set_global_position(Vector2(xAxys,yAxys))
#			xAxys += 192
#			Table.enemy_actual_hand += 1
#			Table.enemy_deck_size -= 1
func _instance_test():
	if(Table.enemy_actual_hand == 0):
		for n in range(3,0,-1):
			randomize()
			Table.enemy_choice = randi() % Table.cards.size()
			if(Table.enemy_paper_total > 0 && Table.enemy_rock_total == 0 && Table.enemy_scissors_total == 0): # Só Papel
				Table.enemy_choice  = Table.cards.Paper
			elif(Table.enemy_rock_total > 0 && Table.enemy_paper_total == 0 && Table.enemy_scissors_total == 0): # Só Pedra
				Table.enemy_choice  = Table.cards.Rock
			elif(Table.enemy_scissors_total > 0 && Table.enemy_paper_total == 0 && Table.enemy_rock_total == 0): # Só Tesoura
				Table.enemy_choice = Table.cards.Scissors
			elif(Table.enemy_paper_total > 0 && Table.enemy_rock_total > 0 && Table.enemy_scissors_total == 0): # Só Papel e Pedra
				randomize()
				Table.enemy_choice = randi() % 2
			elif(Table.enemy_paper_total > 0 && Table.enemy_scissors_total > 0 && Table.enemy_rock_total == 0): # Só Papel e Tesoura
				Table.enemy_choice = randi() % cards_2.size()
			elif(Table.enemy_rock_total > 0 && Table.enemy_scissors_total > 0 && Table.enemy_paper_total == 0): # Só Pedra e Tesoura
				randomize()
				Table.enemy_choice = randi() % 2 + 1
			elif(Table.enemy_paper_total > 0 && Table.enemy_rock_total > 0 && Table.enemy_scissors_total > 0):# Todas as cartas
				randomize()
				Table.enemy_choice = randi() % Table.cards.size()
			
			if(Table.enemy_choice == Table.cards.Paper):
				var scene = preload("res://scenes/Enemy_Paper.tscn")
				var card = scene.instance()
				add_child(card)
				card.set_global_position(Vector2(xAxys,yAxys))#Posiciona a cena
				xAxys += 192
				Table.enemy_actual_hand += 1
				Table.enemy_deck_size -= 1
				Table.enemy_cards = Table.cards.Paper
			elif(Table.enemy_choice == Table.cards.Rock):
				var scene = preload("res://scenes/Enemy_Rock.tscn")
				var card = scene.instance()
				add_child(card)
				card.set_global_position(Vector2(xAxys,yAxys))#Posiciona a cena
				xAxys += 192
				Table.enemy_actual_hand += 1
				Table.enemy_deck_size -= 1
				Table.enemy_cards = Table.cards.Rock
			elif(Table.enemy_choice == Table.cards.Scissors):
				var scene = preload("res://scenes/Enemy_Scissors.tscn")
				var card = scene.instance()
				add_child(card)
				card.set_global_position(Vector2(xAxys,yAxys))#Posiciona a cena
				xAxys += 192
				Table.enemy_actual_hand += 1
				Table.enemy_deck_size -= 1
				Table.enemy_cards = Table.cards.Scissors

func _gen_enemy_hand():
	randomize()
	Table.enemy_cards = randi() % Table.cards.size()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_instance_test()
	pass
