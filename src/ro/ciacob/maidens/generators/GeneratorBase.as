
package ro.ciacob.maidens.generators {
	import flash.display.Sprite;
	import flash.errors.IllegalOperationError;
	import flash.utils.describeType;
	import flash.utils.getQualifiedClassName;
	
	import ro.ciacob.ciacob;
	import ro.ciacob.desktop.signals.PTT;
	import ro.ciacob.maidens.generators.constants.GeneratorBaseKeys;
	import ro.ciacob.maidens.generators.constants.GeneratorSupportedTypes;
	import ro.ciacob.utils.Strings;
	import ro.ciacob.utils.constants.CommonStrings;

	use namespace ciacob;
	/**
	 * The superclass of all AS3 generator modules. It provides the core mechanism for communicating
	 * with the MAIDENS base application, and also imposes some security restrictions.
	 */
	public class GeneratorBase extends Sprite {
		
		public function GeneratorBase() {}
		
		/**
		 * Stores and returns a list with information about all sections, which are hooked up as outputs of this
		 * generator. This information can be used in the subclass implementation (e.g., to allow the user to
		 * choose into which part exactly — of the available ones — the generated content will go).
		 */
		public function get $targetsInfo():Array {
			return _targetsInfo;
		}
		public function set $targetsInfo(value:Array):void {
			_targetsInfo = value;
		}
		
		/**
		 * Provides external, read-only access to the PTT pipe assigned for bidirectional communication with
		 * this Generator.  
		 */		
		public function get $pipe() : PTT {
			return _pipe;
		}
		
		/**
		 * Called by the MAIDENS application after this module has been loaded and initialized. This
		 * method is meant to be overridden in your subclass. Return from it a list with objects
		 * that describe the public accessors and routines the end-user should have access to (from
		 * within a graphical interface). The actual graphical interface will be built by MAIDENS.
		 *
		 * The default implementation of this method builds a list by using AS3 reflection. It will
		 * contain all public getters, setters and methods from the current class, whose name do not
		 * start with a dollar sign ('$').
		 */
		public function get $uiEndpoints() : Object {
			var ret:Array = [];
			var typeDescription:XML = describeType(this);
			var typeLocalName:String = typeDescription.@name.toString();
			var ownAccessors:XMLList = typeDescription..accessor.(@declaredBy ==
				typeLocalName);
			for each (var accessor:XML in ownAccessors) {
				var aName:String = accessor.@name.toString();
				if (!Strings.beginsWith(aName, '$')) {
					var accessType:String = accessor.@access.toString();
					if (accessType == READ_WRITE_ACCESS) {
						var expandedName:String = Strings.properCase(Strings.deCamelize(aName));
						_labelsMap[aName] = expandedName;
						var type:String = accessor.@type.toString();
						if (Strings.isAny (type, 
							GeneratorSupportedTypes.INT,
							GeneratorSupportedTypes.NUMBER,
							GeneratorSupportedTypes.BOOLEAN,
							GeneratorSupportedTypes.STRING,
							GeneratorSupportedTypes.ARRAY,
							GeneratorSupportedTypes.OBJECT
						)) {
							var endPoint:Object = {};
							endPoint[GeneratorBaseKeys.NAME] = aName;
							endPoint[GeneratorBaseKeys.LABEL] = expandedName;
							endPoint[GeneratorBaseKeys.TYPE] = type;
							endPoint[GeneratorBaseKeys.DEFAULT] = this[aName];
							var matchingSources:XMLList = typeDescription..accessor.
								(@name == aName.concat(SRC_SUFFIX));
							if (matchingSources.length() > 0) {
								var srcNode:XML = (matchingSources[0] as XML);
								var srcAccessType:String = srcNode.@access.toString();
								if (srcAccessType == READ_ACCESS) {
									var srcGetterName:String = srcNode.@name.toString();
									endPoint[GeneratorBaseKeys.SOURCE] = (this[srcGetterName] as
										Array);
								}
							}
							var meta:XMLList = accessor.metadata;
							if (meta.length() > 0) {
								var expectedMetaNames:Array = [
									GeneratorBaseKeys.INDEX,
									GeneratorBaseKeys.DESCRIPTION,
									GeneratorBaseKeys.MINIMUM,
									GeneratorBaseKeys.MAXIMUM,
									GeneratorBaseKeys.ADVANCED,
									GeneratorBaseKeys.LIST_FONT_SIZE,
									GeneratorBaseKeys.EDITOR_FONT_SIZE,
									GeneratorBaseKeys.UNIQUE_SELECTION,
									GeneratorBaseKeys.DEPENDS_ON
								];
								for (var i:int = 0; i < expectedMetaNames.length; i++) {
									var nodeName:String = (expectedMetaNames[i] as String);
									var metaNode:XMLList = accessor.metadata.(@name == nodeName);
									if (metaNode.length() > 0) {
										var key:String = nodeName;
										var value:String = null;
										var args:XMLList = metaNode.arg;
										if (args.length() > 0) {
											value = Strings.trim((args[0] as XML).@value);
										}
										endPoint[key] = value;
									}
								}
							}
							ret.push(endPoint);
						}
					}
				}
			}
			for (var j:int = 0; j < ret.length; j++) {
				var el:Object = ret[j];
				if (GeneratorBaseKeys.DESCRIPTION in el) {
					var desc:String = (el[GeneratorBaseKeys.DESCRIPTION] as String);
					desc = _expandNames(desc);
					el[GeneratorBaseKeys.DESCRIPTION] = desc;
				}
			}
			return ret;
		}
		
		private static const READ_ACCESS:String = 'readonly';
		private static const READ_WRITE_ACCESS:String = 'readwrite';
		private static const SRC_SUFFIX:String = 'Src';

		private var _labelsMap:Object = {};
		private var _pipe : PTT;
		private var _targetsInfo:Array;

		/**
		 * Calls a specific public API within the MAIDENS application, by its name. Use `$hasAPI()` to check whether
		 * the API exists.
		 *
		 * @param	apiName
		 * 			The name of the API to call.
		 *
		 * @param	arguments
		 * 			The arguments to send to it. Use null if you don't need to send any.
		 *
		 * @return	The value the API returns; this is `undefined` rather than `void` when the API call doesn't return
		 * 			a value.
		 *
		 * @throws	 IllegalOperationError
		 * 			 If a matching API call cannot be found.
		 *
		 * @throws	 ArgumentError
		 * 			 If the arguments you send are incorrect (wrong number, type and/or order).
		 */
		public final function $callAPI(apiName:String, arguments:Array, callback : Function = null):void {
			 var on_api_execution_result : Function = function (inData : Object) : void {
				 var apiName : String = (inData[GeneratorBaseKeys.API_NAME] as String);
				 var output : Object = inData[GeneratorBaseKeys.API_OUTPUT];
				_pipe.unsubscribe(GeneratorBaseKeys.API_EXECUTION_RESULT, on_api_execution_result);
				if (callback != null) {
					callback (apiName, output);
				}
			 }
			_pipe.subscribe(GeneratorBaseKeys.API_EXECUTION_RESULT, on_api_execution_result);
			var outData : Object = {};
			outData[GeneratorBaseKeys.API_NAME] = apiName;
			outData[GeneratorBaseKeys.API_ARGUMENTS] = arguments;
			_pipe.send(GeneratorBaseKeys.NEED_API_EXECUTION, outData);
		}

		/**
		 * Queries the MAIDENS application on whether a specific API call is available. Use it in connection with
		 * `$callAPI()`.
		 *
		 * @param	apiName
		 * 			The API call to look for, case sensitive.
		 *
		 * @return	True if the API exists, false otherwise.
		 */
		public final function $checkApiAvailable(apiName:String, callback : Function):void {
			var on_api_availability_result : Function = function (inData : Object) : void {
				var apiName : String = (inData[GeneratorBaseKeys.API_NAME] as String);
				var isAvailable : Boolean = (inData[GeneratorBaseKeys.API_EXISTS] as Boolean);
				_pipe.unsubscribe(GeneratorBaseKeys.API_AVAILABILITY_RESULT, on_api_availability_result);
				callback (apiName, isAvailable);
			}
			_pipe.subscribe(GeneratorBaseKeys.API_AVAILABILITY_RESULT, on_api_availability_result);
			_pipe.send(GeneratorBaseKeys.NEED_API_AVAILABILITY, apiName);
		}

		/**
		 * Called by the MAIDENS application when the end-user has clicked the `Generate` button of your module.
		 * When done, store the output, then call `$notifyGenerationComplete()`.
		 */
		public function $generate():void {
			throw(new Error('GeneratorBase.$generate(): you must override this method in your generator class.'));
		}


		/**
		 * Called by the MAIDENS application after you have signaled that there is new output available to
		 * be read from. You must override this method in your module implementation, and have it return the
		 * actual generated content.
		 *
		 * @return
		 * 		The expected generation outcome is an Object, with the output slot names as keys. The value types must be
		 * 		one of the agreed upon data type, as defined in `GeneratorSupportedTypes`.
		 *
		 * @see $notifyGenerationComplete
		 */
		public function $getOutput():Object {
			throw(new Error('GeneratorBase.$readFromOutput(): you must override this method in your generator class.'));
			return null;
		}

		/**
		 * You call this function when done generating, to let MAIDENS know that it should read from your
		 * module's outputs, and that it should also permit future content generation sessions.
		 *
		 * MAIDENS performs these steps, in order, when the end-user clicks the 'generate'
		 * button:
		 * 1. disables the module's `Generate` button (or equivalent graphical controls);
		 * 2. makes the `$callAPI()` and `$haveAPI()` methods available;
		 * 3. starts listening for a module call of `$notifyGenerationComplete()` or `$notifyGenerationAborted()`;
		 * 4. calls the module's `$generate()` method.
		 *
		 * Upon receiving a `$notifyGenerationComplete()` notification, MAIDENS does the following:
		 *
		 * 1. stops listening for a module call of `$notifyGenerationComplete()` or `$notifyGenerationAborted()`;
		 * 2. makes the `$callAPI()` & `$haveAPI()` methods unavailable;
		 * 3. reads the module's outputs, and sends them to their appropriate destination(s);
		 * 4. enables the module's `Generate` button (or equivalent graphical controls);
		 *
		 */
		public final function $notifyGenerationComplete():void {
			_pipe.send(GeneratorBaseKeys.MODULE_GENERATION_COMPLETE);
		}
		
		/**
		 * You call this function when user gave up mid-way, to let MIADENS know that it should ignore
		 * current output and permit future content generation sessions.
		 * 
		 * Upon receiving a `$notifyGenerationAborted()` notification, MAIDENS does the following:
		 * 1. stops listening for a module call of `$notifyGenerationComplete()` or `$notifyGenerationAborted()`;
		 * 2. makes the `$callAPI()` & `$haveAPI()` methods unavailable;
		 * 3. enables the module's `Generate` button (or equivalent graphical controls);
		 */
		public final function $notifyGenerationAborted():void {
			_pipe.send(GeneratorBaseKeys.MODULE_GENERATION_ABORTED);
		}

		/**
		 * Joins together each string in `labelsA` with each string in `labelsB` (by default, using a newline) and groups
		 * the resulting sets by values in `labelsA`. If provided, relevant values in `valuesA` and/or `valuesB`
		 * will be provided along with each joined label.
		 * 
		 * <code>
		 * // EXAMPLE: 
		 * 
		 * import mx.utils.ObjectUtil;
		 * 
		 * var labelsA : Array = ["one", "two", "three"];
		 * var labelsB : Array = ["and a quarter", "and a half"];
		 * var valuesA : Array = [1, 2, 3];
		 * var valuesB : Array = [1.4, 1.2];
		 * ObjectUtils.toString (createCombinations (labelsA, labelsB, valuesA, valuesB));
		 * 
		 * // Output:
		 * // (Array)#0
		 * //   [0] (Object)#1
		 * //     head = "one"
		 * //     body = (Array)#2
		 * //       [0] (Object)#3
		 * //         label = "one\nand a quarter"
		 * //         toString = (function)
		 * //         values = (Array)#4
		 * //           [0] 1
		 * //           [1] 1.4
		 * //       [1] (Object)#5
		 * //         label = "one\nand a half"
		 * //         toString = (function)
		 * //         values = (Array)#6
		 * //           [0] 1
		 * //           [1] 1.2
		 * //   [1] (Object)#7
		 * //     head = "two"
		 * //     body = (Array)#8
 		 * //      [0] (Object)#9
		 * //         label = "two\nand a quarter"
		 * //         toString = (function)
		 * //         values = (Array)#10
 		 * //          [0] 2
		 * //           [1] 1.4
		 * //       [1] (Object)#11
		 * //         label = "two\nand a half"
		 * //         toString = (function)
		 * //         values = (Array)#12
 		 * //          [0] 2
 		 * //          [1] 1.2
		 * //   [2] (Object)#13
		 * //     head = "three"
		 * //     body = (Array)#14
		 * //       [0] (Object)#15
		 * //         label = "three\nand a quarter"
		 * //         toString = (function)
		 * //         values = (Array)#16
		 * //           [0] 3
		 * //           [1] 1.4
		 * //       [1] (Object)#17
		 * //         label = "three\nand a half"
 		 * //        toString = (function)
		 * //        values = (Array)#18
 		 * //          [0] 3
		 * //          [1] 1.2
		 * <code>
		 * 
		 * @param labelsA Array of strings to combine and group by. Non-strings will be converted.
		 * 
		 * @param labelsB Array of strings to bombine with those in `labelsA`. Non-strings will be converted.
		 * 
		 * @param valuesA Optional. Array of arbitrary values relevant to `labelsA`. If given, must have
		 * 				  the same length as `labelsA`. They will be includded with the output (see above).
		 * 
		 * @param valuesB Optional. Array of arbitrary values relevant to `labelsB`. If given, must have
		 * 				  the same length as `labelsA`. They will be includded with the output (see above).
		 * 
		 * @param joinFun Optional. A function to do the joining of strings. It will receive two string
		 * 				  arguments and must return a string.
		 */
		protected final function createCombinations ( labelsA : Array, labelsB : Array, valuesA : Array = null, 
			valuesB : Array = null, joinFun : Function = null ) : Array {
			// Sanity checks
			if (labelsA == null || labelsA.length == 0) {
				throw (new ArgumentError ('Argument `labelsA` must be non-null and non-empty.'))
			} 
			if (labelsB == null || labelsB.length == 0) {
				throw (new ArgumentError ('Argument `labelsB` must be non-null and non-empty.'))
			} 
			if (valuesA != null && valuesA.length != labelsA.length) {
				throw (new ArgumentError ('If provided, `valuesA` must have the same length as `labelsA`.'));
			}
			if (valuesB != null && valuesB.length != labelsB.length) {
				throw (new ArgumentError ('If provided, `valuesB` must have the same length as `labelsB`.'));
			}
			// Defining variables outside of the loop for performance considerations
			var ret : Array = [];
			var group : Object = null;
			var body : Array = null;
			var values : Array = null;
			var bodyItem : Object = null;
			var labelA : String = null;
			var labelB : String = null;
			var combLabel : String = null;
			var valueA : Object = null;
			var valueB : Object = null;
			var i : int = 0;
			var j : int;
			var sizeOfA : int = labelsA.length;
			var sizeOFB : int = labelsB.length;
			for (i; i < sizeOfA; i++) {
				group = {};
				ret.push (group);
				labelA = (CommonStrings.EMPTY.concat (labelsA[i]));
				group['head'] = labelA;
				body = [];
				group['body'] = body;
				for (j = 0; j < sizeOFB; j++) {
					values = null;
					labelB = (CommonStrings.EMPTY.concat (labelsB[j]));
					if (joinFun != null) {
						combLabel = CommonStrings.EMPTY.concat (joinFun (labelA, labelB));
					} else {
						combLabel = below (labelA, labelB);
					}
					if (valuesA != null) {
						values = (values || []);
						values.push (valuesA[i] as Object);
					}
					if (valuesB != null) {
						values = (values || []);
						values.push (valuesB[j] as Object);					
					}
					bodyItem = {};
					bodyItem['label'] = combLabel;
					if (values != null) {
						bodyItem['values'] = values;
					}
					body.push (bodyItem);
				}
			}
			return ret;
		}
		
		/**
		 * Convenient way of getting a `column`/field from a `table`/Array of Objects with identical structure.
		 * 
		 * @param table An Array containing Objects with identical structure, to query from.
		 * 
		 * @param colName The name of the field to retrieve.
		 * 
		 * @param filter Optional. A function that will receive, in turn, each Object (i.e., "row") in `table`.
		 * 				 It must return Boolean `true` if the `colName` field of the current "row" is to be
		 * 				 included in the result, or false otherwise.
		 * 
		 * @return An Array with the values of all `colName` fields, in the order they show in `table`.
		 */
		protected final function getTableCol (table: Array, colName : String, filter : Function = null) : Array {
			var ret : Array = [];
			var i : int = 0;
			var rows : int = table.length;
			var row : Object = null;
			for (i; i < rows; i++) {
				row = (table[i] as Object);
				if (filter == null || filter (row)) {
					ret[i] = row[colName];
				}
			}
			return ret;
		}
		
		/**
		 * Concatenates strings via new line.
		 */
		protected final function below (... args : Array):String {
			return args.join (CommonStrings.NEW_LINE);
		}
		
		/**
		 * Concatenates strings via space.
		 */
		protected final function beside (... args : Array):String {
			return args.join (CommonStrings.SPACE);
		}
		
		/**
		 * Called by the MAIDENS application after successfully loading and initializing this module.
		 * Stores a private communication pipe the module will internally use to communicate with the
		 * application.
		 *
		 * You will never have to call this function directly.
		 *
		 * @param	pipe
		 * 			A private, communication pipe.
		 *
		 * @throws	IllegalOperationError, if you try to directly call this method.
		 */
		public final function $init(pipe:PTT):void {
			if (_pipe != null) {
				throw(new IllegalOperationError('Module ' + getQualifiedClassName(this) +
					' has already been initialized; calling `$init()` a second time is not permitted.'));
			}
			_pipe = pipe;
		}

		/**
		 * Replaces '[myEndPoint]' with 'My end point' within the given string.
		 *
		 * @param	text
		 * 			The text to search and replace in.
		 *
		 * @return	The text with changes applied, if any.
		 */
		private function _expandNames(text:String):String {
			if (!Strings.isEmpty(text)) {
				for (var name:String in _labelsMap) {
					var pSegm:Array = ['\\[', name, '\\]'];
					var pattern:RegExp = new RegExp(pSegm.join(''), 'g');
					var replacement:String = (['«', _labelsMap[name] as String, '»']).
						join('');
					text = text.replace(pattern, replacement);
				}
			}
			return text;
		}
	}
}
