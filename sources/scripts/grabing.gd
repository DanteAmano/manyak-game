extends Node

var fsm: StateMachine


func enter():
	fsm.player.play('dragging')


func exit(next_state):
	fsm.player_root.toggle_victim_detector(false)
	fsm.change_to(next_state)


func process(_delta):
	if Input.is_action_pressed(fsm.player_root.ui_right) or Input.is_action_pressed(fsm.player_root.ui_left):
		exit("walk")

	if Input.is_action_pressed(fsm.player_root.ui_up) :
		exit('jump')
		
	#if Input.is_action_pressed(fsm.player_root.ui_fuck) :
	#	exit('fuck')
	
	if not Input.is_action_pressed(fsm.player_root.ui_dragging):
		fsm.back()


func physics_process(_delta):
	fsm.player_root.draging_move()
	
	# Moving victim
	fsm.player_root.moving_victim()
	
	
func input(_event):
	pass
	

func unhandled_input(_event):
	pass

func unhandled_key_input(_event):
	pass

func notification(_what, _flag = false):
	pass
