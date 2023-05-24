extends Control


enum State {
	START_SCREEN,
	INTRO_CUTSCENE,
	IN_GAME,
	PAUSED,
	END_SCREEN
}
var state : State = State.START_SCREEN


func _input(event: InputEvent):
	if event.is_action_pressed("pause"):
		if state == State.INTRO_CUTSCENE:
			start_game()
		elif state == State.IN_GAME:
			state = State.PAUSED
			$/root/Game.process_mode = Node.PROCESS_MODE_DISABLED
			$PauseScreen.show()
			self.show()
		elif state == State.PAUSED:
			_on_resume_button_pressed()


func _on_play_button_pressed():
	self.hide()
	$StartScreen.hide()
	state = State.INTRO_CUTSCENE

	var cutscene = preload("res://Scenes/IntroCutscene.tscn").instantiate()
	get_tree().get_root().add_child(cutscene)


func start_game():
	var game = preload("res://Scenes/Game.tscn").instantiate()
	
	var cutscene = get_tree().get_root().get_node_or_null("IntroCutscene")
	if cutscene:
		cutscene.hide()
		cutscene.process_mode = Node.PROCESS_MODE_DISABLED

	var prev_game = get_tree().get_root().get_node_or_null("Game")
	if prev_game:
		prev_game.free()

	state = State.IN_GAME
	get_tree().get_root().add_child(game)

	# Move Menu to the end, so that when we show it for the pause/end screens,
	# it's an overlay.
	self.get_parent().move_child(self, -1)


func _on_quit_button_pressed():
	get_tree().quit()


func _on_resume_button_pressed():
	$PauseScreen.hide()
	self.hide()
	state = State.IN_GAME

	$/root/Game.process_mode = Node.PROCESS_MODE_INHERIT


func show_end():
	state = State.END_SCREEN
	$/root/Game.set_deferred("process_mode", Node.PROCESS_MODE_DISABLED)
	self.show()
	$EndScreen.show()
	AudioServer.set_bus_volume_db(0, -100);


func _on_end_quit_button_pressed():
	get_tree().quit()


func _on_end_re_play_button_pressed():
	$EndScreen.hide()
	$StartScreen.show()
	state = State.START_SCREEN
