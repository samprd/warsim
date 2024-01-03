extends Control

class_name UI

@export_category("UI Settings")

@export var animation_player: AnimationPlayer;

@export_group("Attack Box", "attack_")
@export var attack_flagAction: TextureRect;
@export var attack_flagVictim: TextureRect;
@export var attack_action_name: Label;
@export var attack_victim_name: Label;

@export_group("Rebel Box", "rebel_")
@export var rebel_flagAction: TextureRect;
@export var rebel_flagVictim: TextureRect;
@export var rebel_action_name: Label;
@export var rebel_victim_name: Label;

@export_group("Win Screen", "win_")
@export var win_flag: TextureRect;
@export var win_text: Label;

func setUi(action_empire: empire, victim_empire: empire, action: String):
	match action:
		"attack":
			attack_action_name.text = action_empire.label;
			attack_victim_name.text = victim_empire.label;

			attack_action_name.add_theme_color_override("font_color", action_empire.base_color);
			attack_victim_name.add_theme_color_override("font_color", victim_empire.base_color);

			attack_flagAction.texture = load(action_empire.flag);
			attack_flagVictim.texture = load(victim_empire.flag);
		"rebel":
			rebel_action_name.text = action_empire.label;
			rebel_victim_name.text = victim_empire.label;

			rebel_action_name.add_theme_color_override("font_color", action_empire.base_color);
			rebel_victim_name.add_theme_color_override("font_color", victim_empire.base_color);

			rebel_flagAction.texture = load(action_empire.flag);
			rebel_flagVictim.texture = load(victim_empire.flag);

	animation_player.play(action);

func win_screen(winning_empire: empire):
	win_text.text = "%s won!" % winning_empire.label;

	win_text.add_theme_color_override("font_color", winning_empire.base_color);

	win_flag.texture = load(winning_empire.flag);

	animation_player.play("win");
