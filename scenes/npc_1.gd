extends CharacterBody2D

@export var speed: float = 100  # Kecepatan gerak
@export var distance: float = 200  # Jarak maksimum sebelum berbalik
@onready var animated_sprite = $AnimatedSprite2D

var moving_right: bool = true  # true = kanan, false = kiri
var start_position: Vector2

func _ready():
	start_position = global_position
	animated_sprite.play("walk")  # Mulai animasi berjalan

func _process(delta):
	# Tentukan arah gerak
	velocity.x = speed if moving_right else -speed
	move_and_slide()

	# Balik arah jika sudah mencapai batas jarak
	if abs(global_position.x - start_position.x) >= distance:
		moving_right = !moving_right  # Toggle arah
		scale.x *= -1  # Balik sprite

	# Set animasi sesuai arah
	animated_sprite.flip_h = not moving_right
