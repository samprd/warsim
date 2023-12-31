extends Node

class_name game

@export_category("Game Properties")

@export var alive_empires: Array[empire];
@export var dead_empires: Array[empire];

func _ready():
	randomize();

func _on_invade_pressed():
	var attacking_empire = alive_empires.pick_random();
	var attacked_territory = attacking_empire.get_neighbours().pick_random();

	attacking_empire.invade(attacked_territory.current_empire);
