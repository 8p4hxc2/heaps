package core;

class Entity {
	public var components:Map<String, Component> = new Map();
	public var id:Int;
	public var delete:Bool = false;

	public function hasComponent(name:String) {
		return components.exists(name);
	}

	public function trash() {
		delete = true;
	}

	public function isTrash() {
		return delete;
	}
}
