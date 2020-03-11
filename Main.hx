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
		game.init(s2d, false);

		pause = new Pause(this);
		pause.init(s2d, true);
	}

	override function update(dt:Float) {
		if (pause.canUpdate()) {
			pause.update();
		} else if (game.canUpdate()) {
			game.update();
		}
	}

	public function addState(name:String) {
		switch (name) {
			case "pause":
				game.pause();
				pause.unpause();
				pause.display();
		}
	}

	public function removeState(name:String) {
		switch (name) {
			case "pause":
				game.unpause();
				pause.pause();
				pause.hide();
		}
	}

	public function replaceState(name:String) {}

	static function main() {
		new Main();
	}
}
