package entities;

import core.Const;
import core.Entity;
import components.Position;
import components.Transform;
import components.Velocity;
import components.Text;
import components.AnimatedSprite;
import components.Sprite;
import components.Wander;

class Enemy extends Entity {
	public function new(?x:Float = 100, ?y:Float = 50, ?angle:Float = 0) {
		id = Const.NEXT_UNIQ;
		components.set("Position", new Position(x, y));
		// components.set("Transform", new Transform(angle));
		// components.set("Velocity", new Velocity(0.1, 0));
		// components.set("Wander", new Wander(20));
		// components.set("Text", new Text('hello'));
		// components.set("Sprite", new Sprite('Ship/10.png'));
		components.set("AnimatedSprite", new Sprite('Fx/Fx7.png'));
	}
}
