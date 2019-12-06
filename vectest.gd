extends Node2D

const STEP = Vector2(0,50)
const DELTA = deg2rad(22.5)

func _ready():
	var l = Line2D.new()
	l.width = 5
	l.rotate(deg2rad(180))  # Face up
	l.scale = Vector2(-1,1) # Flip along X axis
	
	var d = 0
	var pos = Vector2(0,0)
	
	l.add_point(pos)
	var p1 = pos + STEP
	var p2 = p1 + STEP
	var p3 = STEP.rotated(-DELTA + -DELTA) + p2
	var p4 = STEP.rotated(-DELTA + -DELTA + DELTA) + p3
	var p5 = STEP.rotated(-DELTA + -DELTA + DELTA + DELTA) + p4
	
	l.add_point(p1)
	l.add_point(p2)
	l.add_point(p3)
	l.add_point(p4)
	l.add_point(p5)

	print(p1)
	print(p2)
	print(p3)
	
	add_child(l)
