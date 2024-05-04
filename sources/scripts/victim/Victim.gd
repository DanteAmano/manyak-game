extends KinematicBody2D


var fsm: VictimStateMachine


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Player_is_victim_good():
	fsm.change_to('idle')
	#fsm.back()


func _on_Player_is_grabbing_victim():
	fsm.change_to('panic')


func _on_Player_is_dragging_victim():
	fsm.change_to('fear')


func _on_Player_change_position(x, y):
	self.position.x = x-12
	self.position.y = y
	print(x,y, 'POSITION')
