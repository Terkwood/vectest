extends Node2D

const STEP = Vector2(100,0)

func _ready():
	var l = Line2D.new()
	l.width = 20
	var p0 = Vector2(0,0)
	var p1 = STEP.rotated(deg2rad(22.5))
	var p2 = STEP.rotated(deg2rad(22.5 + 22.5)) + p1
	var p3 = STEP.rotated(deg2rad(22.5 + 22.5 + 22.5)) + p2
	
	l.add_point(p0)
	l.add_point(p1)
	l.add_point(p2)
	l.add_point(p3)

	print(p1)
	print(p2)
	print(p3)
	
	add_child(l)
