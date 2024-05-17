extends KinematicBody2D


var fsm: VictimStateMachine


const SPEED = 20
const GRAVITY = 15
const JUMPFORCE = -500
const SPEED_SLIDE = 30
const DRAG_OFFSET = 12
const DRAGGING_SPEED = 10

var velocity = Vector2(0,0) # Скорость игрока по координатам x, y

onready var sprite = get_node("PlayerSprite")


func _physics_process(delta):
	velocity = move_and_slide(velocity, Vector2.UP) # Vector2.UP - направелние снизу вверх. Внизу пол.
	velocity.y +=  GRAVITY
	velocity.x = lerp(velocity.x, 0, 0.3)

	



func _on_Player_is_victim_good():
	fsm.change_to('idle')
	#fsm.back()


func _on_Player_is_grabbing_victim():
	fsm.change_to('panic')


func _on_Player_is_dragging_victim(player):
	self.position.x = calculate_position_by_player(player)
	self.sprite.flip_h = not player.sprite.flip_h
	fsm.change_to('fear')
	


func _on_Player_change_position(player):
	self.position.x = calculate_position_by_player(player)


func calculate_position_by_player(player):
	return player.position.x-DRAG_OFFSET * player.current_flip_to_num()



func _on_Player_is_not_victim_grabbing():
	fsm.change_to('idle')
