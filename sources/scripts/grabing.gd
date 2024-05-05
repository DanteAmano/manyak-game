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

	if Input.is_action_pressed(fsm.player_root.ui_up) :
		exit('jump')
		
	if Input.is_action_pressed(fsm.player_root.ui_fuck) :
		exit('fuck')
	
	if not Input.is_action_pressed(fsm.player_root.ui_dragging):
		fsm.back()


func physics_process(_delta):
	fsm.player_root.draging_move()
	if fsm.player_root.is_victim_grabing():
		fsm.player_root.emit_signal("change_position", fsm.player_root)
	
	
func input(_event):
	pass
	

func unhandled_input(_event):
	pass

func unhandled_key_input(_event):
	pass

func notification(_what, _flag = false):
	pass
