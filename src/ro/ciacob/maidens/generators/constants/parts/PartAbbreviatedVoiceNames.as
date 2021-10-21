package ro.ciacob.maidens.generators.constants.parts {
	import ro.ciacob.utils.Strings;
	import ro.ciacob.utils.constants.CommonStrings;

	public final class PartAbbreviatedVoiceNames {
		
		// Piano
		public static const PIANO:Array = ['R.H.', 'L.H.'];
		public static const PIANO_2:Array = ['(Pno.) R.H. ', 'L.H.'];
		public static const PIANO_3:Array = ['(Pno.) R.H. ', 'L.H. I', 'L.H. II'];
		public static const PIANO_4:Array = ['(Pno.) R.H. I ', 'R.H. II', 'L.H. I', 'L.H. II'];

		// Harpsichord
		public static const HARPSICHORD:Array = PIANO;
		public static const HARPSICHORD_2:Array = ['(Hps.) R.H.', 'L.H.'];
		public static const HARPSICHORD_3:Array = ['(Hps.) R.H.', 'L.H. I', 'L.H. II'];
		public static const HARPSICHORD_4:Array = ['(Hps.) R.H. I', 'R.H. II', 'L.H. I', 'L.H. II'];

		// Organ
		public static const ORGAN:Array = ['R.H.', 'L.H.', 'Ped.'];
		public static const ORGAN_3:Array = ['(Org.) R.H.', 'L.H.', 'Ped.'];
		public static const ORGAN_4:Array = ['(Org.) R.H.', 'L.H. I', 'L.H. II', 'Ped.'];
		public static const ORGAN_5:Array = ['(Org.) R.H. I', 'R.H. II', 'L.H. I', 'L.H. II', 'Ped.'];
		public static const ORGAN_6:Array = ['(Org.) R.H. I', 'R.H. II', 'L.H. I', 'L.H. II', 'Ped. I', 'Ped. II'];

		// Frech Horns
		public static const FRENCH_HORNS:Array = ['I, II', 'III'];
		public static const FRENCH_HORNS_2:Array = ['F. Hn. I, II', 'F. Hn. III'];
		public static const FRENCH_HORNS_3:Array = ['F. Hn. I', 'F. Hn. II', 'F. Hn. III'];

		// Choir
		public static const CHOIR:Array = ['S.', 'A.', 'T.', 'B.'];
		public static const CHOIR_2:Array = ['S./A.', 'T./B.'];
		public static const CHOIR_3:Array = ['S.', 'A.', 'T./B.'];
		public static const CHOIR_4:Array = ['S.', 'A.', 'T.', 'B.'];
		
		public static function getNames (partName : String, numStaves : int = -1) : Array {
			partName = Strings.toAS3ConstantCase(partName);
			if (numStaves != -1) {
				partName = partName.concat (CommonStrings.UNDERSCORE, numStaves);
			}
			if (partName in PartAbbreviatedVoiceNames) {
				return PartAbbreviatedVoiceNames[partName];
			}
			return null;
		}
	}
}