package core;

class System {
	var blueprints:Map<String, Array<String>> = new Map();
	var entities:Map<String, Map<Int, Entity>> = new Map();

	var entityCount:Int = 0;

	public function register(entity:Entity) {
		for (key in blueprints.keys()) {
			if (entities[key] == null) {
				entities[key] = new Map();
			}

			var match:Int = 0;
			var total:Int = blueprints[key].length;

			for (component in blueprints[key]) {
				if (entity.hasComponent(component) || component.indexOf('~') != -1) {
					match++;
				}

				if (match == total) {
					entityCount++;
					entities[key][entity.id] = entity;
				}
			}
		}
	}

	public function remove(entity:Entity) {
		for (key in blueprints.keys()) {
			entities[key].remove(entity.id);
			entityCount--;
		}
	}

	public function getEntityCount() {
		return entityCount;
	}

	public function update(s2d:h2d.Scene) {}
}
