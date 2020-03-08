package components;

import core.Component;

class Sprite extends Component {
	public var texture:String;

	public function new(_texture:String) {
		texture = _texture;
	}
}
