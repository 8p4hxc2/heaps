import states.Game;
import states.Pause;

class Main extends hxd.App {
	var game:Game;
	var pause:Pause;

	override function init() {
		// load resources
		hxd.Res.initEmbed();

		// launch the game
		game = new Game(this);
		game.init(s2d);

		pause = new Pause(this);
		pause.init(s2d);
	}

	override function update(dt:Float) {
		if (pause.canUpdate()) {
			pause.update();
		}

		if (game.canUpdate()) {
			game.update();
		}
	}

	public function activate(name:String) {
		switch (name) {
			case "pause":
				trace('pause?');
				pause.display();

			case "game":
				game.display();
		}
	}

	public function removeState(name:String) {
		switch (name) {
			case "pause":
				pause.hide();
		}
	}

	static function main() {
		new Main();
	}
}
