extends Node

var high_score = 0
var current_score = 0

var SAVE_FOLDER_DIRECTORY = OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS) + "\\CodyBird"
var SAVE_FILE_PATH = SAVE_FOLDER_DIRECTORY + "\\score.sav"

signal score_changed(score)

func _ready():
	var directory = Directory.new( )
	if not directory.dir_exists(SAVE_FOLDER_DIRECTORY):
		directory.make_dir(SAVE_FOLDER_DIRECTORY)
	
	load_score()

func add_score():
	current_score += 1
	emit_signal("score_changed", current_score)

func load_score():
	high_score = 0
	current_score = 0
	
	var save_file = File.new()
	if save_file.file_exists(SAVE_FILE_PATH):
		save_file.open(SAVE_FILE_PATH, File.READ)
		high_score = save_file.get_line() as int
		save_file.close()

func save_score():
	if current_score > high_score:
		high_score = current_score
		
		var save_file = File.new()
		save_file.open(SAVE_FILE_PATH, File.WRITE)
		save_file.store_line(high_score as String)
		save_file.close()
