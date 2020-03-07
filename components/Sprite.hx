package components;

import core.Component;

class Text extends Component {
	public var texture:String;
	public var instance:h2d.Sprite;
  
	public function new(_texture:String) {
		texture = _texture;
	}
}
