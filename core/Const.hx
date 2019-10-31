package core;

class Const {
	public static var FPS = 60;
	static var _uniq = 0;
	public static var NEXT_UNIQ(get, never):Int;

	static inline function get_NEXT_UNIQ()
		return _uniq++;
}
