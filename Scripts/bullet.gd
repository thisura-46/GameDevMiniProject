extends Sprite

var speed = 700
var flip
onready var bulletSprite = get_node(".")

func init(playerFlipped: bool):
	flip = playerFlipped
	
func _physics_process(delta):
	
	if flip:
		bulletSprite.flip_h = false
		position.x -= speed * delta
	else:
		bulletSprite.flip_h = true
		position.x += speed * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


