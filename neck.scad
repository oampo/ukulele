use <list-comprehension-demos/sweep.scad>;
use <scad-utils/transformations.scad>;
use <scad-utils/shapes.scad>;
include <config.scad>;

module neck(widthNarrow, widthWide, depthNarrow, depthWide, length, $fn=100) {
    // http://www.algebra.com/algebra/homework/formulas/Geometric_formulas.faq.question.6681.html
    radiusNarrow = (pow(widthNarrow, 2) + 4 * pow(depthNarrow, 2)) / (8 * depthNarrow);
    radiusWide = (pow(widthWide, 2) + 4 * pow(depthWide, 2)) / (8 * depthWide);
    angle = asin((depthWide - depthNarrow) / 2 / length);

    hull() {
        translate([0, 0, depthWide - depthNarrow])
            rotate([90, 0, 0])
                mirror([0, 0, 1])
                intersection() {
                     translate([0, radiusNarrow, 0])
                       cylinder(0.01, r=radiusNarrow, $fn=$fn);
                     translate([-widthWide/2, 0, 0])
                        cube([widthWide, depthNarrow, 0.01]);
                }


        translate([0, length, 0])
            rotate([90, 0, 0])
                intersection() {
                     translate([0, radiusWide, 0])
                       cylinder(0.01, r=radiusWide, $fn=$fn);
                     translate([-widthWide/2, 0, 0])
                        cube([widthWide, depthWide, 0.01]);
                }
    }
}

neck(neckWidthNarrow, neckWidthWide, neckDepthNarrow, neckDepthWide, fingerboardLength);
