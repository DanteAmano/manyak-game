extends AnimatedSprite

onready var player_root = get_parent()


func _physics_process(delta):
	pass



func _get_collision_areas():
	# Области соприкоснования, которые необходимо поворачивать вместе со спрайтом
	return [
		player_root.drag_area_collision_shape,
		player_root.fuck_area_collision_shape
	]

func change_direction(direction_alias):
	var direction_index = (-1 if direction_alias else 1)
	var forvard_raycust_rotate = 90 * direction_index
	self.flip_h = not direction_alias
	player_root.forvard_ray_cast.rotation_degrees = forvard_raycust_rotate
	
	for area in _get_collision_areas():
		_change_direction_collision_areas(area, direction_index)
	#_change_direction_collision_areas(player_root.fuck_area_collision_shape, direction_index)
	#player_root.drag_area_collision_shape.position.x = abs(player_root.drag_area_collision_shape.position.x) \
	#	* direction_index

func _change_direction_collision_areas(collision_area, direction):
	collision_area.position.x = abs(collision_area.position.x) * direction
