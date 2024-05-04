extends AnimatedSprite

onready var player_root = get_parent()


func _physics_process(delta):
	pass


func change_direction(direction_alias):
	var direction_index = (-1 if direction_alias else 1)
	var forvard_raycust_rotate = 90 * direction_index
	self.flip_h = not direction_alias
	player_root.forvard_ray_cast.rotation_degrees = forvard_raycust_rotate
	
	player_root.drag_area_collision_shape.position.x = abs(player_root.drag_area_collision_shape.position.x) \
		* direction_index

