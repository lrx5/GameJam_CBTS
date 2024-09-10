extends CharacterBody2D

var health = 1

# Function to take damage
func take_damage(damage_amount):
	health -= damage_amount
	print("Enemy took damage:", damage_amount)
	if health <= 0:
		die()

func die():
	print("Enemy died!")
	queue_free()  # Remove enemy from the scene
