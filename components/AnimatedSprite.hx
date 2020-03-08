package components;

import h2d.Object;
import core.Component;

class AnimatedSprite extends Component {
	public var texture:String;
	public var instance:Object;

	public function new(_texture:String) {
		texture = _texture;
	}
}
