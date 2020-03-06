package systems;

import core.System;
import components.Goal;
import components.Position;

class Targeting extends System {
	public function new() {
		this.blueprints.set("source", ["Position", "Attack", "Goal"]);
		this.blueprints.set("target", ["Position", "Target"]);
	}

	override function update(s2d:h2d.Scene) {
		for (entitySource in entities["source"]) {
			for (entityTarget in entities["target"]) {
				var positionData:Position = cast entityTarget.components.get("Position");
				var goal:Goal = cast entitySource.components.get("Goal");

				if (entitySource.id != entityTarget.id) {
					goal.x = positionData.v.x;
					goal.y = positionData.v.y;
				}
			}
		}
	}
}
