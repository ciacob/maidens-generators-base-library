package ro.ciacob.maidens.generators.constants.parts {
	
	/**
	 * Informative table denoting how many pitches can a given instrument simultaneously sound.
	 * This table takes into consideration whether the instrument has a sort of "sustain pedal"
	 * or not. For a number of instruments this is debatable, so we assumed a number and stuck
	 * with it.
	 */
	public final class PartMaxPoliphony {
		public function PartMaxPoliphony() {}
		
		// Keyboards
		public static const PIANO : uint = 88;
		public static const HARPSICHORD : uint = 10;
		public static const CELESTA : uint = 10;
		public static const ORGAN : uint = 12;
		
		// Bowed strings
		public static const VIOLIN : uint = 2;
		public static const VIOLA : uint = 2;
		public static const CELLO : uint = 2;
		public static const CONTRABASS : uint = 2;
		
		// Plucked strings
		public static const HARP : uint = 47;
		public static const ACOUSTIC_GUITAR : uint = 6;
		public static const ACOUSTIC_BASS_GUITAR : uint = 4;
		
		public static const PICCOLO : uint = 1;
		public static const FLUTE : uint = 1;
		public static const RECORDER : uint = 1;
		
		// Single-reed woodwinds
		public static const CLARINET : uint = 1;
		
		// Double reed woodwinds
		public static const OBOE : uint = 1;
		public static const ENGLISH_HORN : uint = 1;
		public static const BASSOON : uint = 1;
		
		// Brass
		public static const TRUMPET : uint = 1;
		public static const TROMBONE : uint = 1;
		public static const TUBA : uint = 1;
		public static const FRENCH_HORNS : uint = 3;
		
		// Pitched percution
		public static const GLOCKENSPIEL : uint = 4;
		public static const VIBRAPHONE : uint = 36;
		public static const MARIMBA : uint = 6;
		public static const XYLOPHONE : uint = 4;
		public static const TUBULAR_BELLS : uint = 2;
		
		// Other
		public static const CHOIR : uint = 8;
	}
}