use <functions.scad>;
use <neck.scad>;
use <heel.scad>;
include <config.scad>;

module neckHeel(neckWidthNarrow, neckWidthWide, heelWidth,
                neckDepthNarrow, neckDepthWide,
                bodyDepth, length, heelLength, $fn=100) {
    translate([0, 0, bodyDepth - neckDepthWide])
        neck(neckWidthNarrow, neckWidthWide, neckDepthNarrow, neckDepthWide, length,         $fn=$fn);

    heelNeckDepth = lerp(neckDepthWide, neckDepthNarrow, heelLength / length);
    translate([0, length, 0])
        mirror([0, 1, 0])
            heel(heelWidth, neckWidthWide, heelNeckDepth, bodyDepth, heelLength);
}

neckHeel(neckWidthNarrow, neckWidthWide, heelWidth,
         neckDepthNarrow, neckDepthWide,
         bodyDepth, fingerboardLength, heelLength);
