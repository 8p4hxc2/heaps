package systems;

import core.System;
import core.State;
import components.Goal;
import components.Mouse;

class TargetMouse extends System {
	public function new(_parent:State) {
		super(_parent);
		this.blueprints.set("default", ["Mouse", "Goal"]);
	}

	override function update(s2d:h2d.Scene) {
		for (entity in entities['default']) {
			// var mouse:Mouse = cast entity.components.get("Mouse");
			var goal:Goal = cast entity.components.get("Goal");
			goal.x = s2d.mouseX;
			goal.y = s2d.mouseY;
		}
	}

	public function toString() {
		return "TargetMouse";
	}
}
