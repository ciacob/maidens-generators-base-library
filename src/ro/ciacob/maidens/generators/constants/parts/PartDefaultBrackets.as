package ro.ciacob.maidens.generators.constants.parts {
	import ro.ciacob.maidens.generators.constants.BracketTypes;

	
	public final class PartDefaultBrackets {

		// [Keyboards
		public static const PIANO:String = BracketTypes.BRACE_FIRST_TWO;
		public static const HARPSICHORD:String = BracketTypes.BRACE_FIRST_TWO;
		public static const CELESTA:String = BracketTypes.BRACE_FIRST_TWO;
		public static const ORGAN:String = BracketTypes.BRACE_FIRST_TWO;
		
		// Solo bowed strings
		public static const VIOLIN:String = BracketTypes.NONE;
		public static const VIOLA:String = BracketTypes.NONE;
		public static const CELLO:String = BracketTypes.NONE;
		public static const CONTRABASS:String = BracketTypes.NONE;
		
		// Solo plucked strings
		public static const HARP:String = BracketTypes.BRACE_FIRST_TWO;
		public static const ACOUSTIC_GUITAR:String = BracketTypes.NONE;
		public static const ACOUSTIC_BASS_GUITAR:String = BracketTypes.NONE;
		
		// Solo reedless woodwinds
		public static const PICCOLO:String = BracketTypes.NONE;
		public static const FLUTE:String = BracketTypes.NONE;
		public static const RECORDER:String = BracketTypes.NONE;
		
		// Solo single-reed woodwinds
		public static const CLARINET:String = BracketTypes.NONE;
		
		// Solo double reed woodwinds
		public static const OBOE:String = BracketTypes.NONE;
		public static const ENGLISH_HORN:String = BracketTypes.NONE;
		public static const BASSOON:String = BracketTypes.NONE;
		
		// Solo brass
		public static const TRUMPET:String = BracketTypes.NONE;
		public static const TROMBONE:String = BracketTypes.NONE;
		public static const TUBA:String = BracketTypes.NONE;

		// Horns section
		public static const FRENCH_HORNS:String = BracketTypes.BRACKET_ALL;
		
		// Pitched percution
		public static const GLOCKENSPIEL:String = BracketTypes.NONE;
		public static const VIBRAPHONE:String = BracketTypes.NONE;
		public static const MARIMBA:String = BracketTypes.BRACE_FIRST_TWO;
		public static const XYLOPHONE:String = BracketTypes.NONE;
		public static const TUBULAR_BELLS:String = BracketTypes.NONE;
		
		// Other
		public static const CHOIR:String = BracketTypes.BRACKET_ALL;
	}
}