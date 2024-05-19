extends Node

var fsm: VictimStateMachine

var curr_z_index: int

func enter():
	curr_z_index = fsm.player_root.z_index
	fsm.player_root.z_index=3
	fsm.player.play('fuck')
	


func exit(next_state):
	fsm.player_root.z_index=curr_z_index
	fsm.change_to(next_state)


func process(_delta):
	pass

func physics_process(_delta):
	pass


func input(_event):
	pass


