extends StaticBody

class_name StaticPlatform

export(String, "1", "2", "3", "4", "5") var this_color : String = "1"
var material

func _ready():
	material = $MeshInstance.get("material/0").duplicate()
	$MeshInstance.set("material/0",material)
	match this_color:
		"1":
			material.albedo_color = Color("#fbf3df")
		"2":
			material.albedo_color = Color("#e6b1f2")
		"3":
			material.albedo_color = Color("#b47dde")
		"4":
			material.albedo_color = Color("#602bca")
		"5":
			material.albedo_color = Color("#1D2062")
