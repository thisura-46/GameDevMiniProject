extends KinematicBody2D

export var speed : int = 300
export var gravity : = 1000
export var jumpForce : = 700
var coins = 0
var b

onready var bullet : = preload("res://Scenes/bullet.tscn")
onready var playerSprite : = get_node("Player_Running")
onready var gunSprite : = get_node("Gun")
var vel : = Vector2()
	
func _ready():
	$AnimationPlayer.play("Running")
	

func _physics_process(delta: float) -> void:
	vel.x = 0
	if Input.is_action_pressed("move_left"):
		vel.x -= speed
		$AnimationPlayer.play("Running")
		playerSprite.flip_h = true
		gunSprite.flip_h = true
		$Position2D.position.x = -32
		
	if Input.is_action_pressed("move_right"):
		vel.x += speed
		$AnimationPlayer.play("Running")
		playerSprite.flip_h = false
		gunSprite.flip_h = false
		$Position2D.position.x = 32
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		vel.y = -jumpForce 
		$SoundJump.play()
	
	vel = move_and_slide(vel, Vector2.UP)
	
	vel.y += gravity * delta
	
	if Input.is_action_just_pressed("shoot"):
		$SoundShoot.play()
		b = bullet.instance()
		b.init(playerSprite.flip_h)
		get_parent().add_child(b)
		b.global_position = $Position2D.global_position

func _on_fallzone_body_entered(body):
	get_tree().change_scene("res://Scenes/GameOver.tscn")
	


