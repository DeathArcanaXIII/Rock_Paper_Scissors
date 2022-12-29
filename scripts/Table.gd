extends Node

enum cards {Paper = 0, Rock = 1, Scissors = 2}

onready var deck_00 = preload("res://scenes/Player_Deck.tscn")
onready var deck_01 = preload("res://scenes/Enemy_Deck.tscn")
onready var result_00 = preload("res://scenes/Result.tscn")

var paper_total = 5
var rock_total = 5
var scissors_total = 5

var enemy_paper_total = 5
var enemy_rock_total = 5
var enemy_scissors_total = 5

var enemy_choice = [7,7,7]

var deck = [7,7,7,7,7,7,7,7,7,7,7,7,7,7,7] 
var enemyHand = [7,7,7]
var deck_position = -0
var pick
var result = false

var played = false
var player_deck
var enemy_deck
var mouse_over = false
var deck_size = 15
var enemy_deck_size = 15
var max_hand_size = 3
var actual_hand = 0
var xAxys = 512
var yAxys = 580
var draw_three = 0
var enemy_actual_hand = 0
var enemy_hand_size = 3
var player_choice
var enemy_cards
var score_player = 0
var score_enemy = 0
var delete_paper = 13
var delete_rock = 14
var delete_scissors = 15
var empate = "Empate"
var win_p1 = "Jogador 1 Venceu!"
var win_p2 = "Jogador 2 Venceu!"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
