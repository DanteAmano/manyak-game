extends Node

var fsm: VictimStateMachine

var curr_z_index: int

func enter():
	curr_z_index = fsm.player_root.z_index
	fsm.player_root.z_index=3
	fsm.player_root.tears_particles.toogle_tears_particle(true)
	fsm.player_root.tears_particles.set_tears_particle_by_direction(fsm.player_root._get_direction_num())
	
	fsm.player.play('fuck')
	


func exit(next_state):
	fsm.player_root.z_index=curr_z_index
	fsm.player_root.tears_particles.toogle_tears_particle(false)
	fsm.change_to(next_state)



func process(_delta):
	pass

func physics_process(_delta):
	pass


func input(_event):
	pass


