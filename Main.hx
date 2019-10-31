import states.Game;

// constants


// Utils

// components


// systems


/*class MoveWander extends System {
	public function new() {
		this.blueprints.set("default", ["Position", "Velocity"]);
	}

	override function update(s2d:h2d.Scene) {
		for (entity in entities['default']) {
			var position:Position = cast entity.components.get("Position");
			var velocity:Velocity = cast entity.components.get("Velocity");
			var goal:Goal = cast entity.components.get("Goal");

			var currentPosition:Vector2d = position.v;
			var currentVelocity:Vector2d = velocity.v;
			var currentGoal:Vector2d = goal.v;
			var mass:Float = 30;
			var maxVelocity:Float = 12;

			var desiredVelocity:Vector2d = currentGoal.substract(currentPosition).normalize().multiplyFloat(maxVelocity);
			var steering:Vector2d = desiredVelocity.substract(currentVelocity).divideFloat(mass);

			velocity.v = currentVelocity.add(steering);
			position.v = currentPosition.add(velocity.v);
		}
	}
}*/





// States



class Main extends hxd.App {
	var test:Game;

	override function init() {
		/*var position:Vector2d = new Vector2d(33, 11);
			var target:Vector2d = new Vector2d(33, 30);
			var velocity:Vector2d = new Vector2d(0, 0);
			var mass:Float = 30;
			var maxVelocity:Float = 12;

			var desiredVelocity:Vector2d = target.substract(position).normalize().multiplyFloat(maxVelocity);
			var steering:Vector2d = desiredVelocity.substract(velocity).divideFloat(mass);

			velocity = velocity.add(steering);
			trace(velocity);
			trace(position.add(velocity)); */
		/*s1 = new DrawText();

			s2 = new MoveSeek();

			s3 = new Targeting();

			var e1 = new Enemy(33, 44);
			var e2 = new Enemy(800, 445);

			e1.components.set("Goal", new Goal(0, 900));
			// e1.components.set("Attack", new Attack());
			e1.components.set("Target", new Target());

			e2.components.set("Goal", new Goal(600, 600));
			e2.components.set("Attack", new Attack());
			// e2.components.set("Target", new Target());

			s1.register(e1);
			s2.register(e1);
			s3.register(e1);

			s1.register(e2);
			s2.register(e2);
			s3.register(e2); */

		test = new Game();
	}

	override function update(dt:Float) {
		test.update(s2d);
	}

	static function main() {
		new Main();
	}
}
