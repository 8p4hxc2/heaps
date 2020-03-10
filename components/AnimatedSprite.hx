package components;

import h2d.Object;
import core.Component;

class AnimatedSprite extends Component {
	public var texture:String;
	public var frames:Int;

	public function new(_texture:String, _frames:Int) {
		texture = _texture;
		frames = _frames;
	}
}
