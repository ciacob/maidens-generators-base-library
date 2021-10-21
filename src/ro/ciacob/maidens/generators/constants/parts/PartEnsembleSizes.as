package ro.ciacob.maidens.generators.constants.parts {
import ro.ciacob.utils.ConstantUtils;

/**
 * NOTE: the position of the "$" char indicates whether the quantizer name should be
 * appended or prepended, e.g., "SOLO$" would produce <instrument name> Solo, such as
 * "Piano Solo".
 */
public final class PartEnsembleSizes {
    public static const SOLO$:int = 1;
    public static const DUO$:int = 2;
    public static const TRIO$:int = 3;
    public static const QUARTET$:int = 4;
    public static const QUINTET$:int = 5;
    public static const SEXTET$:int = 6;
    public static const SEPTET$:int = 7;
    public static const OCTET$:int = 8;
    public static const NONET$:int = 9;
    public static const $CHAMBER:int = 10;

    private static var _allNames:Array;

    public static function getAllNames():Array {
        if (_allNames == null) {
            _allNames = ConstantUtils.getAllNames(PartEnsembleSizes);
            _allNames.sort(_compareBySize);
        }
        return _allNames;
    }

    /**
     * Produces a name, based on a given size, i.e., "$Trio" for `3`.
     * The position of the "$" char suggests whether the returned name should be
     * pre-pended or appended.
     *
     *
     * @param    size
     *            A size to find a name for.
     *
     * @return    The resulting name.
     */
    public static function getNameBySize(size:int):String {
        var allNames:Array = getAllNames().concat();
        allNames.reverse();
        for (var i:int = 0; i < allNames.length; i++) {
            var aName:String = (allNames[i] as String);
            var aSize:int = (PartEnsembleSizes[aName] as int);
            if (size >= aSize) {
                return aName;
            }
        }
        return null;
    }

    private static function _compareBySize(nameA:String, nameB:String):int {
        var sizeA:int = (PartEnsembleSizes[nameA] as int);
        var sizeB:int = (PartEnsembleSizes[nameB] as int);
        return (sizeA - sizeB);
    }
}
}
