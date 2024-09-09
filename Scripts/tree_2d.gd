extends Area2D
var tree_hp = 12
var can_collect= true
@onready var player = get_node("/root/MainScene/Player")
@onready var rm = get_node("/root/MainScene/ResourceManager")
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var punch_timer: Timer = $PunchTimer
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	set_process(false)

func _process(_delta: float) -> void:
	if tree_hp <= 0:
		queue_free()

	if Input.is_action_pressed("Ordinance") and can_collect == true:
		rm.increase_wood(1)
		tree_hit()
		can_collect = false
		punch_timer.start()

	if player.position.y > position.y - 10:
		z_index = -1  # Player is in front of the tree
	else:
		z_index = 1  # Tree is in front of the player

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and body.name == "Player":
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

func tree_hit():
	animation_player.play("tree_hit")
	tree_hp -= 1
