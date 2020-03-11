// draw an animated sprite at a position on the screen
package systems;

import h2d.Anim;
import core.System;
import core.State;
import core.Entity;
import components.AnimatedSprite;
import components.Position;
import components.Transform;

class DrawAnimatedSprite extends System {
	public var instances:Map<Int, h2d.Anim> = new Map();

	public function new(_parent:State) {
		super(_parent);
		this.blueprints.set("default", ["AnimatedSprite", "Position", "~Transform"]);
	}

	override function update(s2d:h2d.Object) {
		for (entity in entities['default']) {
			var animatedSprite:AnimatedSprite = cast entity.components.get("AnimatedSprite");
			var position:Position = cast entity.components.get("Position");
			var transform:Transform = cast entity.components.get("Transform");

			if (!instances.exists(entity.id)) {
				var tileImage = hxd.Res.load(animatedSprite.texture).toTile();
				instances[entity.id] = new h2d.Anim(tileImage.split(animatedSprite.frames), 8, s2d);
				instances[entity.id].loop = false;
				instances[entity.id].onAnimEnd = function() {
					entity.trash();
				};
			}

			instances[entity.id].x = position.v.x;
			instances[entity.id].y = position.v.y;

			if (transform != null) {
				instances[entity.id].rotation = transform.angle;
			}

			clean(entity);
		}
	}

	function clean(entity:Entity) {
		if (entity.isTrash()) {
			instances[entity.id].remove();
			instances.remove(entity.id);
			remove(entity);
		}
	}

	public function toString() {
		return "DrawAnimatedSprite";
	}
}
