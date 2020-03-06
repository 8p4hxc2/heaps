package systems;

import core.System;
import core.Vector2d;
import components.Velocity;
import components.Goal;
import components.Position;
import components.Transform;

class MoveSeek extends System {
	public function new() {
		this.blueprints.set("default", ["Position", "Transform", "Velocity", "Goal"]);
	}

	override function update(s2d:h2d.Scene) {
		for (entity in entities['default']) {
			var position:Position = cast entity.components.get("Position");
			var transform:Transform = cast entity.components.get("Transform");
			var velocity:Velocity = cast entity.components.get("Velocity");
			var goal:Goal = cast entity.components.get("Goal");

			var currentPosition:Vector2d = position.v;
			var currentVelocity:Vector2d = velocity.v;
			var currentGoal:Vector2d = goal.v;
			var mass:Float = 30;
			var maxVelocity:Float = 3;

			var desiredVelocity:Vector2d = currentGoal.substract(currentPosition).normalize().multiplyFloat(maxVelocity);
			var steering:Vector2d = desiredVelocity.substract(currentVelocity).divideFloat(mass);

			velocity.v = currentVelocity.add(steering);
			position.v = currentPosition.add(velocity.v);

			transform.angle = Math.atan2(position.v.y - currentPosition.y, position.v.x - currentPosition.x);
		}
	}
}
