package entities;

import core.Const;
import core.Entity;
import components.Position;
import components.Velocity;
import components.Text;

class Enemy extends Entity {
	public function new(?x:Int = 100, ?y:Int = 50) {
		id = Const.NEXT_UNIQ;
		components.set("Position", new Position(x, y));
		components.set("Velocity", new Velocity(0, 0));
		components.set("Text", new Text('hello'));
	}
}
