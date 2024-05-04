extends Node

var fsm: StateMachine


func enter():
	fsm.player.play('dragging')


func exit(next_state):
	fsm.player_root.victim_is_safe()
	fsm.change_to(next_state)


func process(_delta):
	if Input.is_action_pressed(fsm.player_root.ui_right) or Input.is_action_pressed(fsm.player_root.ui_left):
		exit("walk")
	if not fsm.player_root.is_on_floor():
		exit('falling')
	if Input.is_action_pressed(fsm.player_root.ui_left) or Input.is_action_pressed(fsm.player_root.ui_right):
		exit('walk')
	if Input.is_action_pressed(fsm.player_root.ui_up) :
		exit('jump')


func physics_process(_delta):
	fsm.player_root.draging_move()
	if fsm.player_root.is_victim_grabing():
		fsm.player_root.emit_signal("change_position", fsm.player_root)
	
func input(_event):
	pass
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
