extends Node

func LoadGame(gameData):
	if(!gameData.gameCreated):
		await TransitionScreen.FadeInOut(0.1, Color.WHITE, SceneManager.change_scene.bind("res://assets/scenes/Game/start_new_game_menu.tscn"))
		return
	if(!gameData.tutorialDone):
		await TransitionScreen.FadeInOut(0.5, Color.WHITE, SceneManager.change_scene.bind("res://assets/scenes/Game/GameScenes/IntroLink.tscn"))
