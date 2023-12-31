extends Node2D

class_name territory

@export_category("Territory Properties")

@export var label: String;

@export_color_no_alpha var color: Color;
@export var neighbours: Array[territory];
@export var current_empire: empire;

func setEmpire(new_empire: empire):
	current_empire = new_empire;
	color = new_empire.base_color;
	setColor();

func setColor():
	modulate = color;
