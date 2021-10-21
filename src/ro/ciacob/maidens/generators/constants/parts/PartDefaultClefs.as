package ro.ciacob.maidens.generators.constants.parts {
	import ro.ciacob.maidens.generators.constants.ClefTypes;
	import ro.ciacob.maidens.generators.constants.Common;
	
	public final class PartDefaultClefs {

		// [Keyboards
		public static const PIANO:Array = [ClefTypes.TREBLE, ClefTypes.BASS];
		public static const HARPSICHORD:Array = [ClefTypes.TREBLE, ClefTypes.BASS];
		public static const CELESTA:Array = [ClefTypes.TREBLE, ClefTypes.BASS];
		public static const ORGAN:Array = [ClefTypes.TREBLE, ClefTypes.BASS, ClefTypes.BASS];
		
		// Solo bowed strings
		public static const VIOLIN:Array = [ClefTypes.TREBLE];
		public static const VIOLA:Array = [ClefTypes.ALTO];
		public static const CELLO:Array = [ClefTypes.BASS];
		public static const CONTRABASS:Array = [ClefTypes.CONTRABASS];
		
		// Solo plucked strings
		public static const HARP:Array = [ClefTypes.TREBLE, ClefTypes.BASS];
		public static const ACOUSTIC_GUITAR:Array = [ClefTypes.TENOR_MODERN];
		public static const ACOUSTIC_BASS_GUITAR:Array = [ClefTypes.BASS];
		
		// Solo reedless woodwinds
		public static const PICCOLO:Array = [ClefTypes.TREBLE];
		public static const FLUTE:Array = [ClefTypes.TREBLE];
		public static const RECORDER:Array = [ClefTypes.TREBLE];
		
		// Solo single-reed woodwinds
		public static const CLARINET:Array = [ClefTypes.TREBLE];
		
		// Solo double reed woodwinds
		public static const OBOE:Array = [ClefTypes.TREBLE];
		public static const ENGLISH_HORN:Array = [ClefTypes.TREBLE];
		public static const BASSOON:Array = [ClefTypes.BASS];
		
		// Solo brass
		public static const TRUMPET:Array = [ClefTypes.TREBLE];
		public static const TROMBONE:Array = [ClefTypes.BASS];
		public static const TUBA:Array = [ClefTypes.BASS];

		// Horns section
		public static const FRENCH_HORNS:Array = [ClefTypes.TREBLE, ClefTypes.BASS];
		
		// Pitched percution
		public static const GLOCKENSPIEL:Array = [ClefTypes.TREBLE];
		public static const VIBRAPHONE:Array = [ClefTypes.TREBLE];
		public static const MARIMBA:Array = [ClefTypes.TREBLE];
		public static const XYLOPHONE:Array = [ClefTypes.TREBLE];
		public static const TUBULAR_BELLS:Array = [ClefTypes.TREBLE];
		
		// Other
		public static const CHOIR:Array = [ClefTypes.TREBLE, ClefTypes.TREBLE, ClefTypes.TENOR_MODERN, ClefTypes.BASS];
	}
}