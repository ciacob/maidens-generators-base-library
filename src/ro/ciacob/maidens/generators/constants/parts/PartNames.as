package ro.ciacob.maidens.generators.constants.parts {
	import ro.ciacob.utils.ConstantUtils;

	public final class PartNames {

		// Keyboards
		public static const PIANO:String = 'Piano';
		public static const HARPSICHORD:String = 'Harpsichord';
		public static const CELESTA:String = 'Celesta';
		public static const ORGAN:String = 'Organ';

		// Bowed strings
		public static const VIOLIN:String = 'Violin';
		public static const VIOLA:String = 'Viola';
		public static const CELLO:String = 'Cello';
		public static const CONTRABASS:String = 'Contrabass';

		// Plucked strings
		public static const HARP:String = 'Harp';
		public static const ACOUSTIC_GUITAR:String = 'Acoustic guitar';
		public static const ACOUSTIC_BASS_GUITAR:String = 'Acoustic bass guitar';

		public static const PICCOLO:String = 'Piccolo';
		public static const FLUTE:String = 'Flute';
		public static const RECORDER:String = 'Recorder';

		// Single-reed woodwinds
		public static const CLARINET:String = 'Clarinet';

		// Double reed woodwinds
		public static const OBOE:String = 'Oboe';
		public static const ENGLISH_HORN:String = 'English horn';
		public static const BASSOON:String = 'Bassoon';

		// Brass
		public static const TRUMPET:String = 'Trumpet';
		public static const TROMBONE:String = 'Trombone';
		public static const TUBA:String = 'Tuba';

		// Horns section
		public static const FRENCH_HORNS:String = 'French horns';

		// Pitched percution
		public static const GLOCKENSPIEL:String = 'Glockenspiel';
		public static const VIBRAPHONE:String = 'Vibraphone';
		public static const MARIMBA:String = 'Marimba';
		public static const XYLOPHONE:String = 'Xylophone';
		public static const TUBULAR_BELLS:String = 'Tubular bells';

		// Other
		public static const CHOIR:String = 'Choir';

		public static function getAllPartNames():Array {
			var list:Array = ConstantUtils.getAllValues(PartNames);
			return list.sort(comparePartsByFamilies);
		}

		public static function comparePartsByFamilies (partA : String, partB : String) : int {
			var familyNameA : String = PartFamilies.getPartFamily (partA);
			var familyNameB : String = PartFamilies.getPartFamily (partB);
			var familyIndexA : int = PartFamiliesOrder.getPartIndex (familyNameA, partA);
			var familyIndexB : int = PartFamiliesOrder.getPartIndex (familyNameB, partB);
			return (familyIndexA - familyIndexB)
		}
	}
}
