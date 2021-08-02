extends Node2D

var songs : Array = []
var lastSong = load("res://icon.png")

func _ready():
# warning-ignore:return_value_discarded
	var directory = Directory.new()
	directory.make_dir("user://Songs")
	get_filelist("res://Songs/")
# warning-ignore:return_value_discarded
	get_filelist("user://Songs")
	play_song()

func get_filelist(scan_dir : String) -> Array:
	var dir := Directory.new()
	if dir.open(scan_dir) != OK:
		printerr("Warning: could not open directory: ", scan_dir)
		return []

	if dir.list_dir_begin(true, true) != OK:
		printerr("Warning: could not list contents of: ", scan_dir)
		return []

	var file_name := dir.get_next()
	while file_name != "":
		if dir.current_is_dir():
			songs += get_filelist(dir.get_current_dir() + "/" + file_name)
		else:
			songs.append(dir.get_current_dir() + "/" + file_name)

		file_name = dir.get_next()

	return songs

func play_song():
	if globals.music:
		var n = rand_range(0, 14)
		n = round(n)
		if ".import" in songs[n]:
			play_song()
		else: 
			var song = load(songs[n])
			if song == lastSong:
				play_song()
			else:
				$Music.stream = song
				$Music.play()
				var length = $Music.stream.get_length()
				$Music/Timer.wait_time = length
				$Music.volume_db = -12
				lastSong = song

func _process(_delta):
	if Input.is_action_just_pressed("nextSong"):
		play_song()
	if Input.is_action_just_pressed("stopMusic"):
		$Music.stop()
		globals.music = false

func _on_Timer_timeout():
	play_song()
