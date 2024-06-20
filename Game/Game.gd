extends Node2D
var pontos=0#pontos do jogador
var subirNivel=[1000,2125,3250,4500,6000]#quando ele pode subir de nivel
var i=0#index de subirNivel
var speed=70#velocidade do path, para que apareca
var caminhos=["res://Paths/Padrao1.tscn","res://Paths/Padrao2.tscn"]#caminhos que pode chamar
# Called when the node enters the scene tree for the first time.
func _ready():
	$Player/Label.set_text(str(pontos))#seta os pontos para 0
	inimigos_mortos()#cria um novo path


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_Vidas()#valida quantas vidas tem
	$Cenario/AnimationPlayer.play("Voar")#faz o ceu se mecher
	$Cenario/AnimationPlayer.advance(0)#repete
	var padroes=$Caminhos.get_children()#pega todos os paths
	if(len(padroes)!=0 and padroes[0].global_position.y<0):#ve se o path ta na posição 0 ou menor
		$Caminhos.get_children()[0].global_position.y+=speed*delta#move

func get_Vidas():
	var vidas=$Player/Nave.get_Vidas()#quantas vidas tem o player
	#modifica o contador de vidas, baseado na quantidade de vidas
	#--------------------------------------------
	#MODIFICAÇÕES A FAZER
	#VALIDAR QUANTAS VIDAS TEM. VER QUANTAS COISAS TEM VISIVEIS
	#SE TEM MAIS VISIVEIS DO QUE REALMENTE QUANTAS VITAS TEM: DESTRUIR AS ULTIMAS ATÉ A QUANTIDADE Q MOSTRA
	#SER IGUAL A REAL
	#FAZER O CONTRARIO CASO TENHA MAIS
	#--------------------------------------
	if(vidas==1):
		$Player/vidas/Sprite2D.visible=true
		$Player/vidas/Sprite2D2.visible=false
		$Player/vidas/Sprite2D3.visible=false
	elif(vidas==2):
		$Player/vidas/Sprite2D.visible=true
		$Player/vidas/Sprite2D2.visible=true
		$Player/vidas/Sprite2D3.visible=false
	elif(vidas==3):
		$Player/vidas/Sprite2D.visible=true
		$Player/vidas/Sprite2D2.visible=true
		$Player/vidas/Sprite2D3.visible=true


func _on_nave_game_over(scene):
	#recebe o sinal de game over e muda de cena
	var game =load(scene).instantiate()
	get_tree().change_scene_to_file(scene)
	get_tree().change_scene_to_packed(game)


func inimigos_mortos():
	#quando é chamada, cria um novo path para seguir lutando
	var path=load(caminhos.pick_random()).instantiate()
	path.global_position=Vector2(0,-224)
	$Caminhos.add_child(path)

func somar_pontos(pont):
	#soma os pontos
	self.pontos+=pont
	$Player/Label.set_text(str(self.pontos))
