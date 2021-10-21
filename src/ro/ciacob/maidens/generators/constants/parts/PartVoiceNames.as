package ro.ciacob.maidens.generators.constants.parts {
	import ro.ciacob.utils.Strings;
	import ro.ciacob.utils.constants.CommonStrings;

	public final class PartVoiceNames {

		// Piano
		public static const PIANO:Array = ['Right Hand', 'Left Hand'];
		public static const PIANO_2:Array = ['(Piano) Right Hand', 'Left Hand'];
		public static const PIANO_3:Array = ['(Piano) Right Hand', 'Left Hand I', 'Left Hand II'];
		public static const PIANO_4:Array = ['(Piano) Right Hand I', 'Right Hand II', 'Left Hand I', 'Left Hand II'];

		// Harpsichord
		public static const HARPSICHORD:Array = PIANO;
		public static const HARPSICHORD_2:Array = ['(Harpsichord) Right Hand', 'Left Hand'];
		public static const HARPSICHORD_3:Array = ['(Harpsichord) Right Hand', 'Left Hand I', 'Left Hand II'];
		public static const HARPSICHORD_4:Array = ['(Harpsichord) Right Hand I', 'Right Hand II', 'Left Hand I', 'Left Hand II'];

		// Organ
		public static const ORGAN:Array = ['Right Hand', 'Left Hand', 'Pedal'];
		public static const ORGAN_3:Array = ['(Organ) Right Hand', 'Left Hand', 'Pedal'];
		public static const ORGAN_4:Array = ['(Organ) Right Hand', 'Left Hand I', 'Left Hand II', 'Pedal'];
		public static const ORGAN_5:Array = ['(Organ) Right Hand I', 'Right Hand II', 'Left Hand I', 'Left Hand II', 'Pedal'];
		public static const ORGAN_6:Array = ['(Organ) Right Hand I', 'Right Hand II', 'Left Hand I', 'Left Hand II', 'Pedal I', 'Pedal II'];

		// Frech Horns
		public static const FRENCH_HORNS:Array = ['I, II', 'III'];
		public static const FRENCH_HORNS_2:Array = ['French Horn I, II', 'French Horn III'];
		public static const FRENCH_HORNS_3:Array = ['French Horn I', 'French Horn II', 'French Horn III'];

		// Choir
		public static const CHOIR:Array = ['Soprano', 'Alto', 'Tenor', 'Bass'];
		public static const CHOIR_2:Array = ['Soprano/Alto', 'Tenor/Bass'];
		public static const CHOIR_3:Array = ['Soprano', 'Alto', 'Tenor/Bass '];
		public static const CHOIR_4:Array = ['Soprano', 'Alto', 'Tenor', 'Bass'];

		public static function getNames(partName:String, numStaves : int = -1) : Array {
			partName = Strings.toAS3ConstantCase(partName);
			if (numStaves != -1) {
				partName = partName.concat (CommonStrings.UNDERSCORE, numStaves);
			}
			if (partName in PartVoiceNames) {
				return PartVoiceNames[partName];
			}
			return null;
		}
	}
}
