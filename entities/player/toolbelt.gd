extends Node3D

class_name Toolbelt

# Main variables
@export var LeftHandNode : Node3D
@export var RightHandNode : Node3D
var animPlayer
var leftTool : UsableTool
var rightTool : UsableTool
var canUseTools = true
var canGet

var curPos : Vector3
var nexPos : Vector3
var lerpSpeed = 1

@export var raycaster : RayCast3D 

func _ready():
    animPlayer = $"ToolPlayer"

func _process(delta):
    _process_input()
	
func _process_input():
    if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
        if Input.is_action_just_pressed("tool_primary"):
            #if leftTool:
                _UseRightHand()
        if Input.is_action_just_pressed("tool_secondary"):
            #if rightTool:
                _UseLeftHand()

func _UseLeftHand():
    print("L")
    animPlayer.play("anim_leftSwing_1")
    #leftTool._tool_primary()
    pass

func _UseRightHand():
    print("R")
    animPlayer.play("anim_rightSwing_1")
    #rightTool._tool_primary()
    pass

func AddToolToToolbelt(path, lor):
    var _addedTool = load(path)
    _addedTool.instance()
    if lor == true:
        LeftHandNode.add_child(_addedTool)
    else:
        RightHandNode.add_child(_addedTool)
    # for being communicated with from the 
    pass

func RemoveToolFromToolbelt(_removedTool):
    pass