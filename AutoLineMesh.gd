extends MeshInstance2D

const WIDTH = 30
const STEP = 200
const Z = Vector3(0,0,1)

func draw_step(point, rot, st, i):

	
	# Neg corner
	st.add_vertex(Vector3(point.x, point.y, 0).rotated(Z,rot))
	var final = Vector3(point.x, point.y + STEP, 0).rotated(Z,rot)
	st.add_vertex(final)
	
	st.add_vertex(Vector3(point.x + WIDTH, point.y + STEP, 0).rotated(Z,rot))
	st.add_vertex(Vector3(point.x + WIDTH, point.y, 0).rotated(Z,rot))

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

	var p1 = draw_step(Vector2(-111, -222), r, st, 0)
	draw_step(p1, 0, st, 1)

	mesh = st.commit()
	