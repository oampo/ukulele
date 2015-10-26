use <functions.scad>;
include <config.scad>;

module frets(numberOfFrets, scaleLength, maxFretLength, fretWidth, fretDepth, $fn=100) {
    for (i=[0:numberOfFrets]) {
        translate([0, fretDistance(i, scaleLength) - fretWidth / 2, 0])
            fretRound(maxFretLength, fretWidth, fretDepth, $fn);
    }
}

module fretSquare(length, width, depth) {
    cube([length, width, depth]);
}

module fretRound(length, width, depth, $fn=100) {
    intersection() {
        rotate([0, 90, 0])
            translate([0, width / 2, 0])
                resize([depth * 2, width, length])
                    cylinder(1, r=1, false, $fn=$fn);
        cube(length, width, depth);
    }
}

frets(numberOfFrets, scaleLength, maxFretLength, fretWidth, fretDepth);
