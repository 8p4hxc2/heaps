// move an entity to a goal
package systems;

import core.System;
import core.State;
import core.Vector2d;
import components.Velocity;
import components.Goal;
import components.Position;
import components.Transform;
import entities.Explosion;

class KillEnemy extends System {
	public function new(_parent:State) {
		super(_parent);
		this.blueprints.set("enemy", ["Attack"]);
		this.blueprints.set("bullet", ["Damage"]);
	}

	override function update(s2d:h2d.Scene) {
		for (bulletEntity in entities['bullet']) {
			for (enemyEntity in entities['enemy']) {
				var enemyPosition:Position = cast enemyEntity.components.get("Position");
				var bulletPosition:Position = cast bulletEntity.components.get("Position");

				if ((enemyPosition.v.x < bulletPosition.v.x || enemyPosition.v.x < bulletPosition.v.x + 14)
					&& enemyPosition.v.x + 27 > bulletPosition.v.x
					&& bulletPosition.v.y < enemyPosition.v.y + 25) {
					// trace(enemyPosition);
					// trace(bulletPosition);

					bulletEntity.trash();
					enemyEntity.trash();
					parent.register(new Explosion(enemyPosition.v.x, enemyPosition.v.y));
				}
				/*if (position.v.y < -100) {
					remove(entity);
					entity.trash();
				}*/

				if (enemyEntity.isTrash()) {
					remove(enemyEntity);
				}
			}

			if (bulletEntity.isTrash()) {
				remove(bulletEntity);
			}
		}
	}

	public function toString() {
		return "KillEnemy";
	}
}
