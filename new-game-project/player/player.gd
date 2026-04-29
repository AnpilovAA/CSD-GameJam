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
	var close_range_attack = 10
	var long_range_attack = 3
	# Движение персонажа
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
	# Тут roll
	if Input.is_action_just_released("roll"):
		#Тут я добавил таймаут для roll что бы не был возможности спамить
		if Input.is_action_pressed("move_right") and $Timer.is_stopped():
			velocity.x += 10
			$Timer.start(2.0)
		elif Input.is_action_pressed("move_left") and $Timer.is_stopped():
			velocity.x -= 10
			$Timer.start(2.0)
	# Атака персонажа(допишу как будут спрайты)
	if Input.is_action_just_pressed("close-range attack"):
		pass
	if Input.is_action_just_pressed("long-range strike"):
		pass

# Тут отключаем таймер
func _on_timer_timeout() -> void:
	$Timer.stop()

# Тут будет реализована атака наверное
func _on_attack() -> void:
	pass # Replace with function body.

# Вот тут мы работает с коллизией.
func _on_body_entered(body: Node2D) -> void:
	hit.emit()
	$CollisionShape2D.set_deferred("disabled", true)
	# тут я хочу реализовать временное бесмертие
	$Timer.start(0.5)
	while not $Timer.is_stopped():
		$CollisionShape2D.disabled = false

func start(pos):
	position = pos
	$CollisionShape2D.disabled = false


func _on_hit(hit_score) -> void:
	heal -= hit_score # Replace with function body.
