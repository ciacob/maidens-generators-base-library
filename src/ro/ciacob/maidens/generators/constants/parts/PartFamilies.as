package ro.ciacob.maidens.generators.constants.parts {
	import ro.ciacob.ciacob;
	import ro.ciacob.utils.ConstantUtils;
	import ro.ciacob.utils.Strings;

	public final class PartFamilies {

		public static const BOWED_STRINGS : Array = [
			PartNames.VIOLIN,
			PartNames.VIOLA,
			PartNames.CELLO,
			PartNames.CONTRABASS
		];

		public static const PLUCKED_STRINGS : Array = [
			PartNames.HARP,
			PartNames.ACOUSTIC_GUITAR,
			PartNames.ACOUSTIC_BASS_GUITAR
		];

		public static const BRASS:Array = [
			PartNames.TRUMPET,
			PartNames.TROMBONE,
			PartNames.FRENCH_HORNS,
			PartNames.TUBA
		];

		public static const WOODWINDS : Array = [
			PartNames.PICCOLO,
			PartNames.FLUTE,
			PartNames.RECORDER,
			PartNames.OBOE,
			PartNames.ENGLISH_HORN,
			PartNames.CLARINET,
			PartNames.BASSOON
		];

		public static const KEYBOARDS : Array = [
			PartNames.PIANO,
			PartNames.HARPSICHORD,
			PartNames.CELESTA,
			PartNames.ORGAN
		];

		public static const PITCHED_PERCUTION : Array = [
			PartNames.GLOCKENSPIEL,
			PartNames.VIBRAPHONE,
			PartNames.MARIMBA,
			PartNames.XYLOPHONE,
			PartNames.TUBULAR_BELLS
		];

		ciacob static const OTHER_INSTRUMENTS : String = 'OTHER_INSTRUMENTS';

		private static var _allFamilies : Array;
		private static var _partToFamilyMap : Object = {};

		/**
		 * Returns an Array with all part families defined in this class.
		 */
		public static function getAllFamilies() : Array {
			if (_allFamilies == null) {
				_allFamilies = ConstantUtils.getAllNames(PartFamilies);
			}
			return _allFamilies;
		}

		/**
		 * Returns the name of the family whose the given instrument (part) belongs to.
		 * @param	partName
		 * 			The part to look up the family of.
		 *
		 * @return 	The family name, or OTHER_INSTRUMENTS if the instrument cannot be
		 * 			matched to any known family.
		 */
		public static function getPartFamily (partName:String):String {
			if (!(partName in _partToFamilyMap)) {
				var haveMatch : Boolean = false;
				var friendlyPartName : String = Strings.fromAS3ConstantCase (partName);
				friendlyPartName = Strings.capitalize (friendlyPartName);
				var allFamilies : Array = getAllFamilies();
				for (var i:int = 0; i < allFamilies.length; i++) {
					var familyName : String = (allFamilies[i] as String);
					var familyMembers : Array = (PartFamilies[familyName] as Array);
					if (familyMembers && familyMembers.indexOf(friendlyPartName) != -1) {
						_partToFamilyMap [partName] = familyName;
						haveMatch = true;
						break;
					}
				}
				if (!haveMatch) {
					_partToFamilyMap[partName] = ciacob::OTHER_INSTRUMENTS;
				}
			}
			return (_partToFamilyMap[partName] as String);
		}

		/**
		 * Returns `true` if given `partNames` are all members of the same family, or `false` otherwise.
		 * NOTE:
		 * Also returns `false` if any of the given part names is null or unrecognized.
		 */
		public static function haveSameFamily (partNames : Array) : Boolean {
			if (partNames && partNames.length) {
				var prevFamily:String = null;
				for (var i : int = 0; i < partNames.length; i++) {
					var partName : String = (partNames[i] as String);
					if (!partName) {
						return false;
					}
					var currFamily : String = getPartFamily (partName);
					if (currFamily == ciacob::OTHER_INSTRUMENTS) {
						return false;
					}
					if (prevFamily !== null && currFamily != prevFamily) {
						return false;
					}
					prevFamily = currFamily;
				}
				return true;
			}
			return false;
		}
	}
}
