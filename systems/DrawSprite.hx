// draw sprite at a position on the screen
package systems;

import h2d.Bitmap;
import h2d.Anim;
import core.System;
import components.Sprite;
import components.Position;
import components.Transform;

class DrawSprite extends System {
	public var instances:Map<Int, Bitmap> = new Map();

	public function new() {
		this.blueprints.set("default", ["Sprite", "Position", "~Transform"]);
	}

	override function update(s2d:h2d.Scene) {
		for (entity in entities['default']) {
			var sprite:Sprite = cast entity.components.get("Sprite");
			var position:Position = cast entity.components.get("Position");
			var transform:Transform = cast entity.components.get("Transform");

			if (!instances.exists(entity.id)) {
				var tileImage = hxd.Res.load(sprite.texture).toTile();
				instances[entity.id] = new Bitmap(tileImage, s2d);
			}

			instances[entity.id].x = position.v.x;
			instances[entity.id].y = position.v.y;

			if (transform != null) {
				instances[entity.id].rotation = transform.angle;
			}
		}
	}

	public function toString() {
		return "DrawSprite";
	}
}
