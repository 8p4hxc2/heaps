package core;

class Vector2d {
	public var x:Float;
	public var y:Float;

	public function new(_x:Float = 0.0, _y:Float = 0.0) {
		x = _x;
		y = _y;
	}

	public function clone():Vector2d {
		return new Vector2d(this.x, this.y);
	}

	public var length(get, set):Float;

	private function get_length():Float {
		return this.x * this.x + this.y * this.y;
	}

	private function set_length(value:Float):Float {
		var length = get_length();
		if (length == 0)
			return 0;
		var l = value / length;
		this.x *= l;
		this.y *= l;
		return value;
	}

	public var magnitude(get, set):Float;

	private inline function get_magnitude():Float {
		return Math.sqrt(length);
	}

	private function set_magnitude(magnitude:Float):Float {
		polar(magnitude, angle());
		return magnitude;
	}

	public function polar(magnitude:Float, angle:Float) {
		this.x = magnitude * Math.cos(angle);
		this.y = magnitude * Math.sin(angle);
	}

	public function angle():Float {
		return Math.atan2(this.y, this.x);
	}

	public function normalize():Vector2d {
		var clone = clone();
		clone.x /= magnitude;
		clone.y /= magnitude;
		return clone;
	}

	public function add(by:Vector2d):Vector2d {
		var clone = clone();
		clone.x += by.x;
		clone.y += by.y;
		return clone;
	}

	public function substract(by:Vector2d):Vector2d {
		var clone = clone();
		clone.x -= by.x;
		clone.y -= by.y;
		return clone;
	}

	public function multiply(by:Vector2d):Vector2d {
		var clone = clone();
		clone.x *= by.x;
		clone.y *= by.y;
		return clone;
	}

	public function multiplyFloat(v:Float):Vector2d {
		var clone = clone();
		clone.x *= v;
		clone.y *= v;
		return clone;
	}

	public function divide(by:Vector2d):Vector2d {
		var clone = clone();
		clone.x /= by.x;
		clone.y /= by.y;
		return clone;
	}

	public function divideFloat(v:Float):Vector2d {
		var clone = clone();
		clone.x /= v;
		clone.y /= v;
		return clone;
	}
}