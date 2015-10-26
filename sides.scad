include <config.scad>;
use <BezierScad/BezierScad.scad>;

module halfSides() {
    BezWall(topUpperBoutBezier, width=sideThickness, steps=32,
            height=sideDepth, showCtlR=0);

    BezWall(upperBoutWaistBezier, width=sideThickness, steps=32,
            height=sideDepth, showCtlR=0);

    BezWall(waistLowerBoutBezier, width=sideThickness, steps=32,
            height=sideDepth, showCtlR=0);

    BezWall(lowerBoutBottomBezier, width=sideThickness, steps=32,
            height=sideDepth, showCtlR=0);
}

module sides() {
    halfSides();
    mirror([1, 0, 0])
        halfSides();
}

sides();
