extends Node


const DRAGGING_STATE_NAME = 'dragging'

var fsm: StateMachine



func enter():
	fsm.player.play('grab')
	fsm.player_root.toggle_victim_detector(true)


func exit(next_state):
	if next_state == DRAGGING_STATE_NAME and fsm.player_root.grabed_victim_body:
		fsm.player_root.start_draging_victim()
	if next_state != DRAGGING_STATE_NAME:
		fsm.player_root.toggle_victim_detector(false)
	fsm.change_to(next_state)
	
	


func process(_delta):
	pass


func physics_process(_delta):
	#if Input.is_action_pressed(fsm.player_root.ui_fuck) :
	#	exit('fuck')
	if not Input.is_action_pressed(fsm.player_root.ui_grab):
		exit(fsm.get_history_back_state())
	

func input(_event):
	if _event.is_action_pressed(fsm.player_root.ui_dragging) and fsm.player_root.grabed_victim_body:
		exit('dragging')
	
