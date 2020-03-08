/*package systems;

import core.System;
import components.Mouse;

class UpdateMouse extends System {
	public function new() {
		this.blueprints.set("default", ["Mouse"]);
	}

	override function update(s2d:h2d.Scene) {
		for (entity in entities['default']) {
			var mouse:Mouse = cast entity.components.get("Mouse");
			mouse.x = s2d.mouseX;
			mouse.y = s2d.mouseY;
		}
	}
}*/
