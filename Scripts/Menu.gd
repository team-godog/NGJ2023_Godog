extends Control


enum State {
	START_SCREEN,
	PAUSE_SCREEN,
	IN_GAME,
}
var state : State = State.START_SCREEN


func _input(event: InputEvent):
	if state == State.START_SCREEN:
		return
	
	if event.is_action_pressed("pause"):
		if state == State.IN_GAME:
			state = State.PAUSE_SCREEN
			$/root/Game.process_mode = Node.PROCESS_MODE_DISABLED
			$ResumeScreen.show()
		else:
			state = State.IN_GAME
			$/root/Game.process_mode = Node.PROCESS_MODE_ALWAYS
			$ResumeScreen.hide()


func _on_play_button_pressed(restart := false):
	$StartScreen.hide()
	$ResumeScreen.hide()
	state = State.IN_GAME

	var game = preload("res://Scenes/Game.tscn").instantiate()
	if restart:
		$/root/Game.free()
	get_tree().get_root().add_child(game)


func _on_resume_button_pressed():
	$StartScreen.hide()
	$ResumeScreen.hide()
	state = State.IN_GAME

	$/root/Game.process_mode = Node.PROCESS_MODE_ALWAYS


func _on_quit_button_pressed():
	get_tree().quit()
