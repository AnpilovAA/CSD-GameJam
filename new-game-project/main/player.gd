extends Area2D

@export var speed = 300

@export var heal = 100

var screen_size

signal attack
signal range_attack
signal hit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_just_pressed("jump"):
		velocity.y += 1
		if Input.is_action_just_pressed("move_right"):
			velocity.x += 1
		if Input.is_action_just_pressed("move_left"):
			velocity.x -= 1

	if Input.is_action_just_released("roll"):
		#Тут я добавил таймаут для roll что бы не был возможности спамить
		if Input.is_action_pressed("move_right") and $Timer.is_stopped():
			velocity.x += 10
			$Timer.start(2.0)
		elif Input.is_action_pressed("move_left") and $Timer.is_stopped():
			velocity.x -= 10
			$Timer.start(2.0)
   
   
func _on_timer_timeout() -> void:
	$Timer.stop()
	print("Timer off")
