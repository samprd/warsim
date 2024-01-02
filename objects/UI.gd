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

func setUi(action_empire: empire, victim_empire: empire, action: String):
	match action:
		"attack":
			attack_action_name.text = action_empire.label;
			attack_victim_name.text = victim_empire.label;

			attack_action_name.add_theme_color_override("font_color", action_empire.base_color);
			attack_victim_name.add_theme_color_override("font_color", victim_empire.base_color);

			var action_flag = Image.load_from_file(action_empire.flag);
			var victim_flag = Image.load_from_file(victim_empire.flag);

			attack_flagAction.texture = ImageTexture.create_from_image(action_flag);
			attack_flagVictim.texture = ImageTexture.create_from_image(victim_flag);
		"rebel":
			rebel_action_name.text = action_empire.label;
			rebel_victim_name.text = victim_empire.label;

			rebel_action_name.add_theme_color_override("font_color", action_empire.base_color);
			rebel_victim_name.add_theme_color_override("font_color", victim_empire.base_color);

			var action_flag = Image.load_from_file(action_empire.flag);
			var victim_flag = Image.load_from_file(victim_empire.flag);

			rebel_flagAction.texture = ImageTexture.create_from_image(action_flag);
			rebel_flagVictim.texture = ImageTexture.create_from_image(victim_flag);

	animation_player.play(action);

