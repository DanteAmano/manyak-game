extends Node

class_name VictimCommand

var actor: Object

func set_is_victim_good():
	actor.is_in_fearing = false
	actor.is_in_fucking = false
	actor.fsm.state.exit('idle')

func set_is_grabbing_victim():
	actor.fsm.state.exit('panic')


func set_is_dragging_victim(player):
	actor.position.x = calculate_position_by_player(player)
	actor.sprite.flip_h = not player.sprite.flip_h
	actor.fsm.state.exit('fear')

func change_position(player):
	actor.position.x = calculate_position_by_player(player)


func calculate_position_by_player(player):
	return player.position.x-actor.DRAG_OFFSET * player.current_flip_to_num()

func set_is_not_victim_grabbing():
	actor.fsm.state.exit('idle')
	
func set_fucking_victim():
	actor.is_in_fucking=true
	actor.fsm.state.exit('fuck')
