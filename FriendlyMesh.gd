extends MeshInstance2D

func _ready():
	var st = SurfaceTool.new()
	
	var material = SpatialMaterial.new()
	material.albedo_color = Color(0,0,0)
	material.albedo_texture = Texture.new()

	st.set_material(material)
	
	# Let's draw a rectangle from -200, -200 to 200, 200
	st.begin(Mesh.PRIMITIVE_TRIANGLE_FAN)
	
	# Pos corner
	st.add_vertex(Vector3(200, -200, 0))
	st.add_vertex(Vector3(-200, 200, 0))
	st.add_vertex(Vector3(200, 200, 0))
	
	# Neg corner
	st.add_vertex(Vector3(-200, -200, 0))
	st.add_vertex(Vector3(-200, 200, 0))
	st.add_vertex(Vector3(200, -200, 0))
	
	mesh = st.commit()
	