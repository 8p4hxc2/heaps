package systems;

import core.System;
import core.Vector2d;
import components.Position;
import components.Transform;
import components.Velocity;
import components.Wander;

class MoveWander extends System {
	public function new() {
		this.blueprints.set("default", ["Position", "Transform", "Velocity", "Wander"]);
	}

	override function update(s2d:h2d.Scene) {
		for (entity in entities['default']) {
			var position:Position = cast entity.components.get("Position");
			var velocity:Velocity = cast entity.components.get("Velocity");
			var transform:Transform = cast entity.components.get("Transform");
			var wander:Wander = cast entity.components.get("Wander");

			var currentPosition:Vector2d = position.v;
			var currentVelocity:Vector2d = velocity.v;
			var wanderAngle:Float = wander.angle;
			var mass:Float = 60;
			var maxVelocity:Float = 1;

			// Calculate the circle center
			var circleCenter:Vector2d = currentVelocity.clone().normalize().multiplyFloat(10);

			var displacement:Vector2d = new Vector2d(0, -1).multiplyFloat(5);
			var len:Float = displacement.length;
			displacement.x = Math.cos(wanderAngle) * len;
			displacement.y = Math.sin(wanderAngle) * len;

			wander.angle += (Math.random() * 1) - (1 * .5);

			var wanderForce:Vector2d = circleCenter.add(displacement).divideFloat(mass);

			velocity.v = currentVelocity.add(wanderForce).truncate(maxVelocity);
			position.v = currentPosition.add(velocity.v);

			transform.angle = Math.atan2(position.v.y - currentPosition.y, position.v.x - currentPosition.x);
		}
	}
}
