extends Node

var fsm: StateMachine
var is_ready = false


func enter():
	play_current_sprite()
	#if fsm.current_victim:
	#	fsm.current_victim.fsm.back()


func exit(next_state):
	fsm.change_to(next_state)

func play_current_sprite():
	fsm.player.play('idle_with_thing') if fsm.player_root.is_thing_pull_out \
		else fsm.player.play('idle') 

func process(_delta):
	if Input.is_action_pressed(fsm.player_root.ui_right) or Input.is_action_pressed(fsm.player_root.ui_left):
		exit("walk")
		
	if Input.is_action_pressed(fsm.player_root.ui_dragging) and fsm.player_root.grabbing_is_availiable:
		exit("dragging")
		
	if false and not fsm.player_root.is_on_floor():
		exit('falling')

	if Input.is_action_pressed(fsm.player_root.ui_up) :
		exit('jump')
		
	if Input.is_action_pressed(fsm.player_root.ui_grab):
		exit("grab")

	if Input.is_action_just_pressed(fsm.player_root.ui_thing_pull_out):
		fsm.player_root.toggle_thing_pull_out()
		play_current_sprite()
		

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
