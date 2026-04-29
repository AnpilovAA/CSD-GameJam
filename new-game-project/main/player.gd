extends Area2D

@export var speed = 300

var screen_size

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
		if Input.is_action_pressed("move_right"):
			velocity.x += 10
		elif Input.is_action_pressed("move_left"):
			velocity.x -= 10
