package components;

import core.Component;
import core.Vector2d;

class Transform extends Component {
	public var angle:Float;

	public function new(_angle:Float) {
		angle = _angle;
	}
}
