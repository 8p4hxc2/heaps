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

class Pause extends State {
	public override function init(s2d:h2d.Scene, _paused:Bool) {
		super.init(s2d, _paused);
		/*systems.push(new MovePlayer(this));
			systems.push(new MoveBullet(this));
			systems.push(new MoveEnemy(this));
			systems.push(new KillEnemy(this));
			systems.push(new DrawText(this)); */
		systems.push(new DrawSprite(this));
		var player = new Player(130, 100);
		register(player);

		/*systems.push(new DrawAnimatedSprite(this));
			systems.push(new UpdateFps(this)); */
	}

	override function update() {
		super.update();

		if (hxd.Key.isPressed(hxd.Key.P)) {
			parent.removeState('pause');
		}
	}
}
