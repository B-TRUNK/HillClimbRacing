extends Node2D

var coins_collected : int = 0

func add_coins(coin_amount):
	coins_collected += coin_amount
	
	$Hud/Coin/Label.text = str(coins_collected)

func update_fuel_UI(value):
	$Hud/Fuel/ProgressBar.value = value
	var stylebox = $Hud/Fuel/ProgressBar.get("custom_styles/fg")
	#stylebox.bg_color.h = lerp(0 ,0.3 ,value / 100)

