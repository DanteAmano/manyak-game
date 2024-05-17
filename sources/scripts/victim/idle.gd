extends Node

var fsm: VictimStateMachine



func enter():
	fsm.player.play('idle')
	yield(get_tree().create_timer(1), "timeout")
	exit('walk')


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
