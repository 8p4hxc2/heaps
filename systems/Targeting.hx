// change a goal to a target position
package systems;

import core.System;
import core.State;
import components.Goal;
import components.Position;

class Targeting extends System {
	public function new(_parent:State) {
		super(_parent);
		this.blueprints.set("source", ["Position", "Attack", "Goal"]);
		this.blueprints.set("target", ["Position", "Target"]);
	}

	override function update(s2d:h2d.Object) {
		for (entitySource in entities["source"]) {
			for (entityTarget in entities["target"]) {
				var targetPosition:Position = cast entityTarget.components.get("Position");
				var goal:Goal = cast entitySource.components.get("Goal");

				if (entitySource.id != entityTarget.id) {
					goal.x = targetPosition.v.x;
					goal.y = targetPosition.v.y;
				}
			}
		}
	}

	public function toString() {
		return "Targeting";
	}
}
