extends Node2D

const STEP = Vector2(0,-25)
const DELTA = deg2rad(-22.5)

func new_line():
	var l = Line2D.new()
	l.width = 5
	return l

func draw_tree(ser_tree, pos, rot, stack, line):
	if ser_tree.empty():
		print("draw_tree done")
		return
	
	var prs = draw_symbol(ser_tree.substr(0,1), pos, rot, stack, line)
	
	return draw_tree(ser_tree.substr(1,ser_tree.length() - 1), prs[0], prs[1], prs[2], prs[3])

func draw_symbol(sym, pos, rot, stack, line):
	if sym == "F":
		var p = pos + STEP.rotated(rot)
		line.add_point(p)
		return [p, rot, stack, line]
	elif sym == "+":
		return [pos, rot + DELTA, stack, line]
	elif sym == "-":
		return [pos, rot - DELTA, stack, line]
	elif sym == "[":
		stack.push_front([pos, rot])
		print("push [pos %s, rot %s]" % [pos, rot])
		return [pos, rot, stack, line]
	elif sym == "]":
		var pr = stack.pop_front()
		print("pop [pos %s, rot %s]" % [pr[0], pr[1]])
		
		# you need to start a new line at the old position
		add_child(line)
		var nl = new_line()
		nl.add_point(pr[0])
		
		return [pr[0], pr[1], stack, nl]
		
	print("HALP")
	return

func _unready():
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

const EASY = "FF-[-F+F+F]"
const MEDIUM = "FF-[-F+F+F]+[+F-F-F]FF-[-F+F+F]+[+F-F-F]-[-FF-[-F+F+F]+[+F-F-F]+FF-[-F+F+F]+[+F-F-F]+FF-[-F+F+F]+[+F-F-F]]+[+FF-[-F+F+F]+[+F-F-F]-FF-[-F+F+F]+[+F-F-F]-FF-[-F+F+F]+[+F-F-F]]FF-[-F+F+F]+[+F-F-F]FF-[-F+F+F]+[+F-F-F]-[-FF-[-F+F+F]+[+F-F-F]+FF-[-F+F+F]+[+F-F-F]+FF-[-F+F+F]+[+F-F-F]]+[+FF-[-F+F+F]+[+F-F-F]-FF-[-F+F+F]+[+F-F-F]-FF-[-F+F+F]+[+F-F-F]]-[-FF-[-F+F+F]+[+F-F-F]FF-[-F+F+F]+[+F-F-F]-[-FF-[-F+F+F]+[+F-F-F]+FF-[-F+F+F]+[+F-F-F]+FF-[-F+F+F]+[+F-F-F]]+[+FF-[-F+F+F]+[+F-F-F]-FF-[-F+F+F]+[+F-F-F]-FF-[-F+F+F]+[+F-F-F]]+FF-[-F+F+F]+[+F-F-F]FF-[-F+F+F]+[+F-F-F]-[-FF-[-F+F+F]+[+F-F-F]+FF-[-F+F+F]+[+F-F-F]+FF"

func _notready():
	draw_tree(MEDIUM, Vector2(0,0), 0, [], new_line())
	
	
	#rotate(deg2rad(180))  # Face up
	#scale = Vector2(-1,1) # Flip along X axis