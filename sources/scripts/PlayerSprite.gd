extends AnimatedSprite

onready var forvard_raycast = get_node("../ForvardRayCast")


func _physics_process(delta):
	print(forvard_raycast.get_collider())


func change_direction(direction_alias):
	var forvard_raycust_rotate = 90 * (-1 if direction_alias else 1)
	self.flip_h = not direction_alias
	forvard_raycast.rotation_degrees = forvard_raycust_rotate
	
