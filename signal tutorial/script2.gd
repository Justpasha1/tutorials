extends Label
	 
func _on_area_2d_mouse_entered():
	self['theme_override_colors/font_color'] = '#ffffff'


func _on_area_2d_mouse_exited():
	self['theme_override_colors/font_color'] = '#000000'
