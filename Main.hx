import states.Game;

class Main extends hxd.App {
	var game:Game;

	override function init() {
		// load resources
		hxd.Res.initEmbed();

		// launch the game
		game = new Game();
	}

	override function update(dt:Float) {
		game.update(s2d);
	}

	static function main() {
		new Main();
	}
}
