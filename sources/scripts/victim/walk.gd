extends Node

var fsm: VictimStateMachine



func enter():
	fsm.player.play('walk')
	#yield(get_tree().create_timer(3), "timeout")
	#exit('idle')


func exit(next_state):
	fsm.change_to(next_state)


func process(_delta):
	pass

func physics_process(_delta):
	#fsm.set_direction(fsm.player, Input.is_action_pressed(fsm.player_root.ui_right))
	fsm.player_root.velocity.x = -1*fsm.player_root.SPEED


func input(_event):
	pass


func unhandled_input(_event):
	pass

func unhandled_key_input(_event):
	pass

func notification(_what, _flag = false):
	pass
