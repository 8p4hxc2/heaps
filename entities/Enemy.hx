package entities;

import core.Const;
import core.Entity;
import components.Position;
import components.Sprite;
import components.Velocity;
import components.Attack;

class Enemy extends Entity {
	public function new(?x:Float = 100, ?y:Float = 50, ?vx:Float = 0, ?vy:Float = 1) {
		id = Const.NEXT_UNIQ;
		components.set("Position", new Position(x, y));
		components.set("Velocity", new Velocity(vx, vy));
		components.set("Sprite", new Sprite('Ship/10.png'));
		components.set("Attack", new Attack());
	}
}
