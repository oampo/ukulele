include <config.scad>;
use <BezierScad/BezierScad.scad>;

module halfKerf() {
    sliceDepth = kerfHeight / $fn;
    sliceWidth = kerfWidth / $fn;
    for (i=[0:$fn]) {
        translate([0, 0, kerfHeight - i*sliceDepth])
            union() {
                BezWall(topUpperBoutBezier, width=i * sliceWidth, steps=32,
                        height=sliceDepth, showCtlR=0);
            BezWall(upperBoutWaistBezier, width=i * sliceWidth, steps=32,
                    height=sliceDepth, showCtlR=0);

            BezWall(waistLowerBoutBezier, width=i * sliceWidth, steps=32,
                    height=sliceDepth, showCtlR=0);

            BezWall(lowerBoutBottomBezier, width=i * sliceWidth, steps=32,
                    height=sliceDepth, showCtlR=0);
        }
    }
}


module kerf() {
    halfKerf();
    mirror([1, 0, 0])
        halfKerf();
}

kerf();
