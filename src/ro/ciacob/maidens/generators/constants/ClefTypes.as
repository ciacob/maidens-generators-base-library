package ro.ciacob.maidens.generators.constants {
	import flash.utils.describeType;

	public final class ClefTypes {
		
		public static const BASS:String = '±';
		public static const TREBLE:String = 'Ø';
		public static const TENOR:String = '¥';
		public static const TENOR_MODERN:String = '≤';
		public static const CONTRABASS:String = '≥';
		public static const ALTO:String = '∞';

		public static function getAllTypes():Array {
			var list:Array = [];
			var info:XML = describeType(ClefTypes);
			for each (var node:XML in info..constant) {
				var typeName:String = ('' + node.@name);
				list.push(ClefTypes[typeName]);
			}
			return list.sort();
		}
	}
}
