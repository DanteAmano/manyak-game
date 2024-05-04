extends Node

const VICTIM_GROUP_NAME = 'victim'
const DRAGGING_STATE_NAME = 'dragging'

var fsm: StateMachine



func enter():
	fsm.player.play('grab')
	emit_signal_in_captured_victim("is_grabbing_victim")


func emit_signal_in_captured_victim(signal_name):
	if fsm.player_root.drag_area.get_overlapping_bodies():
		for body in fsm.player_root.drag_area.get_overlapping_bodies():
			if VICTIM_GROUP_NAME in body.get_groups():
				fsm.player_root.emit_signal(signal_name)
				
				
func exit(next_state):
	if next_state == DRAGGING_STATE_NAME:
		emit_signal_in_captured_victim("is_dragging_victim")
	if next_state != DRAGGING_STATE_NAME:
		fsm.player_root.emit_signal("is_victim_good")
	fsm.change_to(next_state)


func process(_delta):
	pass


func physics_process(_delta):
	if not Input.is_action_pressed(fsm.player_root.ui_grab):
		exit(fsm.get_history_back_state())


	
func input(_event):
	if _event.is_action_pressed(fsm.player_root.ui_dragging):
		exit('dragging')
	## attacks listener#####
	#if _event.is_action_pressed(fsm.player_root.ui_close_attack):
	#	exit('close_attack')
	#if _event.is_action_pressed(fsm.player_root.ui_ranged_attack):
	#	exit('ranged_attack')
	########################
	#if _event.is_action_pressed(fsm.player_root.ui_left) or _event.is_action_pressed(fsm.player_root.ui_right):
	#	exit('walk')
	#elif _event.is_action_pressed(fsm.player_root.ui_up) :
	#	exit('jump')
	

func unhandled_input(_event):
	pass

func unhandled_key_input(_event):
	pass

func notification(_what, _flag = false):
	pass
