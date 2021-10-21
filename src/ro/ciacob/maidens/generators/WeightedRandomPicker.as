package ro.ciacob.maidens.generators {

	/**
	 * Accepts a number of `options` each with an associated weight, or chance to be picked up.
	 * Draws one of the options on demand.
	 *
	 * @author ciacob
	 */
	public class WeightedRandomPicker {
		
		public function WeightedRandomPicker () {}

		private static const OPTIONS_EXHAUSTED:String = 'optionsExhausted';
		private static const SHUFFLE_PASSES:int = 20;

		private var _alreadyPicked:Array = [];
		private var _effectiveWeightsTable:Object;
		private var _haveInfiniteOptions:Boolean = false;
		private var _options:Object = {};
		private var _optionsSum:Number = 0;
		private var _pool:Array = [];

		public function set infiniteOptions(value:Boolean):void {
			_haveInfiniteOptions = value;
			_reset();
		}

		public function pick():String {
			_compilePool();
			_shuffle();
			var option:String = _pickAnOption();
			if (option === OPTIONS_EXHAUSTED) {
				throw('WeightedRandomPicker: Cannot pick; available options were exhausted');
			}
			return option;
		}

		public function setOption(uid:String, weight:Number, override:Boolean = true):void {
			if (isNaN(weight)) {
				throw(new Error('WeightedRandomPicker: value given for option `' +
					uid + '` is NaN.'));
			}
			if ((uid in _options) && !override) {
				throw(new Error('WeightedRandomPicker: option `' + uid + '` was already set.'));
			}
			_options[uid] = weight;
			_optionsSum += weight;
		}

		public function toString():String {
			if (_effectiveWeightsTable == null) {
				_compilePool();
			}
			var out:String = '\n\tWeighted Random Picker\n\tCurrent options are (key | weight | effective weight):\n\t';
			var sum:Number = 0;
			for (var key:String in _options) {
				var value:Number = parseFloat(_options[key]);
				sum += value;
				out = out.concat(key, ' | ', value, ' | ', _effectiveWeightsTable[key],
					'%\n\t');
			}
			out = out.concat('Weights sum up to (weight | effective weight):\n\t', sum, ' | ~100%');
			return out;
		}

		private function _compilePool():void {
			_pool = [];
			_effectiveWeightsTable = {};
			for (var key:String in _options) {
				if (!_haveInfiniteOptions && _alreadyPicked.length > 0 && _alreadyPicked.
					indexOf(key) >= 0) {
					continue;
				}
				var weight:Number = (_options[key] as Number);
				var effectiveWeight:Number = (weight / _optionsSum);
				_effectiveWeightsTable[key] = Math.floor(effectiveWeight * 100);
				var numOccurences:int = Math.floor(effectiveWeight * 100);
				while (numOccurences > 0) {
					_pool.push(key);
					numOccurences--;
				}
			}
		}

		private function _pickAnOption():String {
			var chosenIndex:int = Math.floor(Math.random() * (_pool.length - 1));
			if (_haveInfiniteOptions) {
				return _pool[chosenIndex];
			}
			if (_pool.length > 0) {
				var option:String = (_pool[chosenIndex] as String);
				if (_alreadyPicked.indexOf(option) == -1) {
					_alreadyPicked.push(option);
				}
				return option;
			}
			return OPTIONS_EXHAUSTED;
		}

		private function _randomSort(a:Object, b:Object):int {
			var returns:Array = [-1, 0, 1];
			var chosenIndex:int = Math.floor(Math.random() * (returns.length - 1));
			var ret:int = returns[chosenIndex];
			return ret;
		}

		private function _reset():void {
			_alreadyPicked = [];
		}

		private function _shuffle():void {
			var shuffleCount:int = SHUFFLE_PASSES;
			do {
				_pool.sort(_randomSort);
			} while (--shuffleCount > 0);
		}
	}
}
