package entities;

import core.Const;
import core.Entity;
import components.Position;
import components.AnimatedSprite;

class Explosion extends Entity {
	public function new(?x:Float = 100, ?y:Float = 50, ?angle:Float = 0) {
		id = Const.NEXT_UNIQ;
		components.set("Position", new Position(x, y));
		components.set("AnimatedSprite", new AnimatedSprite('Fx/Fx7.png', 8));
	}
}
