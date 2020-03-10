package entities;

import core.Const;
import core.Entity;
import components.Position;
import components.Sprite;
import components.Keyboard;

class Player extends Entity {
	public function new(?x:Float = 100, ?y:Float = 50) {
		id = Const.NEXT_UNIQ;
		components.set("Position", new Position(x, y));
    components.set("Sprite", new Sprite('Ship/3.png'));
    components.set("Keyboard", new Keyboard());
	}
}
