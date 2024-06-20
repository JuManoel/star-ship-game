extends StaticBody2D
var cena=load("res://Alien/TiroInimigo.tscn")#tiro inimigo
@export var Vida=3#vidas do inimigo
signal morte(pontos)#sinal de quando morre. manda os pontos
var n_pai#novo pai do tiro

func _ready():
	$AnimatedSprite2D.play("Voar") #faz voar

func _physics_process(delta):
	$AnimationPlayer.play("Tiro")#animação de tiro
	$AnimationPlayer.advance(0)#repetir


func tiro():
	var tiro=cena.instantiate()#instancia o tiro
	self.add_child(tiro)#adicionamos tiro
	tiro.global_position=self.global_position+Vector2(0,6)#modificamos a posição
	tiro.receber_pai(n_pai)#recebe o novo pai
	#tem que ser nessa ordem. adicionar filho, mudar posição e muda pai. se n da erro
	
func flixo(pai):
	n_pai=pai#recebe o novo pai
	
func Receber_Dano(Dano):
	Vida-=Dano#recebe dano
	if(Vida<=0):
		emit_signal("morte",100)#manda o sinal caso morra
		self.get_parent().queue_free();
