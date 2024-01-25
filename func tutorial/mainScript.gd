extends Node2D

@export var var1 : int
@export var var2 : int

var var3 : int

@export_enum('firstVar','secondVar','thirdVar') var matchVar 

var listVar = [12, 13]
var whileVar : int

var stopWhileFrom : int = 5

func _ready():
	#if var1 > 5:
		#print(var1," grater than 5") #var1 = 6
	#elif var2 < 5:
		#print(var2," lower than 5") #var2 = 4
	#else:
		#print('neither worked')
	#for i in range(12):
		#print("for repeated ",i)
	#while  whileVar != 12:
		#whileVar += 1
		#print(whileVar," - times worked")
	#while whileVar != 12:
		#whileVar += 1
		#if whileVar == stopWhileFrom: #stopWhileFrom = 4
			#print("While stopped")
			#break
		#else:
			#print(whileVar," times worked")
	#match matchVar: #matchVar = secondVar воно конвертується в число по порядковому списку
		#0:
			#print("first time worked")
		#1:
			#print("second time worked")
		#2:
			#print('third time worked')
	var3 = combineVars(var1,var2) #var1 = 6, var2 = 4
	print(var3)

func combineVars(var1, var2):
	return var1 + var2

func regular_function():
	pass #Pass просто заглушка І НІЧОГО БІЛЬШОГО
