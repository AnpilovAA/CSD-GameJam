extends Area2D

@export var speed = 300
@export var heal = 500

signal hit


func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO

func _on_body_entered(body: Node2D) -> void:
	hit.emit()
	$CollisionShape2D.disabled = true
	$Timer.start(0.5)
# Тут тоже в теории должно быть временное бессмертие
	while not $Timer.is_stopped():
		$CollisionShape2D.disabled = false

func start(pos):
	position = pos
	$CollisionShape2D.disabled = false


func _on_timer_timeout() -> void:
	$Timer.stop()
# Called when the node enters the scene tree for the first time.
