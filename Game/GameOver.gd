extends Node2D


func _on_start_pressed():
	#caso quira repetir o jogo
	var game =load("res://Game/Menu.tscn").instantiate()#instancia a cena
	get_tree().change_scene_to_file("res://Game/Menu.tscn")#muda de cena, mas recebe o path
	get_tree().change_scene_to_packed(game)#muda de cena e deleta. recebe uma cena


func _on_quit_pressed():
	#caso desista
	get_tree().free()
