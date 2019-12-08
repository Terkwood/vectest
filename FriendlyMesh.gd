extends MeshInstance2D

func _ready():
	var st = SurfaceTool.new()
	
	var material = SpatialMaterial.new()
	material.albedo_color = Color(0,0,0)
	material.albedo_texture = Texture.new()

	st.set_material(material)
	
	st.begin(Mesh.PRIMITIVE_TRIANGLE_FAN)
	
	st.add_vertex(Vector3(200, -200, 0))
	st.add_vertex(Vector3(-200, 200, 0))
	st.add_vertex(Vector3(200, 200, 0))
	
	
	st.add_vertex(Vector3(-200, -200, 0))
	st.add_vertex(Vector3(-200, 200, 0))
	st.add_vertex(Vector3(200, -200, 0))
	
	mesh = st.commit()
	