extends Node

var fsm: VictimStateMachine

var direction: int
var timer: SceneTreeTimer


func enter():
	direction = fsm.player_root.change_direction()
	fsm.player.play('walk')
	timer = get_tree().create_timer(fsm.player_root.duration_walking)
	timer.connect("timeout", self, "_on_timer_timeout")


func _on_timer_timeout():
	if not fsm.player_root.is_in_fearing:
		fsm.exit_with_checking(self, 'idle')
		

func exit(next_state):
	fsm.change_to(next_state)


func process(_delta):
	pass

func physics_process(_delta):
	fsm.player_root.velocity.x = direction * fsm.player_root.SPEED


func input(_event):
	pass


func unhandled_input(_event):
	pass

func unhandled_key_input(_event):
	pass

func notification(_what, _flag = false):
	pass
