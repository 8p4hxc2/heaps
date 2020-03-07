package components;

import core.Component;

class Text extends Component {
	public var value:String;
	public var instance:h2d.Text;
  
	public function new(_value:String) {
		value = _value;
	}
}
