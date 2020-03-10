package systems;

import core.System;
import core.State;
import components.Text;
import hxd.Timer;

class UpdateFps extends System {
	public function new(_parent:State) {
		super(_parent);
		this.blueprints.set("default", ["Text", "Fps"]);
	}

	override function update(s2d:h2d.Scene) {
		for (entity in entities['default']) {
			var text:Text = cast entity.components.get("Text");

			text.value = Std.string(Timer.fps());
		}
	}

	public function toString() {
		return "UpdateFps";
	}
}
