package components;

import core.Component;
import core.Vector2d;

class Position extends Component {
	public var v:Vector2d;

	public function new(_x:Float, _y:Float) {
		v = new Vector2d(_x, _y);
	}
}
