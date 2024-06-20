extends Path2D
var velocidade=65#velocidade das naves
var contar_filhos#quantos filhos a cena tem
var avo#isso é complicado, mas eu pego a cena do jogo em si

func _ready():
	avo=self.get_parent().get_parent()#pega a cena do jogo
	self.contar_filhos=len(self.get_children())#conta quantos filhos tem
	pass

func _process(delta):
	caminho(delta)#faz os objetos se moverem
	self.contar_filhos=len(self.get_children())#quantos filhos tem
	if(contar_filhos<=1):#valida se tem filhos
		avo.inimigos_mortos()#avisa ao jogo que não tem mais inimigos
		self.queue_free()#se destroi

func caminho(delta):
	var paths=self.get_children()#pega todos os pathsfollows
	for p in paths:#pega de um a um
		if(p!=$Tiro_lixo):#valida se n é o no de tiro
			p.get_children()[0].flixo($Tiro_lixo)#manda o novo pai para os tiros
			p.progress+=velocidade*delta#faz as naves se moverem

func _on_inimigo_1_morte(pontos):#sinal dos inimigos tipo 1
	mandar_pontos(pontos)



func _on_inimigo_2_morte(pontos):#sinal dos inimigos tipo2
	mandar_pontos(pontos)

func mandar_pontos(pontos):
	avo.somar_pontos(pontos)#manda os pontos para o jogo
	
