import states.Game;

class Main extends hxd.App {
	var game:Game;

	override function init() {
		game = new Game();
	}

	override function update(dt:Float) {
		game.update(s2d);
	}

	static function main() {
		new Main();
	}
}
