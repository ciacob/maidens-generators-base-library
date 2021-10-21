package ro.ciacob.maidens.generators.constants {
	public final class MIDI {
		public function MIDI() {}
		
		public static const PERCUSSION_RESERVED_CHANNEL_INDEX : int = 10;
		public static const CHANNELS_STACK_SIZE : int = 16;
		
		public static const MAX : int = 127;
		public static const MIN : int = 0;
		
		public static const UNKNOWN_STATE:int=0;
		public static const PLAYING_STATE:int=1;
		public static const STOPPED_STATE:int=2;
		
		/**
		 * Returns `true` if `channelNum` is a General MIDI percussion reserved channel number,
		 * such as 10, 26, 42, etc.
		 * 
		 * Note that the General MIDI standard only provides one set of 16 MIDI channels
		 * (thus, only one channel reserved for percussion, the channel 10). However, synths
		 * alleviate this limitation by stacking together several GM sets, up to the current 
		 * ensemble's instrumentation needs. This means that the 10th channel in each set of
		 * 16 shall be a percussion reserved channel, and its number shall progress by the formula: 
		 * 
		 * i * 16 + 10
		 * 
		 * where `i` takes values from `0` up to the number of GM sets supported by the synth.
		 */
		public static function isPercussionChannel (channelNum : int) : Boolean {
			return ((channelNum -  PERCUSSION_RESERVED_CHANNEL_INDEX) % CHANNELS_STACK_SIZE) == 0;
		}
	}
}