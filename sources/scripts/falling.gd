extends Node

var fsm: StateMachine

func enter():
	fsm.player.play('falling')


func exit(next_state):
	fsm.change_to(next_state)


func process(_delta):
	# Replace pass with your handler code
	pass

func physics_process(_delta):
	if Input.is_action_just_pressed(fsm.player_root.ui_up) and fsm.player_root.is_on_floor():
		fsm.player_root.set_jump_up_velocity()

	if Input.is_action_pressed(fsm.player_root.ui_left) or Input.is_action_pressed(fsm.player_root.ui_right):
		fsm.player_root.change_direction(Input.is_action_pressed(fsm.player_root.ui_right))
	if fsm.player_root.is_on_floor():
		exit('idle')

func input(_event):
	pass

func unhandled_input(_event):
	pass

func unhandled_key_input(_event):
	pass

func notification(_what, _flag = false):
	pass
