package core;

class System {
	var blueprints:Map<String, Array<String>> = new Map();
	var entities:Map<String, Array<Entity>> = new Map();

	public function register(entity:Entity) {
		for (key in blueprints.keys()) {
			if (entities[key] == null) {
				entities[key] = [];
			}

			var match:Int = 0;
			var total:Int = blueprints[key].length;

			for (component in blueprints[key]) {
				if (entity.hasComponent(component) || component.indexOf('~') != -1) {
					match++;
				}

				if (match == total) {
					entities[key].push(entity);
				}
			}
		}
	}

	public function update(s2d:h2d.Scene) {}
}
