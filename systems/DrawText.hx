package systems;

import core.System;
import components.Text;
import components.Position;
import components.Transform;

class DrawText extends System {
	public var instances:Map<Int, h2d.Text> = new Map();

	public function new() {
		this.blueprints.set("default", ["Text", "Position", "~Transform"]);
	}

	override function update(s2d:h2d.Scene) {
		for (entity in entities['default']) {
			var text:Text = cast entity.components.get("Text");
			var position:Position = cast entity.components.get("Position");
			var transform:Transform = cast entity.components.get("Transform");

			if (text.instance == null) {
				text.instance = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
			}

			text.instance.text = text.value;
			text.instance.x = position.v.x;
			text.instance.y = position.v.y;

			if (transform != null) {
				text.instance.rotation = transform.angle;
			}
		}
	}
}
