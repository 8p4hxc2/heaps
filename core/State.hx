package core;

class State {
	var systems:Array<System> = [];
	var paused:Bool = false;
	var screenBuffer:h2d.Object;
  var parent:Main;

  public function new(_parent:Main) {
		parent = _parent;
  }
  
	public function init(s2d:h2d.Scene, ?paused:Bool=false) {
		screenBuffer = new h2d.Object(s2d);
	}

	public function register(entity:Entity) {
		for (s in systems) {
			s.register(entity);
		}
	}

	public function update() {
		if (!paused) {
			for (s in systems) {
				s.update(screenBuffer);
			}
		} else {
			screenBuffer.alpha = 0.5;
		}
	}

	public function pause() {
		paused = !paused;
  }
  
  public function canUpdate() {
    return !paused;
  }

	public function display() {
		screenBuffer.visible = true;
	}

	public function hide() {
		screenBuffer.visible = false;
	}
}
