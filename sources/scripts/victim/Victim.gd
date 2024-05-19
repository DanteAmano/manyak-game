extends VictimActorBase


const DRAG_OFFSET = 12
const DRAGGING_SPEED = 10

var is_in_fearing = false
var is_in_fucking = false


func get_status_is_good():
	## Статус True|False когда жертва в порядке
	return not(fsm.player_root.is_in_fearing or fsm.player_root.is_in_fucking)
