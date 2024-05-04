extends Node

class_name VictimStateMachine

const DEBUG = true
const PATH_TO_PARENT = '../'
const PLAYER_OBJECT = 'PlayerSprite' 
const SATATE_LABEL = 'CurrentStateLabel' 
#const RIGHT_WALL = 'RightWall'
#const LEFT_WALL = 'LeftWall'

var state: Object
var history = []

#var offset_list = [15,0] # values for offset left (0-index) or right (1-index), for correct direction

onready var player_root = get_node(PATH_TO_PARENT)
onready var player = player_root.find_node(PLAYER_OBJECT)
onready var state_label = player_root.find_node(SATATE_LABEL)


func _ready():
	# Set the initial state to the first child node	
	state = get_child(0)
	player_root.fsm = self
	call_deferred("_enter_state")


func change_to(new_state):
	history.append(state.name)
	state = get_node(new_state)
	_enter_state()


func back():
	if history.size() > 0:
		state = get_node(history.pop_back())
		_enter_state()

func get_history_back_state():
		return history.pop_back()

func _enter_state():
	if DEBUG:
		state_label.text = state.name
		print("VICTIM. Entering state: ", state.name)
	# Give the new state a reference to it's state machine i.e. this one
	state.fsm = self
	state.enter()


# Route Game Loop function calls to
# current state handler method if it exists
func _process(delta):
	if state.has_method("process"):
		state.process(delta)


func _physics_process(delta):
	if state.has_method("physics_process"):
		state.physics_process(delta)


func _input(event):
	if state.has_method("input"):
		state.input(event)

func _unhandled_input(event):
	if state.has_method("unhandled_input"):
		state.unhandled_input(event)


func _unhandled_key_input(event):
	if state.has_method("unhandled_key_input"):
		state.unhandled_key_input(event)


func _notification(what):
	if state and state.has_method("notification"):
			state.notification(what)


