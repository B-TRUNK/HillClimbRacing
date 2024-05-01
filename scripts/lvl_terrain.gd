extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var curve = $Path2D.curve
	var polygon = curve.get_baked_points()
	
	$Polygon2D.polygon = polygon
	$Line2D.points = polygon
	
	$CollisionPolygon2D.polygon = polygon


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
