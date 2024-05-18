extends Node

var fsm: VictimStateMachine



func enter():
	fsm.player.play('fear')
	fsm.player_root.is_in_fearing = true


func exit(next_state):
	fsm.change_to(next_state)
	

func process(_delta):
	pass

func physics_process(_delta):
	pass


func input(_event):
	pass


func unhandled_input(_event):
	pass

func unhandled_key_input(_event):
	pass

func notification(_what, _flag = false):
	pass
