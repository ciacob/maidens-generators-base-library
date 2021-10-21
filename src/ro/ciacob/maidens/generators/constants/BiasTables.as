package ro.ciacob.maidens.generators.constants {
	import ro.ciacob.maidens.generators.constants.pitch.IntervalsSize;

	public class BiasTables {
		public function BiasTables() {}
		
		private static var _externalVoicesMelodicBias : Array;
		private static var _internalVoicesMelodicBias : Array;
		
		public static const BASELINE : uint = 100;
		
		/**
		 * The bias (here, degree of acceptability) of melodic musical intervals that
		 * occur inside an "external voice" (e.g., bass and soprano) as part of a 
		 * homophonic choral. The index of the Array reflects the interval'n number
		 * of semitones; the value holds its bias.
		 */
		public static function get EXTERNAL_VOICES_MELODIC_BIAS () : Array {
			if (!_externalVoicesMelodicBias) {
				_externalVoicesMelodicBias = [];
				_externalVoicesMelodicBias [IntervalsSize.MINOR_THIRD] = BASELINE * 3.2;
				_externalVoicesMelodicBias [IntervalsSize.MAJOR_THIRD] = BASELINE * 3.1;
				_externalVoicesMelodicBias [IntervalsSize.MAJOR_SECOND] = BASELINE * 3;
				_externalVoicesMelodicBias [IntervalsSize.MINOR_SECOND] = BASELINE * 2.9;
				_externalVoicesMelodicBias [IntervalsSize.PERFECT_FOURTH] = BASELINE * 1.5;
				_externalVoicesMelodicBias [IntervalsSize.PERFECT_FIFTH] = BASELINE * 1.4;
				_externalVoicesMelodicBias [IntervalsSize.PERFECT_UNISON] = BASELINE * 1.8;
				_externalVoicesMelodicBias [IntervalsSize.MAJOR_SIXTH] = BASELINE * 1.3;
				_externalVoicesMelodicBias [IntervalsSize.MINOR_SIXTH] = BASELINE * 1.2;
				_externalVoicesMelodicBias [IntervalsSize.PERFECT_OCTAVE] = BASELINE * 1.1;
				_externalVoicesMelodicBias [IntervalsSize.AUGMENTED_FOURTH] = BASELINE * 0.25;
				_externalVoicesMelodicBias [IntervalsSize.MINOR_SEVENTH] = BASELINE * 0.5;
				_externalVoicesMelodicBias [IntervalsSize.MAJOR_SEVENTH] = BASELINE * 0.1;
			}
			return _externalVoicesMelodicBias;
		}
		
		/**
		 * The bias (here, degree of acceptability) of melodic musical intervals that
		 * occur inside an "internal voice" (e.g., alto, tenor) as part of a homophonic
		 * choral. The index of the Array reflects the interval'n number of semitones;
		 * the value holds its bias.
		 */
		public static function get INTERNAL_VOICES_MELODIC_BIAS () : Array {
			if (!_internalVoicesMelodicBias) {
				_internalVoicesMelodicBias = [];
				_internalVoicesMelodicBias [IntervalsSize.PERFECT_UNISON] = BASELINE * 2;
				_internalVoicesMelodicBias [IntervalsSize.MAJOR_SECOND] = BASELINE * 1.9;
				_internalVoicesMelodicBias [IntervalsSize.MINOR_SECOND] = BASELINE * 1.8;
				_internalVoicesMelodicBias [IntervalsSize.MINOR_THIRD] = BASELINE * 1.7;
				_internalVoicesMelodicBias [IntervalsSize.MAJOR_THIRD] = BASELINE * 1.6;
				_internalVoicesMelodicBias [IntervalsSize.PERFECT_FOURTH] = BASELINE * 1.1;
				_internalVoicesMelodicBias [IntervalsSize.PERFECT_FIFTH] = BASELINE * 0.7;
				_internalVoicesMelodicBias [IntervalsSize.MAJOR_SIXTH] = BASELINE * 0.6;
				_internalVoicesMelodicBias [IntervalsSize.MINOR_SIXTH] = BASELINE * 0.5;
				_internalVoicesMelodicBias [IntervalsSize.MINOR_SEVENTH] = BASELINE * 0.4;
				_internalVoicesMelodicBias [IntervalsSize.PERFECT_OCTAVE] = BASELINE * 0.3;
				_internalVoicesMelodicBias [IntervalsSize.MAJOR_SEVENTH] = BASELINE * 0.2;
				_internalVoicesMelodicBias [IntervalsSize.AUGMENTED_FOURTH] = BASELINE * 0.1;
			}
			return _internalVoicesMelodicBias;
		}
		
	}
}

