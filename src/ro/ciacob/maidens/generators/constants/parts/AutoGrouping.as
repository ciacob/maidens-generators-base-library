package ro.ciacob.maidens.generators.constants.parts {
public class AutoGrouping {
    public function AutoGrouping() {
    }

    /**
     * List of part families that are elligible for automatic grouping. These strings must match 1:1 with constant
     * names defined in class PartFamilies.
     */
    public static const ELLIGIBLE_FAMILIES : Array = [
        'BOWED_STRINGS',
        'BRASS',
        'WOODWINDS'
    ];

    /**
     * Returns `true` if given partName's family is in the list of families that are elligible for auto-grouping.
     */
    public static function isPartFamilyElligible(partName:String):Boolean {
        var family : String = PartFamilies.getPartFamily (partName);
        var isElligible : Boolean = (family && (ELLIGIBLE_FAMILIES.indexOf (family) != -1));
        return isElligible;
    }
}
}
