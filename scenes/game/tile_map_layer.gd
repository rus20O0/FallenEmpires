extends TileMapLayer

# TileMap, который нужно заполнить, и ID тайла
@export var tilemap: TileMap
@export var tile_id: int = 4  # ID тайла для заполнения

func _ready():
	# Определите границы области (в координатах TileMap)
	var start_position = Vector2i(5, 5)  # Верхний левый угол области
	var end_position = Vector2i(10, 10) # Нижний правый угол области

	# Заполняем область шестиугольниками
	fill_hex_area(start_position, end_position)


func fill_hex_area(start_pos: Vector2i, end_pos: Vector2i) -> void:
	# Проверяем, что TileMap существует
	if tilemap == null:
		print("TileMap не назначен!")
		return

	# Проходим по всем координатам в заданной области
	for y in range(start_pos.y, end_pos.y + 1):
		for x in range(start_pos.x, end_pos.x + 1):
			# Для шестиугольной сетки добавляем смещение
			if y % 2 == 0:
				tilemap.set_cell(0, Vector2i(x, y), tile_id)
			else:
				tilemap.set_cell(0, Vector2i(x + 1, y), tile_id)
