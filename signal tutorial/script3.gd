extends Label

signal bro(ints:int, intd:String)

func _on_line_edit_text_submitted(new_text):
	var text : String = "Name %s"
	self.text = text % [new_text]
	emit_signal("bro",12, new_text)
	
	await 

func _on_bro(ints, AAAA):
	print(ints)
	print(AAAA)
