extends Node

class_name game

@export_category("Game Properties")

@export var alive_empires: Array[empire];
@export var dead_empires: Array[empire];
@export_range(0, 100, 1, "suffix:%") var rebel_chance: int;
@export var ui: UI;
@export var game_timer: Timer;
@export var win_cooldown: Timer;

func invade():
	if alive_empires.size() <= 1:
		game_timer.stop();
		win_cooldown.start();

		return;

	var attacking_empire = alive_empires.pick_random();
	var attacked_empire = attacking_empire.get_neighbours().pick_random().current_empire;

	ui.setUi(attacking_empire, attacked_empire, "attack");

	attacking_empire.invade(attacked_empire);

func rebel():
	if dead_empires.size() <= 0:
		invade();
		return;

	var revived_empire = dead_empires.pick_random();
	var old_empire = revived_empire.original_territory.current_empire;

	ui.setUi(revived_empire, old_empire, "rebel");

	revived_empire.rebel(old_empire);

func win():
	var last_empire = alive_empires[0];

	ui.win_screen(last_empire);

	pass;

func move():
	var num = randi_range(1, 100);

	if num <= rebel_chance:
		rebel();
	else:
		invade();

func _ready():
	randomize();

	move();

func _on_game_timer_timeout():
	move();


func _on_win_cooldown_timeout():
	win();
