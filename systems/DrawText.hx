// draw text at a position on the screen
package systems;

import core.System;
import core.State;
import components.Text;
import components.Position;
import components.Transform;

class DrawText extends System {
	public var instances:Map<Int, h2d.Text> = new Map();

	public function new(_parent:State) {
		super(_parent);
		this.blueprints.set("default", ["Text", "Position", "~Transform"]);
	}

	override function update(s2d:h2d.Object) {
		for (entity in entities['default']) {
			var text:Text = cast entity.components.get("Text");
			var position:Position = cast entity.components.get("Position");
			var transform:Transform = cast entity.components.get("Transform");

			if (!instances.exists(entity.id)) {
				instances[entity.id] = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
			}

			instances[entity.id].text = text.value;
			instances[entity.id].x = position.v.x;
			instances[entity.id].y = position.v.y;

			if (transform != null) {
				instances[entity.id].rotation = transform.angle;
			}
		}
	}

	public function toString() {
		return "DrawText";
	}
}
