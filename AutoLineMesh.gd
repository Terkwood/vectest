extends MeshInstance2D

const WIDTH = 5
const STEP = 200
const Z = Vector3(0,0,1)

func draw_step(point, rot, st, i):

	var offset = Vector3(point.x, point.y, 0)
	# Neg corner
	st.add_vertex(Vector3(0,0, 0).rotated(Z,rot) + offset)
	var final = Vector3(0, STEP, 0).rotated(Z,rot) + offset
	st.add_vertex(final)
	
	st.add_vertex(Vector3( WIDTH, STEP, 0).rotated(Z,rot) + offset)
	st.add_vertex(Vector3(WIDTH, 0, 0).rotated(Z,rot) + offset)

	var j = i * 4
	st.add_index(j)
	st.add_index(j + 1)
	st.add_index(j + 2)
	
	st.add_index(j)
	st.add_index(j + 2)
	st.add_index(j + 3)
	
	return Vector2(final.x, final.y)


func _ready():
	var st = SurfaceTool.new()
	
	var material = SpatialMaterial.new()
	material.albedo_color = Color(0,0,0)
	material.albedo_texture = Texture.new()

	st.set_material(material)
	
	# Let's draw a rectangle from -200, -200 to 200, 200
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	
	var r = deg2rad(40)

	var p1 = draw_step(Vector2(0, -222), r, st, 0)
	var p2 = draw_step(p1, deg2rad(80), st, 1)
	var p3 = draw_step(p2, deg2rad(120), st, 2)

	mesh = st.commit()
