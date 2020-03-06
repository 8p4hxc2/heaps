package systems;

import core.System;
import components.Goal;
import components.Mouse;

class TargetMouse extends System {
	public function new() {
		this.blueprints.set("default", ["Mouse", "Goal"]);
	}

	override function update(s2d:h2d.Scene) {
		for (entity in entities['default']) {
			var mouse:Mouse = cast entity.components.get("Mouse");
			var goal:Goal = cast entity.components.get("Goal");
			goal.x = mouse.x;
			goal.y = mouse.y;
		}
	}
}
