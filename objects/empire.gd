extends Node2D

class_name empire

@export_category("Empire Properties")

@export var label: String;
@export_color_no_alpha var base_color: Color;
@export var flag: Image;
@export var original_territory: territory;

@export var members: Array[territory];

func get_neighbours():
	var neighbours = Array[territory];

	for member in members:
		for neighbour in member.neighbours:
			if members.find(neighbour) == -1 and neighbours.find(neighbour) == -1:
				neighbours.append(neighbour);

	return neighbours;

func invade(enemy: empire):
	for member in enemy.members:
		member.setEmpire(self);
		members.append(member);
	enemy.members = [];

func rebel():
	var old_empire = original_territory.current_empire;
	var members_list = old_empire.members;

	members_list.remove_at(members_list.members.find(original_territory));

	members = [original_territory];
	original_territory.setEmpire(self);
