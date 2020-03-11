package core;

class System {
	var blueprints:Map<String, Array<String>> = new Map();
	var entities:Map<String, Map<Int, Entity>> = new Map();
	var parent:State;

	public function new(_parent:State) {
		parent = _parent;
	}

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
					entities[key][entity.id] = entity;
				}
			}
		}
	}

	public function remove(entity:Entity) {
		for (key in blueprints.keys()) {
			entities[key].remove(entity.id);
		}
	}

	public function getEntityCount() {
		var entityCount:Int = 0;

		for (key in blueprints.keys()) {
			for (entity in entities[key]) {
				entityCount++;
			}
		}

		return entityCount;
	}

	public function update(s2d:h2d.Object) {}
}
