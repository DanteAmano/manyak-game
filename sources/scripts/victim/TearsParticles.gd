extends CPUParticles2D

export var tears_particle_enabled = true

func _ready():
	pass


func set_tears_particle_by_direction(direction):
	position.x = direction * abs(position.x)

func toogle_tears_particle(value):
	if not tears_particle_enabled:
		value = false	
	visible = value
	emitting = value
	#set_tears_particle_by_direction()
