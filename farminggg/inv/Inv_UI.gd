extends Control

@onready var inv: Inv = preload("res://inv/playerinv.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

var is_open = false

func _ready():
	close()
	
func update_slots():
	for inv in range(min(inv.item.size(), slots.size())):
		slots[inv].update(inv.item[inv])
		
	
func _process(delta):
	if Input.is_action_just_pressed("inv"):
		if is_open:
			close()
		else:
			open()
	
func open():
	visible = true
	is_open = true

func close():
	visible = false
	is_open = false
