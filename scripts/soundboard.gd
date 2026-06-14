extends GridContainer

signal sound_selected(id)

# animals
var horse = SoundData.new()
var chicken = SoundData.new()
var wolf = SoundData.new()
var goat = SoundData.new()
var cat = SoundData.new()

#effects
var thunder = SoundData.new()
var gun = SoundData.new()
var sword = SoundData.new()
var explosion = SoundData.new()
var laugh = SoundData.new()
var bug2manette = SoundData.new()

# liste avec les effets
var effects: Array[SoundData]
# liste avec les animaux
var animals: Array[SoundData]
# liste des sons actifs
var actives: Array[SoundData]
# liste des sons à activer
var to_active: Array[SoundData]

var current_layout: int

func _ready():
	# initialisation des sons
	horse.update_with_path(SoundId.SoundId.HORSE, "res://assets/sounds/animals/Horse.ogg")
	chicken.update_with_path(SoundId.SoundId.CHICKEN, "res://assets/sounds/animals/Chicken.ogg")
	wolf.update_with_path(SoundId.SoundId.WOLF, "res://assets/sounds/animals/Wolf.ogg")
	goat.update_with_path(SoundId.SoundId.GOAT, "res://assets/sounds/animals/Goat.ogg")
	cat.update_with_path(SoundId.SoundId.CAT, "res://assets/sounds/animals/Cat.ogg")
	thunder.update_with_path(SoundId.SoundId.THUNDER, "res://assets/sounds/effects/Thunder.ogg")
	gun.update_with_path(SoundId.SoundId.GUN, "res://assets/sounds/effects/Gun.ogg")
	sword.update_with_path(SoundId.SoundId.SWORD, "res://assets/sounds/effects/Sword.ogg")
	explosion.update_with_path(SoundId.SoundId.EXPLOSION, "res://assets/sounds/effects/Explosion.ogg")
	laugh.update_with_path(SoundId.SoundId.LAUGH, "res://assets/sounds/effects/Laugh.ogg")
	bug2manette.update_with_path(SoundId.SoundId.BUG2MANETTE, "res://assets/sounds/effects/di_bug.mp3")
	
	effects = [thunder, gun, sword, explosion]
	animals = [horse, chicken, wolf, goat, cat]
	
	# initialisation des buttons
	for button in get_children():
		button.sound_selected.connect(_on_sound_selected)
	
	# initialisation de la soundboard
	current_layout = 0
	update_soundboard()

func _on_sound_selected(id: SoundId.SoundId):
	sound_selected.emit(id)
	match id: # todo ajouter les effets
		SoundId.SoundId.THUNDER:
			pass
		SoundId.SoundId.GUN:
			pass
		SoundId.SoundId.SWORD:
			pass
		SoundId.SoundId.EXPLOSION:
			pass
		SoundId.SoundId.LAUGH:
			_on_laugh()
		SoundId.SoundId.BUG2MANETTE:
			_on_bug()

func _on_laugh() -> void:
	current_layout = (current_layout+1)%12
	update_soundboard()

func _on_bug() -> void:
	for i in range(4):
		animals[i].setId(animals[(i+1)%4]._id)

func select_sounds():
	to_active = [laugh, bug2manette]
	for i in range(2):
		var animal = animals.pick_random()
		while animal in to_active:
			animal = animals.pick_random()
		to_active.append(animal)
		var effect = effects.pick_random()
		while effect in to_active:
			effect = effects.pick_random()
		to_active.append(effect)

func select_layout(l: int):
	actives = []
	var decal = l%6
	for i in range(6):
		actives.append(to_active[(i+decal)%6])
	if l >= 6:
		actives.reverse()

func update_soundboard():
	select_sounds()
	select_layout(current_layout)
	var i = 0
	for button in get_children():
		button.set_sound(actives[i])
		i += 1

func update_button(id: SoundId.SoundId, stream: AudioStream, button: Button ) -> void:
	button.update(id, stream)
