extends Area3D
var tree_hp = 12
var can_collect= true
@onready var player = get_node("/root/MainScene/Player")
@onready var rm = get_node("/root/MainScene/ResourceManager")
@onready var sprite_3d: Sprite3D = $Sprite3D
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

func _physics_process(_delta: float) -> void:
	var distance_to_player = (player.global_position.z - global_position.z)
	update_opacity(distance_to_player)

func _on_body_entered(body: Node3D) -> void:
	if body is CharacterBody3D and body.name == "Player":
		self_modulate(0.5)
		set_process(true)

func _on_body_exited(body: Node3D) -> void:
	if body is CharacterBody3D and body.name == "Player":
		self_modulate(1)
		set_process(false)

func self_modulate(value: float):
	sprite_3d.modulate.r = value

func _on_punch_timer_timeout() -> void:
	can_collect = true

func tree_hit():
	animation_player.play("tree_hit_3d")
	tree_hp -= 1

func update_opacity(_value: float):
	if _value > 2:
		_value -= 2
		sprite_3d.transparency = _value
	elif _value < -0.1:
		_value += 0.1
		sprite_3d.transparency = -(_value)
