include <config.scad>;
use <plates.scad>;

module heelBlock() {
    intersection() {
        translate([-heelBlockWidth / 2, bodyTop[1] - heelBlockDepth, 0])
            cube([heelBlockWidth, heelBlockDepth, sideDepth]);
        plate(sideDepth);
    }
}
heelBlock();
