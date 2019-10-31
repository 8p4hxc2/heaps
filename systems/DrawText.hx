package systems;

import core.System;
import components.Text;
import components.Position;

class DrawText extends System {
	public var instances:Map<Int, h2d.Text> = new Map();

	public function new() {
		this.blueprints.set("default", ["Text", "Position"]);
	}

	override function update(s2d:h2d.Scene) {
		for (entity in entities['default']) {
			var text:Text = cast(entity.components.get("Text"), Text);
			var position:Position = cast(entity.components.get("Position"), Position);

			if (instances.get(entity.id) == null) {
				instances.set(entity.id, new h2d.Text(hxd.res.DefaultFont.get(), s2d));
			}

			instances.get(entity.id).text = text.value;
			instances.get(entity.id).x = position.x;
			instances.get(entity.id).y = position.y;
		}
	}
}
