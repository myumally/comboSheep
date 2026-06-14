extends PanelContainer

@onready var combo_list: HBoxContainer = $VBoxContainer/ComboList

var level: int

func _ready():
	combo_list.valid.connect(_on_valid)
	$VBoxContainer/SoundBoard.sound_selected.connect(_on_sound_selected)
	level = 1
	run()

func run() -> void:
	combo_list.update_combo(level)

func _on_valid():
	level += 1
	combo_list.update_combo(level)

func _on_sound_selected(id: SoundId.SoundId):
	combo_list.check_sound(id)
