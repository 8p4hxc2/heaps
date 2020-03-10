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

class MovePlayer extends System {
	public function new(_parent:State) {
		super(_parent);
		this.blueprints.set("default", ["Keyboard", "Position"]);
	}

	override function update(s2d:h2d.Scene) {
		for (entity in entities['default']) {
			var position:Position = cast entity.components.get("Position");

			if (hxd.Key.isDown(hxd.Key.RIGHT)) {
				position.v.x += 10;
			}

			if (hxd.Key.isDown(hxd.Key.LEFT)) {
				position.v.x -= 10;
			}

			if (hxd.Key.isDown(hxd.Key.UP)) {
				position.v.y -= 10;
			}

			if (hxd.Key.isDown(hxd.Key.DOWN)) {
				position.v.y += 10;
			}

			if (hxd.Key.isPressed(hxd.Key.U)) {
				var e = new Bullet(position.v.x, position.v.y);
				// e.components.set("Goal", new Goal(0, 900));
				// e.components.set("Mouse", new Mouse());
				// e.components.set("Target", new Target());
				parent.register(e);
			}
		}
	}

	public function toString() {
		return "MovePlayer";
	}
}
