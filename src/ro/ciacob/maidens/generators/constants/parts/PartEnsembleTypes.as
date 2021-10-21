package ro.ciacob.maidens.generators.constants.parts {
import ro.ciacob.ciacob;
import ro.ciacob.utils.ConstantUtils;

/**
 * NOTES:
 * Ensemble names starting with a dollar sign must be either matched
 * exactly, or dropped. They also must be exempt from the quantizer
 * token, because their name implies a quantity in itsself.
 */
public final class PartEnsembleTypes {

    // -----------------
    // GENERIC ENSEMBLES
    // -----------------
    public static const WOODWINDS:Array = [
        PartNames.PICCOLO,
        PartNames.RECORDER,
        PartNames.FLUTE,
        PartNames.OBOE,
        PartNames.ENGLISH_HORN,
        PartNames.CLARINET,
        PartNames.FRENCH_HORNS,
        PartNames.BASSOON
    ];

    public static const STRINGS:Array = [
        PartNames.VIOLIN,
        PartNames.VIOLA,
        PartNames.CELLO,
        PartNames.CONTRABASS
    ];

    public static const BRASS:Array = [
        PartNames.TRUMPET,
        PartNames.FRENCH_HORNS,
        PartNames.TROMBONE,
        PartNames.TUBA
    ];

    public static const PERCUSSION:Array = [
        PartNames.VIBRAPHONE,
        PartNames.MARIMBA,
        PartNames.GLOCKENSPIEL,
        PartNames.XYLOPHONE,
        PartNames.TUBULAR_BELLS
    ];

    // -------------------------------
    // GENERIC UNQUANTIZABLE ENSEMBLES
    // -------------------------------
    public static const ORCHESTRA$:Array = [
        PartNames.PICCOLO,
        PartNames.FLUTE,
        PartNames.OBOE,
        PartNames.ENGLISH_HORN,
        PartNames.CLARINET,
        PartNames.BASSOON,
        PartNames.FRENCH_HORNS,
        PartNames.TRUMPET,
        PartNames.TROMBONE,
        PartNames.TUBA,
        PartNames.HARP,
        PartNames.PIANO,
        PartNames.HARPSICHORD,
        PartNames.ORGAN,
        PartFamilies.ciacob::OTHER_INSTRUMENTS,
        PartNames.VIOLIN,
        PartNames.VIOLA,
        PartNames.CELLO,
        PartNames.CONTRABASS
    ];

    public static const BAND$:Array = [
        PartNames.FLUTE,
        PartNames.OBOE,
        PartNames.BASSOON,
        PartNames.CLARINET,
        PartNames.TRUMPET,
        PartNames.FRENCH_HORNS,
        PartNames.TROMBONE,
        PartNames.TUBA,
        PartFamilies.ciacob::OTHER_INSTRUMENTS
    ];

    // ------------------
    // SPECIFIC ENSEMBLES
    // ------------------

    public static const $VIOLIN_AND_PIANO_DUO:Array = [
        PartNames.VIOLIN,
        PartNames.PIANO
    ];

    public static const $CELLO_AND_PIANO_DUO:Array = [
        PartNames.CELLO,
        PartNames.PIANO
    ];

    public static const $FLUTE_AND_PIANO_DUO:Array = [
        PartNames.FLUTE,
        PartNames.PIANO
    ];

    public static const $STRING_TRIO:Array = [
        PartNames.VIOLIN,
        PartNames.VIOLA,
        PartNames.CELLO
    ];

    public static const $PIANO_TRIO:Array = [
        PartNames.VIOLIN,
        PartNames.CELLO,
        PartNames.PIANO
    ];

    public static const $STRING_QUARTET:Array = [
        PartNames.VIOLIN,
        PartNames.VIOLIN,
        PartNames.VIOLA,
        PartNames.CELLO,
    ];

    public static const $DOUBLE_STRING_QUARTET:Array = [
        PartNames.VIOLIN,
        PartNames.VIOLIN,
        PartNames.VIOLIN,
        PartNames.VIOLIN,
        PartNames.VIOLA,
        PartNames.VIOLA,
        PartNames.CELLO,
        PartNames.CELLO,
    ];

    public static const $PIANO_QUARTET:Array = [
        PartNames.VIOLIN,
        PartNames.VIOLA,
        PartNames.CELLO,
        PartNames.PIANO
    ];

    public static const $STRING_QUINTET:Array = [
        PartNames.VIOLIN,
        PartNames.VIOLIN,
        PartNames.VIOLA,
        PartNames.VIOLA,
        PartNames.CELLO,
    ];

    public static const $PIANO_QUINTET:Array = [
        PartNames.VIOLIN,
        PartNames.VIOLIN,
        PartNames.VIOLA,
        PartNames.CELLO,
        PartNames.PIANO
    ];

    public static const $BRASS_QUINTET:Array = [
        PartNames.TRUMPET,
        PartNames.TRUMPET,
        PartNames.TROMBONE,
        PartNames.FRENCH_HORNS,
        PartNames.TUBA
    ];

    public static const $WOODWIND_QUINTET:Array = [
        PartNames.FLUTE,
        PartNames.OBOE,
        PartNames.CLARINET,
        PartNames.FRENCH_HORNS,
        PartNames.BASSOON
    ];

    public static const $STRING_SEXTET:Array = [
        PartNames.VIOLIN,
        PartNames.VIOLIN,
        PartNames.VIOLA,
        PartNames.VIOLA,
        PartNames.CELLO,
        PartNames.CELLO
    ];

    public static const $WIND_SEPTET:Array = [
        PartNames.VIOLIN,
        PartNames.VIOLA,
        PartNames.CLARINET,
        PartNames.FRENCH_HORNS,
        PartNames.BASSOON,
        PartNames.CELLO,
        PartNames.CONTRABASS
    ];

    public static const $OCTET:Array = [
        PartNames.CLARINET,
        PartNames.FRENCH_HORNS,
        PartNames.BASSOON,
        PartNames.VIOLIN,
        PartNames.VIOLIN,
        PartNames.VIOLA,
        PartNames.CELLO,
        PartNames.CONTRABASS
    ];

    private static var _allEnsembles:Array;

    public static function getAllEnsembles():Array {
        if (_allEnsembles == null) {
            _allEnsembles = ConstantUtils.getAllNames(PartEnsembleTypes);
        }
        return _allEnsembles;
    }
}
}
