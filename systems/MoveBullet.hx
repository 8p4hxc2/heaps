// move an entity to a goal
package systems;

import core.System;
import core.State;
import core.Vector2d;
import components.Velocity;
import components.Goal;
import components.Position;
import components.Transform;
import entities.Enemy;

class MoveBullet extends System {
	public function new(_parent:State) {
		super(_parent);
		this.blueprints.set("default", ["Position", "Velocity", "Damage"]);
	}

	override function update(s2d:h2d.Object) {
		for (entity in entities['default']) {
			var position:Position = cast entity.components.get("Position");
			var velocity:Velocity = cast entity.components.get("Velocity");

			var currentVelocity:Vector2d = velocity.v;
			position.v = position.v.add(currentVelocity);

			if (position.v.y < -100) {
				remove(entity);
				entity.trash();
			}
		}
	}

	public function toString() {
		return "MoveBullet";
	}
}
