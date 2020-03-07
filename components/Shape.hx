package components;

import core.Component;

class Shape extends Component {
	public var width:Float;
	public var height:Float;

	public function new(_width:Int, _height:Int) {
		width = _width;
		height = _height;
	}
}
