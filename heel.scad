use <list-comprehension-demos/sweep.scad>;
use <scad-utils/transformations.scad>;
use <scad-utils/shapes.scad>;
use <functions.scad>

function heelScalingX(t, narrow, wide) =
    lerp(narrow, wide, t);

function heelScalingY(t, short, long, power) =
    lerp(short, long, pow(t, power));

function heelTranslation(t, depth) =
    [0, 0, t * depth];

function heelScaling(t, tB, narrow, wide, short, long, power) =
    [heelScalingX(t, narrow, wide),
     heelScalingY(tB, short, long, power),
     0];

module heel(widthHeel, widthNeck, depthNeck, depth, length,
            scalingPower=5,
            $fn=100) {
    transforms = [
        for (i=[0:depth/$fn:depth])
            let (t=i/depth, tB=i/(depth - depthNeck))

            translation(
                heelTranslation(t, depth)
            ) *
            scaling(
                heelScaling(t, tB,
                            widthHeel/2, widthNeck/2,
                            widthHeel/2, length,
                            scalingPower)
            )
    ];


    tBMax = depth/(depth-depthNeck);
    lengthMax = heelScalingY(tBMax, widthHeel/2, length, scalingPower);

    intersection() {
        sweep(circle(1), transforms);
        translate([-widthNeck / 2, 0, 0])
            cube([widthNeck, lengthMax, depth]);
    }
}


