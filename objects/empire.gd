extends Node2D

class_name empire

@export_category("Empire Properties")

@export var label: String;
@export_color_no_alpha var base_color: Color;
@export var flag: Image;

@export var members: Array[territory];

func get_neighbours():
	var neighbours = [];

	for member in members:
		for neighbour in member.neighbours:
			if members.find(neighbour) == -1:
				neighbours.append(neighbour);
