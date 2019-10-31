package core;

class State {
	var systems:Array<System> = [];
	var paused:Bool = false;

	public function register(entity:Entity) {
		for (s in systems) {
			s.register(entity);
		}
	}

	public function update(s2d:h2d.Scene) {
		if (!paused) {
			for (s in systems) {
				s.update(s2d);
			}
		}
	}
}
