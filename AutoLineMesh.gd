extends MeshInstance2D

const WIDTH = 100
	

func _ready():
	var st = SurfaceTool.new()
	
	var material = SpatialMaterial.new()
	material.albedo_color = Color(0,0,0)
	material.albedo_texture = Texture.new()

	st.set_material(material)
	
	# Let's draw a rectangle from -200, -200 to 200, 200
	st.begin(Mesh.PRIMITIVE_TRIANGLE_FAN)
	
	
	# First POINT = 0,0
	# Second POINT = 0,200
	# Width = 100
	
	var r = deg2rad(22.5)
	var axis = Vector3(0,0,1)
	
	# Neg corner
	st.add_vertex(Vector3(0, 0, 0))
	st.add_vertex(Vector3(0, 200, 0))
	st.add_vertex(Vector3(WIDTH, 200, 0))

	# Pos corner
	st.add_vertex(Vector3(WIDTH, 200, 0).rotated(axis,r))
	st.add_vertex(Vector3(WIDTH, 0, 0).rotated(axis,r))
	st.add_vertex(Vector3(0, 200, 0).rotated(axis,r))
	
	
	mesh = st.commit()
	