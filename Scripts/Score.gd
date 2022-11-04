extends CanvasLayer

var score = 0
var coins = 0
var enemies_killed = 0

func _ready():
	$Counter.text = String(score)

func _on_coin_collected():
	score += 20
	coins += 1
	_ready()

func _on_enemies_killed():
	score += 20
	enemies_killed += 1
	_ready()
