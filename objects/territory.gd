extends Node2D

class_name territory

@export_category("Territory Properties")

@export var label: String;

@export_color_no_alpha var color: Color;
@export var neighbours: Array[territory];

func setColor(base_color: Color):
	color = color;
