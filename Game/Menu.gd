extends Node2D

func _ready():
	$AnimationPlayer.play("Wellcome")#cria a mensagem inicial
func _process(delta):
	pass


func _on_start_pressed():
	var game =load("res://Game/Game.tscn").instantiate()#caso quira começar, instancia a cena do jogo
	get_tree().change_scene_to_file("res://Game/Game.tscn")#muda a cena para arquivo
	get_tree().change_scene_to_packed(game)#muda a cena para a nova cena e deleta


func _on_quit_pressed():
	get_tree().free()#caso quira desistir
