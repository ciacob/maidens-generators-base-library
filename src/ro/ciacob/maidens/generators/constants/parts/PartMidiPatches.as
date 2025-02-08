package ro.ciacob.maidens.generators.constants.parts {
	public final class PartMidiPatches {

		/*
         * NOTE: This is NOT the standard General MIDI (GM) patch table. 
         * Due to severe memory leaks in the Alchemy-compiled synthesizer currently in use, 
         * we were forced to implement a **custom patching scheme** as a workaround.
         * 
         * --- The Issue ---
         * The synthesizer struggles to load or correctly address multiple patches 
         * without leaking enormous amounts of memory. To mitigate this, we created a **velocity-switched** 
         * SoundFont file, where instrument patches are accessed by sending `noteOn` messages 
         * with the velocity values defined below.
         *
         * --- Additional Quirks ---
         * Despite attempting to disable the default "Velocity to Attenuation" modulator, 
         * the synthesizer **still** applies unwanted velocity-based volume scaling.
         * To counteract this behavior, we arranged instruments in a way that **compensates 
         * for their natural dynamics**:
         *   - **Softer instruments** are mapped to **higher velocity values**.
         *   - **Louder instruments** are mapped to **lower velocity values**.
         *   
         * This mapping ensures a more balanced playback experience despite the synth's limitations.
		 */

		// Acoustic Bass
		public static const ACOUSTIC_BASS_GUITAR:int = 111;

		// Ahh Choir
		public static const CHOIR:int = 114;


		public static const BASSOON:int = 108;
		public static const CELESTA:int = 120;
		public static const CELLO:int = 109;

		// Church Organ
		public static const ORGAN:int = 99;

		public static const CLARINET:int = 110;
		public static const CONTRABASS:int = 112;
		public static const ENGLISH_HORN:int = 107;
		public static const FLUTE:int = 116;
		public static const FRENCH_HORNS:int = 103;
		public static const GLOCKENSPIEL:int = 115;
		public static const HARPSICHORD:int = 119;
		public static const MARIMBA:int = 123;

		// Nylon guitar
		public static const ACOUSTIC_GUITAR:int = 125;

		public static const OBOE:int = 106;

		// Orchestral Harp
		public static const HARP:int = 124;

		// Piano f
		public static const PIANO:int = 113;

		public static const PICCOLO:int = 105;
		public static const RECORDER:int = 121;
		public static const TROMBONE:int = 101;
		public static const TRUMPET:int = 100;
		public static const TUBA:int = 102;
		public static const TUBULAR_BELLS:int = 117;
		public static const VIBRAPHONE:int = 122;
		public static const VIOLA:int = 118;
		public static const VIOLIN:int = 104;
		public static const XYLOPHONE:int = 126;
	}
}