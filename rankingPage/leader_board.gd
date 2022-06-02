extends ScrollContainer

var entry_scene = preload("res://rankingPage/LeaderBoardEntry.tscn")
func display(json_raw):
	# Remove all old entries
	for child in get_children():
		remove_child(child)
		
	# Add new entries
	var json_res = JSON.parse(json_raw).result
	print(json_res)
	for item in json_res:
		var entry = entry_scene.instance()
		entry.set_text(str(item['UserName']))
		add_child(entry)
