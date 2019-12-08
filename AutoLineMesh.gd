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
	
	
	var r = deg2rad(22.5)
	var axis = Vector3(0,0,1)
	
	
	
	# First POINT =  0,  0  ROTATED by r
	var first  = Vector3(0, 0, 0).rotated(axis,r)
	var second = Vector3(WIDTH, 200, 0).rotated(axis,r)
	# Second POINT = 0,200  ROTATED by r
	# Width = 100
	
	# Neg corner
	st.add_vertex(first)
	st.add_vertex(Vector3(0, 200, 0).rotated(axis,r))
	st.add_vertex(second)

	# Pos corner
	st.add_vertex(Vector3(WIDTH, 200, 0).rotated(axis,r))
	st.add_vertex(Vector3(WIDTH, 0, 0).rotated(axis,r))
	st.add_vertex(Vector3(0, 200, 0).rotated(axis,r))
	
	# Third POINT = 
	
	
	mesh = st.commit()
	