extends Node2D

const STEP = Vector2(0,100)
const DELTA = deg2rad(22.5)

func _ready():
	var l = Line2D.new()
	l.width = 10
	l.rotate(deg2rad(180))
	
	var p0 = Vector2(0,0)
	var p1 = p0 + STEP
	var p2 = p1 + STEP
	var p3 = STEP.rotated(-DELTA + -DELTA) + p2
	var p4 = STEP.rotated(-DELTA + -DELTA + DELTA) + p3
	var p5 = STEP.rotated(-DELTA + -DELTA + DELTA + DELTA) + p4
	
	l.add_point(p0)
	l.add_point(p1)
	l.add_point(p2)
	l.add_point(p3)
	l.add_point(p4)
	l.add_point(p5)



	print(p1)
	print(p2)
	print(p3)
	
	add_child(l)
