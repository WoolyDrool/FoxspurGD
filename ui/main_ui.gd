extends Control

var trashLabel
var recLabel
var totalLabel
var collectLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	trashLabel = $"TrashCount"
	recLabel = $"RecCount"
	totalLabel = $"TotalCount"
	collectLabel = $"CollectedCount"

	EventBus.G_UI_UPDATE_COUNTS.connect(_update_counts)
	#EventBus.E_O_COLLECT_TRASH.connect(_update_label_trash)
	#EventBus.E_O_COLLECT_RECYCLE.connect(_update_label_recycle)
	pass # Replace with function body.

func _update_counts():
	_update_label_trash()
	_update_label_recycle()

	var _UItotalCollected = (PlayerInventory.level_trash_count + PlayerInventory.level_recycle_count)
	var _UItotalInTrail = TrailManager.totalItemsInTrail

	totalLabel.text = str(_UItotalInTrail)
	collectLabel.text = str(_UItotalCollected)

	pass

func _update_label_trash() -> void:
	trashLabel.text = "Trash - " + str(PlayerInventory.level_trash_count)
	#print("Updated trash label")

func _update_label_recycle() -> void:
	recLabel.text = "Recycle - " + str(PlayerInventory.level_recycle_count)
	#print("Updated recycle label")
