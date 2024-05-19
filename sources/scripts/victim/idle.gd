extends Node

var fsm: VictimStateMachine


func enter():
	fsm.player.play('idle')
	yield(get_tree().create_timer(fsm.player_root.get_duration_idle()), "timeout")
	if not fsm.player_root.is_in_fearing:
		fsm.exit_with_checking(self, 'walk')


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
