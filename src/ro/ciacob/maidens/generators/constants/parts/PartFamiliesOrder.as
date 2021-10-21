package ro.ciacob.maidens.generators.constants.parts {

	public final class PartFamiliesOrder {

		public static const KEYBOARDS:int = 0;
		public static const BOWED_STRINGS:int = 100;
		public static const PLUCKED_STRINGS:int = 200;
		public static const WOODWINDS:int = 400;
		public static const BRASS:int = 600;
		public static const PITCHED_PERCUTION:int = 700;
		public static const UNPITCHED_PERCUTION:int = 800;
		public static const OTHER_INSTRUMENTS:int = 900;
		
		public static function getPartIndex(familyName : String, partName : String) : int {
			var genericIndex : int = (PartFamiliesOrder[familyName] as int);
			var specificIndex : int = 0;
			var familyMembers : Array = (PartFamilies[familyName] as Array);
			if (familyMembers != null) {
				specificIndex = familyMembers.indexOf(partName);
			}
			return (genericIndex + specificIndex);
		}
	}
}
