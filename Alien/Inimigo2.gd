extends StaticBody2D
var cena=load("res://Alien/BombaInimiga.tscn")#tiro do inimigo
@export var Vida=3#vida
signal morte(pontos)#sinal de morte
var lixo#o novo pai. lixo de tiros


func _ready():
	$AnimatedSprite2D.play("Voar") # inicia a animação.

func _physics_process(delta):
	$AnimationPlayer.play("Tiro")#animação de tiro
	$AnimationPlayer.advance(0)#repete

func tiro():
	var tiro=cena.instantiate()#instancia o tiro
	var flip=randi()%2
	if(flip==1):#valida se pode flipar
		tiro.flip=true#se sim. flipa
	self.add_child(tiro)
	
func Receber_Dano(Dano):
	Vida-=Dano#recebe o dano
	if(Vida<=0):
		emit_signal("morte",200)#emite o sinal
		self.get_parent().queue_free()#morre

func flixo(tiro_lixo):
	lixo=tiro_lixo#o novo pai
	
