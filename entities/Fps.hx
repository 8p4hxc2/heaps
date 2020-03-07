package entities;

import core.Const;
import core.Entity;
import components.Position;
import components.Text;
import components.Fps;

class Fps extends Entity {
	public function new(?x:Float = 100, ?y:Float = 50, ?value:String = '') {
		id = Const.NEXT_UNIQ;
		components.set("Position", new Position(x, y));
		components.set("Text", new Text(value));
		components.set("Fps", new CFps());
	}
}
