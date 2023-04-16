extends Control


enum State {
	START_SCREEN,
	INTRO_CUTSCENE,
	IN_GAME,
}
var state : State = State.START_SCREEN


func _input(event: InputEvent):
	if state == State.INTRO_CUTSCENE and event.is_action_pressed("pause"):
		start_game()


func _on_play_button_pressed(restart := false):
	self.hide()
	state = State.INTRO_CUTSCENE

	var cutscene = preload("res://Scenes/IntroCutscene.tscn").instantiate()
	get_tree().get_root().add_child(cutscene)


func start_game():
	var game = preload("res://Scenes/Game.tscn").instantiate()
	
	var cutscene = get_tree().get_root().get_node_or_null("IntroCutscene")
	if cutscene:
		cutscene.hide()

	var prev_game = get_tree().get_root().get_node_or_null("Game")
	if prev_game:
		prev_game.free()

	state = State.IN_GAME
	get_tree().get_root().add_child(game)


func _on_quit_button_pressed():
	get_tree().quit()


