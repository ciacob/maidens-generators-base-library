package ro.ciacob.maidens.generators {
	import ro.ciacob.math.Fraction;
	import ro.ciacob.utils.Strings;

	public class MusicEntry {
		public static const MIDDLE_C:int = 60;
		public static const QUARTER:Fraction = new Fraction(1, 4);
		
		private static const MIDI_MAX:int = 127;
		private static const UIDS_POOL:Object = {};
		private static const UID_LENGTH:int = 3;

		/**
		 * Creates a `Note` instance from a given string. The string must be in
		 * the format "[duration]@[pitch]", e.g., "1/4@60" — the same format used by
		 * `Note.toString()`.
		 */
		public static function fromString(str:String):MusicEntry {
			var segments:Array = str.split('@');
			var duration:Fraction = Fraction.fromString(segments[0] as String);
			var pitch:int = parseInt(segments[1] as String);
			var note:MusicEntry = new MusicEntry(pitch, duration);
			return note;
		}

		/**
		 * Set pitch to `0` to define a rest (MIDI note 0 represents a pitch too low
		 * for humans to hear it, therefore you wouldn't use it anyway).
		 */
		public function MusicEntry(pitch:int = 0, duration:Fraction = null, tie:Boolean = false) {
			_uid = Strings.generateUniqueId(UIDS_POOL);
			this.pitch = pitch;
			this.duration = duration;
			this.tie = tie;
		}

		private var _duration:Fraction = QUARTER;
		private var _pitch:int = MIDDLE_C;
		private var _tie:Boolean;
		private var _uid:String;

		public function get duration():Fraction {
			return _duration;
		}

		public function set duration(value:Fraction):void {
			if (value == null) {
				value = QUARTER;
			}
			_duration = value;
		}

		public function get pitch():int {
			return _pitch;
		}

		public function set pitch(value:int):void {
			if (pitch < 0 || pitch > MIDI_MAX) {
				value = 0;
			}
			_pitch = value;
		}

		public function get tie():Boolean {
			return _tie;
		}

		public function set tie(value:Boolean):void {
			_tie = value;
		}

		public function toString():String {
			return duration.toString().concat('@', _pitch.toString());
		}

		public function get uid():String {
			return _uid;
		}
	}

}
