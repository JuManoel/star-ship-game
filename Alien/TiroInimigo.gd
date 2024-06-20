extends AnimatableBody2D
const Speed=Vector2(0,125)#velocidade
@onready var xInicial=self.global_position.x#a posição x que tem que se manter
@export var dano=1#dano do tiro inimigo


func _physics_process(delta):
	move_and_collide(Speed*delta)#tiro cai
	self.global_position.x=xInicial#não se move no x

func receber_pai(pai):
	self.reparent(pai)#muda o pai

func _on_area_2d_body_entered(body):
	body.Receber_Dano(dano)#manda o dano
	self.queue_free()#se destroi
