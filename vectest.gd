extends Node2D

func _ready():
	var l = Line2D.new()
	l.width = 20
	var p0 = Vector2(0,0)
	var p1 = Vector2(600,0).rotated(deg2rad(22.5))
	var p2 = Vector2(600,0).rotated(deg2rad(22.5 + 22.5)) + p1
	
	l.add_point(p0)
	l.add_point(p1)
	l.add_point(p2)

	print(p1)
	print(p2)
	
	add_child(l)
