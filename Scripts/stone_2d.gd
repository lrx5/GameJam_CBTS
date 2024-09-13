extends Area2D
var stone_hp = 16
var can_collect= true
@onready var player = get_node("/root/MainScene/Player")
@onready var rm = get_node("/root/MainScene/ResourceManager")
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var punch_timer: Timer = $PunchTimer
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var stone_hit_sfx: AudioStreamPlayer2D = $StoneHitSFX

func _ready() -> void:
	set_process(false)

func _process(_delta: float) -> void:

	punch_timer.wait_time = State.punch_timer
	if stone_hp <= 0:
		queue_free()

	if Input.is_action_pressed("Ordinance") and can_collect == true:
		rm.increase_stone(1)
		stone_hit()
		can_collect = false
		punch_timer.start()

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and body.name == "Player":
		@warning_ignore("narrowing_conversion")
		self_modulate(0.5)
		set_process(true)

func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D and body.name == "Player":
		self_modulate(1)
		set_process(false)

func self_modulate(value: float):
	sprite_2d.modulate.r = value

func _on_punch_timer_timeout() -> void:
	can_collect = true

func stone_hit():
	animation_player.play("stone_hit")
	stone_hp -= 1
	stone_hit_sfx.play()
