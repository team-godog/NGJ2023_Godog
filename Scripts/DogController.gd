extends VehicleBody3D
class_name DogController

@export var steeringAmount : float = 0.8;
@export var steeringBlendSpeed : float = 10;
@export var enginePower : float = 150;
@export var engineBlendSpeed : float = 10;


var steeringInput : float;
var engineInput : float;

func _physics_process(delta):
	ProcessInput();
	ProcessDriving(delta);
	
func ProcessInput():
	steeringInput = Input.get_axis("move_right", "move_left");
	engineInput = Input.get_axis("decelerate", "accelerate");
	
func ProcessDriving(delta : float):
	steering = lerp(steering, steeringInput * steeringAmount, delta * steeringBlendSpeed);
	engine_force = lerp(engine_force, engineInput * enginePower, delta * engineBlendSpeed);
