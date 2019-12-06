extends Node2D

const STEP = Vector2(0,50)
const DELTA = deg2rad(22.5)

func draw_tree(ser_tree, pos, rot, stack):
	if ser_tree.empty():
		print("draw_tree done")
		return
	
	var prs = draw_symbol(ser_tree.substr(0,1), pos, rot, stack, Line2D.new())
	
	return draw_tree(ser_tree.substr(1,ser_tree.length() - 1), prs[0], prs[1], prs[2])

func draw_symbol(sym, pos, rot, stack, line):
	if sym == "F":
		return
	elif sym == "+":
		return
	elif sym == "-":
		return
	elif sym == "[":
		return
	elif sym == "]":
		return
		
	return

func _ready():
	var l = Line2D.new()
	l.width = 5
	l.rotate(deg2rad(180))  # Face up
	l.scale = Vector2(-1,1) # Flip along X axis
	
	var d = 0
	var pos = Vector2(0,0)
	
	# step 0
	l.add_point(pos)
	
	# step 1
	pos = pos + STEP.rotated(d)
	l.add_point(pos)
	
	# step 2
	pos = pos + STEP.rotated(d)
	l.add_point(pos)
	
	# step 3
	d = d + -DELTA
	
	# step 4
	d = d + -DELTA
	
	# step 5
	pos = STEP.rotated(d) + pos
	l.add_point(pos)
	
	# step 6
	d = d + DELTA
	
	# step 7
	pos = STEP.rotated(d) + pos
	l.add_point(pos)
	
	# step 8
	d = d + DELTA
	
	# step 9
	pos = STEP.rotated(d) + pos
	l.add_point(pos)
	
	
	add_child(l)
