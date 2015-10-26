use <fingerboard.scad>;
use <frets.scad>;
include <config.scad>;

module halfFingerboardFrets() {
    translate([0, -fretWidth / 2 - nutWidth, 0])
        halfFingerboard(maxFingerboardWidth / 2, fingerboardLength,
                        fingerboardDepth, fingerboardSlopeRadius);
    translate([0, 0, fingerboardDepth])
        frets(numberOfFrets, scaleLength, maxFretLength / 2, fretWidth,
              fretDepth);
}

module halfFingerboardFretsShaped() {
    intersection() {
        halfFingerboardFrets(maxFingerboardWidth, fingerboardLength,
                fingerboardDepth, fingerboardSlopeRadius, numberOfFrets,
                scaleLength,  maxFretLength, fretWidth, fretDepth);
        translate([0, -fretWidth / 2 - nutWidth, 0])
            linear_extrude(fingerboardDepth + fretDepth)
                polygon([[0, 0],
                         [0, fingerboardLength],
                         [neckWidthWide / 2, fingerboardLength],
                         [neckWidthNarrow / 2, 0]]);
    }
}

module halfFingerboardFretsShapedFiled() {
    fileHeight = fretDepth / cos(fretFileAngle);
    fileDepth = 10;

    widthDiff = neckWidthWide - neckWidthNarrow;
    taperAngle = -asin(0.5 * widthDiff / fingerboardLength);
    difference() {
        halfFingerboardFretsShaped(maxFingerboardWidth, fingerboardLength,
            fingerboardDepth, fingerboardSlopeRadius, numberOfFrets,
            scaleLength, maxFretLength, fretWidth, fretDepth, neckWidthNarrow,
            neckWidthWide);
        translate([neckWidthNarrow / 2, -fretWidth / 2 - nutWidth, fingerboardDepth])
            rotate([0, -fretFileAngle, taperAngle])
            cube([fileDepth, fingerboardLength, fileHeight]);
    }
}

module fingerboardFretsShapedFiled() {
    halfFingerboardFretsShapedFiled();
    mirror([1, 0, 0])
        halfFingerboardFretsShapedFiled();
}

fingerboardFretsShapedFiled();
