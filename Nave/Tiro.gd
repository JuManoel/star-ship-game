extends AnimatableBody2D
const Speed=Vector2(0,-125)#velocidade
@onready var xInicial=self.global_position.x#posição para se manter
@export var dano=1#dano do tiro

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#se move
	move_and_collide(Speed*delta)
	#n se move em x
	self.global_position.x=xInicial


func _on_area_2d_body_entered(body):
	body.Receber_Dano(dano)#causa dano
	self.queue_free()
