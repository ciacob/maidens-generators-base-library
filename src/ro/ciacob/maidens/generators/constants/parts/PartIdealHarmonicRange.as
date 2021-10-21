package ro.ciacob.maidens.generators.constants.parts {
	
	/**
	 * Informative table denoting the MIDI (thus, "sounding", or "concert pitch") range
	 * this instrument is most proficient in, when playing simultaneous pitches. 
	 * This is usually a (portion) of the instrument's "middle range", because in this
	 * area its timbre has the right ballance of partials: not too many (which would
	 * clutter the chord beyond recongnition) but not to few either (which would strip
	 * any "harmonic resonance" from the chord).
	 * 
	 * This is highly debatable regardless of the instrument so we assumed some ranges
	 * and stuck with them.
	 */
	public class PartIdealHarmonicRange {
		public function PartIdealHarmonicRange() {}
		
		// Keyboards
		public static const PIANO:Array = [52, 83];
		public static const HARPSICHORD:Array = [50, 71];
		public static const CELESTA:Array = [77, 94];
		public static const ORGAN:Array = [49, 86];
		
		// Bowed strings
		public static const VIOLIN:Array = [72, 89];
		public static const VIOLA:Array = [63, 79];
		public static const CELLO:Array = [50, 64];
		public static const CONTRABASS:Array = [42, 56];
		
		// Plucked strings
		public static const HARP:Array = [52, 80];
		public static const ACOUSTIC_GUITAR:Array = [55, 71];
		public static const ACOUSTIC_BASS_GUITAR:Array = [41, 54];
		
		// Reedless woodwinds
		public static const PICCOLO:Array = [84, 94];
		public static const FLUTE:Array = [72, 85];
		public static const RECORDER:Array = [67, 75];
		
		// Single-reed woodwinds
		public static const CLARINET:Array = [65, 81];
		
		// Double reed woodwinds
		public static const OBOE:Array = [69, 81];
		public static const ENGLISH_HORN:Array = [62, 73];
		public static const BASSOON:Array = [48, 63];
		
		// Solo brass
		public static const TRUMPET:Array = [64, 74];
		public static const TROMBONE:Array = [51, 63];
		public static const TUBA:Array = [38, 49];
		public static const FRENCH_HORNS:Array = [49, 65];
		
		// Pitched percution
		public static const GLOCKENSPIEL:Array = [89, 100];
		public static const VIBRAPHONE:Array = [65, 78];
		public static const MARIMBA:Array = [63, 81];
		public static const XYLOPHONE:Array = [80, 96];
		public static const TUBULAR_BELLS:Array = [66, 72];
		
		// Other
		public static const CHOIR:Array = [54, 68];
		
	}
}