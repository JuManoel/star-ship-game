extends CharacterBody2D

var cena=load("res://Nave/Tiro.tscn")#essa é a cena do tiro
const SPEED = 150.0#velocidade da vane
@export var TypeTiro="Tiro1"#o tiro que o jogador tem agora
var vida=3#total de vidas que ele tem
signal gameOver(scene)#sinal de game over


func _ready():
	$AnimatedSprite2D.play("Normal")#começar a animação
	


func _physics_process(delta):
	$AnimationPlayer.play(TypeTiro)#isso faz com que a animação começe, de ficar atacando
	var direction = Input.get_axis("ui_left", "ui_right")#pega qual tecla foi apertada
	if direction:#valida qual foi
		velocity.x = direction * SPEED#calcula a velocidade x
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)#ele vai de velocidaex, para 0 e move a SPEED velocidade.
		#resumo, move para o outro lado

	move_and_slide()#move com o delta
	$AnimationPlayer.advance(0)#faz a animação sempre se repetir


func tiro1():#cria o tiro de tipo 1
	var tiro=cena.instantiate()#instancia o tiro
	tiro.position=Vector2(-2,-11)#seta a posição dele
	add_child(tiro)#adiciona o tiro como filho
	
func tiro2():#cria o tiro tipo 2
	var tiroD=cena.instantiate()#tiro da Direita
	var tiroE=cena.instantiate()#tiro da Esquerda
	#setta a posições dos tiros
	tiroD.position=Vector2(-7,-6)
	tiroE.position=Vector2(3,-6)
	#adiciona tiros como filho
	add_child(tiroD)
	add_child(tiroE)
	
func tiro3(): #tiro tipo 3
	#tiro tipo 3 é o tiro tipo1 + tiro tipo 2
	tiro1()
	tiro2()
	

func Mudar_Tiro():#muda o tipo de tiro
	TypeTiro="Tiro"+str(1+int(TypeTiro[-1]))#é so somar o ultimo valor
	if(vida<3):#regenera vida
		vida+=1

func Receber_Dano(Dano):#recebe dano
	vida-=Dano#muda a vida
	if(vida<=0):
		emit_signal("gameOver","res://Game/GameOver.tscn")#emite o sinal de game over

func get_Vidas():#retorna o total de vidas
	return vida
