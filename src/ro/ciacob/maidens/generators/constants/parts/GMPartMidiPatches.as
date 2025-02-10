package ro.ciacob.maidens.generators.constants.parts {
    import flash.utils.describeType;

    /**
     * A class that provides General MIDI (GM) instrument patch mappings.
     * Each instrument is mapped to its GM patch number using a constant with a 
     * corresponding `[Description]` metadata tag.
     */
    public final class GMPartMidiPatches {

        [Description(value="Acoustic Grand Piano")]
        public static const PIANO:int = 1;

        [Description(value="Celesta")]
        public static const CELESTA:int = 9;

        [Description(value="Glockenspiel")]
        public static const GLOCKENSPIEL:int = 10;

        [Description(value="Vibraphone")]
        public static const VIBRAPHONE:int = 12;

        [Description(value="Marimba")]
        public static const MARIMBA:int = 13;

        [Description(value="Xylophone")]
        public static const XYLOPHONE:int = 14;

        [Description(value="Tubular Bells")]
        public static const TUBULAR_BELLS:int = 15;

        [Description(value="Harpsichord")]
        public static const HARPSICHORD:int = 7;

        [Description(value="Church Organ")]
        public static const ORGAN:int = 20;

        [Description(value="Acoustic Guitar (Nylon)")]
        public static const ACOUSTIC_GUITAR:int = 25;

        [Description(value="Acoustic Bass")]
        public static const ACOUSTIC_BASS_GUITAR:int = 33;

        [Description(value="Violin")]
        public static const VIOLIN:int = 41;

        [Description(value="Viola")]
        public static const VIOLA:int = 42;

        [Description(value="Cello")]
        public static const CELLO:int = 43;

        [Description(value="Contrabass")]
        public static const CONTRABASS:int = 44;

        [Description(value="Orchestral Harp")]
        public static const HARP:int = 47;

        [Description(value="French Horn")]
        public static const FRENCH_HORNS:int = 61;

        [Description(value="Trumpet")]
        public static const TRUMPET:int = 57;

        [Description(value="Trombone")]
        public static const TROMBONE:int = 58;

        [Description(value="Tuba")]
        public static const TUBA:int = 59;

        [Description(value="Oboe")]
        public static const OBOE:int = 69;

        [Description(value="English Horn")]
        public static const ENGLISH_HORN:int = 70;

        [Description(value="Bassoon")]
        public static const BASSOON:int = 71;

        [Description(value="Clarinet")]
        public static const CLARINET:int = 72;

        [Description(value="Piccolo")]
        public static const PICCOLO:int = 73;

        [Description(value="Flute")]
        public static const FLUTE:int = 74;

        [Description(value="Recorder")]
        public static const RECORDER:int = 75;

        [Description(value="Choir Aahs")]
        public static const CHOIR:int = 53;

        /**
         * Retrieves an array of all GM patches defined in this class.
         * Each entry is an object containing:
         * - `gmName`: The instrument name as per the [Description] metadata.
         * - `gmPatch`: The corresponding General MIDI patch number.
         * 
         * @return Array of objects containing GM instrument name and patch number, sorted by patch number.
         */
        public static function getAllPatches():Array {
            var list:Array = [];
            var info:XML = describeType(GMPartMidiPatches);

            for each (var node:XML in info..constant) {
                var typeName:String = node.@name;
                var patchNumber:int = GMPartMidiPatches[typeName];
                var descriptionMeta:XMLList = node.metadata.(@name == "Description");

                if (descriptionMeta.length() > 0) {
                    var gmName:String = descriptionMeta.arg.(@key == "value").@value;
                    list.push({
                        gmName: gmName,
                        gmPatch: patchNumber
                    });
                }
            }

            return list.sortOn("gmPatch", Array.NUMERIC);
        }

        /**
         * Retrieves General MIDI patch information for a given instrument.
         * 
         * @param internalInst The name of the constant representing the instrument (e.g., "PIANO").
         * @return An object with `gmName` and `gmPatch`, or `null` if not found.
         */
        public static function getGMPatchInfo(internalInst:String):Object {
            var info:XML = describeType(GMPartMidiPatches);

            for each (var node:XML in info..constant) {
                if (node.@name == internalInst) {
                    var patchNumber:int = GMPartMidiPatches[internalInst];
                    var descriptionMeta:XMLList = node.metadata.(@name == "Description");

                    if (descriptionMeta.length() > 0) {
                        var gmName:String = descriptionMeta.arg.(@key == "value").@value;
                        return {
                            gmName: gmName,
                            gmPatch: patchNumber
                        };
                    }
                }
            }

            return null;
        }
    }
}
