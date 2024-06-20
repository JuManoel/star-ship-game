extends AnimatableBody2D
var Speed=Vector2(80,0)#velocidade de queda
@onready var xInicial#posição x inicial
@export var dano=1#dano
var cair=false#pra validar se ja pode cair
var flip=false
func _ready():
	$AnimatedSprite2D.play("Cair")#animação de girar

func _physics_process(delta):
	$AnimationPlayer.play("girar")#faz a bomba girar
	print(flip)
	calcular_vely()
	move_and_collide(Speed*delta)#move pra baixo
	$AnimationPlayer.advance(0)#faz a bola girar infinitamente



func _on_area_2d_body_entered(body):#caso entre algo
	body.Receber_Dano(dano)#deve receber dano
	self.queue_free()# e destrou ele mesmo

func pode_cair(position_x,pai):#permite cair
	cair=true
	xInicial=position_x#vai pegar a posição x q tem que se manter
	self.reparent(pai)#muda o pai. para eficar um erro de animação. ja que geralmente, tem muitos paths follows

func calcular_vely():
	#muda a velocidade x e y.
	# a velocidade y usa derivada UwU :3
	if(flip):
		Speed.x=-80
		Speed.y=(9.0/64.0)*(position.x+32)*Speed.x
	else:
		Speed.y=(9.0/64.0)*(position.x-32)*Speed.x#essa derrivada representa uma equação de grau 2. 
		#os 0 sãos 0 e 64 e o ponto maximo é 72
