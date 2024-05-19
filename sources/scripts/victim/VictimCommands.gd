extends Node

class_name VictimCommand

var actor: Object

func is_victim_good():
	actor.is_in_fearing = false
	actor.fsm.change_to('idle')

func is_grabbing_victim():
	actor.fsm.change_to('panic')


func is_dragging_victim(player):
	actor.position.x = calculate_position_by_player(player)
	actor.sprite.flip_h = not player.sprite.flip_h
	actor.fsm.change_to('fear')

func change_position(player):
	actor.position.x = calculate_position_by_player(player)


func calculate_position_by_player(player):
	return player.position.x-actor.DRAG_OFFSET * player.current_flip_to_num()

func is_not_victim_grabbing():
	actor.fsm.change_to('idle')
