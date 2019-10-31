package core;

class Entity {
	public var components:Map<String, Component> = new Map();
	public var id:Int;

	public function hasComponent(name:String) {
		return components.exists(name);
	}
}