package components;

import core.Component;
import core.Vector2d;

class Goal extends Component {
	public var v:Vector2d;

	public function new(x:Float, y:Float) {
		v = new Vector2d(x, y);
	}

	public var x(get, set):Float;
	public var y(get, set):Float;

	private function get_x():Float {
		return this.v.x;
	}

	private function set_x(value:Float):Float {
		this.v.x = value;
		return value;
	}

	private function get_y():Float {
		return this.v.y;
	}

	private function set_y(value:Float):Float {
		this.v.y = value;
		return value;
	}
}