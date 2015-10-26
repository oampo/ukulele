include <config.scad>;

module halfFingerboard() {
    translate([0, fingerboardSlopeRadius, 0])
        cube([maxFingerboardWidth / 2,
              fingerboardLength - fingerboardSlopeRadius,
              fingerboardDepth]);
        cube([maxFingerboardWidth / 2,
              fingerboardLength,
              fingerboardDepth - fingerboardSlopeRadius]);
    translate([0, fingerboardSlopeRadius,
               fingerboardDepth - fingerboardSlopeRadius])
        rotate([0, 90, 0])
            cylinder(maxFingerboardWidth / 2, r=fingerboardSlopeRadius);
}

module fingerboard() {
    halfFingerboard();
    mirror([1, 0, 0])
        halfFingerboard();
}

fingerboard();


