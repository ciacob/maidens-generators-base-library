package ro.ciacob.maidens.generators.constants {

	public final class BarTypes {
		public static const NORMAL_BAR:String = '◊';
		public static const DOUBLE_BAR:String = 'þ';
		public static const FINAL_BAR:String = 'ÿ';
		public static const AUTO_BAR:String = '≉';
		
		public static function getAllTypes():Array {
			return [
				AUTO_BAR,
				NORMAL_BAR,
				DOUBLE_BAR,
				FINAL_BAR
			];
		}
	}
}