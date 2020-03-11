package core;

class State {
	var systems:Array<System> = [];
	var paused:Bool = false;

	public var screenBuffer:h2d.Object;

	var parent:Main;

	public function new(_parent:Main) {
		parent = _parent;
	}

	public function init(s2d:h2d.Scene, _paused:Bool) {
		screenBuffer = new h2d.Object(s2d);
		paused = _paused;

		if (paused) {
			hide();
		}
	}

	public function register(entity:Entity) {
		for (s in systems) {
			s.register(entity);
		}
	}

	public function update() {
		for (s in systems) {
			s.update(screenBuffer);
		}
	}

	public function pause() {
		paused = true;
		screenBuffer.alpha = 0.5;
	}

	public function unpause() {
		paused = false;
		screenBuffer.alpha = 1;
	}

	public function canUpdate() {
		return !paused;
	}

	public function display() {
		screenBuffer.visible = true;
	}

	public function hide() {
		trace('hide');
		screenBuffer.visible = false;
	}
}
