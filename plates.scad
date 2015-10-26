include <config.scad>;
use <BezierScad/BezierScad.scad>;

module halfPlate(thickness) {
    BezArc(topUpperBoutBezier, [0, 0], steps=32, heightCtls=[thickness],
           showCtlR=0);

    BezArc(upperBoutWaistBezier, [0, 0], steps=32, heightCtls=[thickness],
           showCtlR=0);

    BezArc(waistLowerBoutBezier, [0, 0], steps=32, heightCtls=[thickness],
           showCtlR=0);

    BezArc(lowerBoutBottomBezier, [0, 0], steps=32, heightCtls=[thickness],
           showCtlR=0);
}

module plate(thickness) {
    halfPlate(thickness);
        mirror([1, 0, 0])
            halfPlate(thickness);
}

