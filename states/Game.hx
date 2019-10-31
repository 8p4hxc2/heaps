package states;

import core.State;
import systems.DrawText;
import systems.MoveSeek;
import systems.Targeting;
import entities.Enemy;
import components.Goal;
import components.Target;
import components.Attack;

class Game extends State {
	public function new() {
		systems.push(new Targeting());
		systems.push(new MoveSeek());
		systems.push(new DrawText());

		var e1 = new Enemy(33, 44);
		var e2 = new Enemy(800, 445);

		e1.components.set("Goal", new Goal(0, 900));
		e1.components.set("Target", new Target());

		e2.components.set("Goal", new Goal(600, 600));
		e2.components.set("Attack", new Attack());

		register(e1);
		register(e2);
	}
}
