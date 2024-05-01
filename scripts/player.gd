extends RigidBody2D

var speed = 60000
var max_speed = 30

# 2 - adding fule mechanism
var fuel = 100

func _ready():
	$Camera2D.drag_horizontal_offset = 5
	get_parent().update_fuel_UI(fuel)
	

func _physics_process(delta):
	
	drain_fuel(delta)
	$Label.text = str(fuel)
	
	if fuel > 0:
		if Input.is_action_pressed("ui_right"):
			if $PinJoint2D/Wheel.angular_velocity < max_speed and $PinJoint2D2/Wheel.angular_velocity < max_speed:
				$PinJoint2D/Wheel.apply_torque_impulse(speed * delta * 60)
				$PinJoint2D2/Wheel.apply_torque_impulse(speed * delta * 60)
			
		if Input.is_action_pressed("ui_left"):
			if $PinJoint2D/Wheel.angular_velocity > -max_speed and $PinJoint2D2/Wheel.angular_velocity > -max_speed:
				$PinJoint2D/Wheel.apply_torque_impulse(-speed * delta * 60)
				$PinJoint2D2/Wheel.apply_torque_impulse(-speed * delta * 60)	
		
# 2 - 1
func refuel():
	fuel = 100
	get_parent().update_fuel_UI(fuel)
	
# 2 - 2
func drain_fuel(delta):
	fuel -= 5 * delta
	fuel = clamp(fuel ,0 ,100)
	get_parent().update_fuel_UI(fuel)
