extends PanelContainer

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
	
	effects = [thunder, gun, sword, explosion, laugh, bug2manette]
	animals = [horse, chicken, wolf, goat, cat]
	actives = [horse, chicken, cat, thunder, laugh, bug2manette]
	
	var i = 0
	# initialisation des buttons
	for button in $GridContainer.get_children():
		button.sound_selected.connect(_on_sound_selected)
		button.set_sound(actives[i])
		i += 1

func _on_sound_selected(id: SoundId.SoundId):
	print("Son reçu :", id)
	match id:
		SoundId.SoundId.HORSE:
			pass
		SoundId.SoundId.CHICKEN:
			pass
		SoundId.SoundId.WOLF:
			pass
		SoundId.SoundId.GOAT:
			pass
		SoundId.SoundId.CAT:
			pass

func update(id: SoundId.SoundId, stream: AudioStream, button: Button ) -> void:
	button.update(id, stream)
