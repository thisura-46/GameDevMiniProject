extends KinematicBody2D

signal enemies_killed

var velocity = Vector2()
export var direction = -1

func _ready():
	if direction == 1:
		$Sprite.flip_h = true
	$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	

func _physics_process(delta):
	if is_on_wall() or not $floor_checker.is_colliding():
		direction = direction * -1
		$Sprite.flip_h = not $Sprite.flip_h
		$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	
	velocity.x = 100 * direction
	
	velocity = move_and_slide(velocity, Vector2.UP)

func _on_Area2D_area_entered(area):
	emit_signal("enemies_killed")
	set_collision_mask_bit(0, false)
	area.get_parent().queue_free()
	queue_free()

func _on_sides_checker_body_entered(body):
	get_tree().change_scene("res://Scenes/GameOver.tscn")
