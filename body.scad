include <config.scad>;
use <plates.scad>;
use <kerf.scad>;
use <sides.scad>;
use <heel_block.scad>;
use <dovetail.scad>;

module body() {
    difference() {
        union() {
            plate(backThickness);
            translate([0, 0, backThickness])
                if (useKerf) kerf($fn=50);
            translate([0, 0, backThickness])
                sides();
            translate([0, 0, backThickness])
                heelBlock();
            translate([0, 0, backThickness + sideDepth])
                mirror([0, 0, 1])
                    if (useKerf) kerf($fn=50);
//            translate([0, 0, backThickness + sideDepth])
//                plate(soundboardThickness);
        }
        translate([0, bodyTop[1], bodyDepth])
            rotate([-90, 0, 180])
                dovetail(heelDovetailWidth, heelDovetailHeight,
                         heelDovetailDepth, heelDovetailOffset,
                         heelDovetailTaper);
    }
}


body();
