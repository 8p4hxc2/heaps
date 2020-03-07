package states;

import core.State;
import systems.DrawText;
import systems.UpdateMouse;
import systems.MoveSeek;
import systems.MoveWander;
import systems.Targeting;
import systems.TargetMouse;
import systems.UpdateFps;
import entities.Enemy;
import entities.Fps;
import components.Goal;
import components.Target;
import components.Mouse;
import components.Attack;
import components.Wander;

class Game extends State {
	public function new() {
		//systems.push(new UpdateMouse());
		//systems.push(new TargetMouse());
		//systems.push(new Targeting());
		//systems.push(new MoveSeek());
		systems.push(new MoveWander());
    systems.push(new DrawText());
    systems.push(new UpdateFps());

    // UI
    var u1 = new Fps(1300, 100);

    // GAME
    // var e1 = new Enemy(33, 44);
    
    for(i in 0...1000) {
      register(new Enemy(Std.random(1000), Std.random(1000)));
    }
		/*var e2 = new Enemy(800, 445);
		var e3 = new Enemy(400, 245);

		e1.components.set("Goal", new Goal(0, 900));
		e1.components.set("Mouse", new Mouse(0, 0));
		e1.components.set("Target", new Target());

		e3.components.set("Goal", new Goal(600, 600));
		e3.components.set("Attack", new Attack());

		e2.components.set("Wander", new Wander(2));
    e2.components.set("Angle", new Angle(20));*/

    
    register(u1);
		/*register(e2);
		register(e3);*/
	}
}
