extends Button

@export var color: Color

@onready var audio_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var sound_data: SoundData = $SoundData

signal sound_selected(id)

func _ready():
	modulate = color
	self_modulate = color

func update(id: SoundId.SoundId, stream: AudioStream ) -> void:
	sound_data.update(id, stream)
	audio_player.stream = sound_data._stream

func set_sound(sd: SoundData ) -> void:
	sound_data = sd
	audio_player.stream = sound_data._stream

func _on_pressed() -> void:
	print("Button clicked")
	audio_player.play()
	sound_selected.emit(sound_data._id)
