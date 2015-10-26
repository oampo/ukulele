include <config.scad>;

module halfNut() {
    translate([0.5 * stringSpacing + pinRadius, 0, 0])
        cylinder(pinHeight, r=pinRadius, center=true);
    translate([1.5 * stringSpacing + pinRadius, 0, 0])
        cylinder(pinHeight, r=pinRadius, center=true);
}

module nut() {
    halfNut(pinHeight, pinRadius, stringSpacing);
    mirror([1, 0, 0])
        halfNut(pinHeight, pinRadius, stringSpacing);
}

nut(pinHeight, pinRadius, stringSpacing);
