point1 = [0,0,0]
point2 = [0.1,0.1,0.1]
model = Sketchup.active_model
entities = model.active_entities
entities.add_edges(point1, point2)
