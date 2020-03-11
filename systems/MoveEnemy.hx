// move an entity to a goal
package systems;

import core.System;
import core.State;
import core.Vector2d;
import components.Velocity;
import components.Goal;
import components.Position;
import components.Transform;
import entities.Bullet;

class MoveEnemy extends System {
	public function new(_parent:State) {
		super(_parent);
		this.blueprints.set("default", ["Position", "Velocity", "TakeDamage"]);
	}

	override function update(s2d:h2d.Object) {
		for (entity in entities['default']) {
			var position:Position = cast entity.components.get("Position");
			var velocity:Velocity = cast entity.components.get("Velocity");

			var currentVelocity:Vector2d = velocity.v;
			position.v = position.v.add(currentVelocity);

			if (entity.isTrash()) {
				remove(entity);
			}

			if (position.v.y > 2000) {
				entity.trash();
			}
		}
	}

	public function toString() {
		return "MoveEnemy";
	}
}
