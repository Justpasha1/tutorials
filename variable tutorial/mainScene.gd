extends Node2D

var Variable

const constant_Variable = '1'

var intVar : int
var strVar : String
var boolVar : bool
var floatVar : float
var arrayVar : Array



@export var exportedVar : String

@export var exportedVarint : int


@export_category("First shit")
@export_dir var dir
@export_file('*.gd') var script1 = 'enter fucking file'

@export_category('second shit')
@export_global_file('*.svg') var file = ''
@export_group('chhoooo')
@export_enum("first", "second", 'third') var place
@export_range(0, 100, 25) var ffffffff
