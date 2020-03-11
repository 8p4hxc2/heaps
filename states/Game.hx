package states;

import systems.KillEnemy;
import components.Damage;
import core.State;
import systems.DrawText;
import systems.DrawSprite;
import systems.DrawAnimatedSprite;
import systems.MovePlayer;
import systems.MoveBullet;
import systems.MoveEnemy;
import systems.KillEnemy;
// import systems.UpdateMouse;
import systems.MoveSeek;
import systems.MoveWander;
import systems.Targeting;
import systems.TargetMouse;
import systems.UpdateFps;
import entities.Enemy;
import entities.Fps;
import entities.Player;
import components.Goal;
import components.Target;
import components.Mouse;
import components.TakeDamage;
import components.Wander;

class Game extends State {
	public override function init(s2d:h2d.Scene, _paused:Bool) {
		super.init(s2d, _paused);
		// systems.push(new UpdateMouse());
		// systems.push(new TargetMouse());
		// systems.push(new Targeting());
		// systems.push(new MoveSeek());
		// systems.push(new MoveWander());
		systems.push(new MovePlayer(this));
		systems.push(new MoveBullet(this));
		systems.push(new MoveEnemy(this));
		systems.push(new KillEnemy(this));
		systems.push(new DrawText(this));
		systems.push(new DrawSprite(this));
		systems.push(new DrawAnimatedSprite(this));
		systems.push(new UpdateFps(this));

		// UI
		var u1 = new Fps(1300, 100);

		// GAME
		// var e1 = new Enemy(33, 44);

		var player = new Player(130, 100);

		/*for (i in 0...3000) {
			addEnemy();
		}*/
		/*var e2 = new Enemy(800, 445);
				var e3 = new Enemy(400, 245);

				e1.components.set("Goal", new Goal(0, 900));
				e1.components.set("Mouse", new Mouse(0, 0));
				e1.components.set("Target", new Target());

				e3.components.set("Goal", new Goal(600, 600));
				e3.components.set("Attack", new Attack());

				e2.components.set("Wander", new Wander(2));
			e2.components.set("Angle", new Angle(20)); */

		register(u1);
		register(player);

		/*register(e2);
			register(e3); */
	}

	public function addEnemy() {
		var e = new Enemy(Std.random(1000), Std.random(1000) * -1, 0, Std.random(4) + 1);
		// e.components.set("Goal", new Goal(0, 900));
		// e.components.set("Mouse", new Mouse());
		// e.components.set("Target", new Target());
		register(e);
	}

	function logEntityNumber() {
		trace('-------------------------------');
		for (system in systems) {
			var entityCount = system.getEntityCount();
			trace('$system : $entityCount entities');
		}
	}

	override function update() {
		super.update();

		if (hxd.Key.isPressed(hxd.Key.SPACE)) {
			for (i in 0...1000) {
				addEnemy();
			}
		}

		if (hxd.Key.isPressed(hxd.Key.I)) {
			logEntityNumber();
		}

		if (hxd.Key.isPressed(hxd.Key.P)) {
			parent.addState("pause");
		}
	}
}
