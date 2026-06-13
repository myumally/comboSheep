extends Node
class_name SoundData

var _id: SoundId.SoundId
var _stream: AudioStream

func update_with_path(id: SoundId.SoundId, path: String) -> void:
	_id = id
	_stream = load(path)
	
func setId(id: SoundId.SoundId) -> void:
	_id = id

func setStream(stream: AudioStream) -> void:
	_stream = stream

func update(id: SoundId.SoundId, stream: AudioStream) -> void:
	_id = id
	_stream = stream
