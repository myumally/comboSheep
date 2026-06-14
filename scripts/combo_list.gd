extends HBoxContainer

var animaux: Array[String]
var animaux_id: Array[SoundId.SoundId]
var combo: Array[SoundId.SoundId]
var current: int

signal valid()

func _ready():
	animaux = ["Cheval", "Poule", "Loup", "Chèvre"]
	animaux_id = [SoundId.SoundId.HORSE, SoundId.SoundId.CHICKEN, SoundId.SoundId.WOLF, SoundId.SoundId.GOAT]
	combo = []
	current = 0
	pass

func update_combo(taille: int):
	combo = []
	for i in range(taille):
		var animal_id =  animaux_id.pick_random()
		combo.append(animal_id)
	afficher_liste()

func afficher_liste():
	for enfant in get_children():
		enfant.queue_free()
	for i in range(combo.size()):
		var label = Label.new()
		label.text = animaux[combo[i]]
		label.add_theme_font_size_override("font_size", 48)
		add_child(label)

func check_sound(id: SoundId.SoundId):
	if (combo[current] == id):
		current += 1
	else:
		current = 0
	if (current >= combo.size()):
		current = 0
		valid.emit()
