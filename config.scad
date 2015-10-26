use <functions.scad>;

$fn = 100;

// Body
// ----

// X, Y, Roundness
bodyTop = [0, 170, 40];
bodyBottom = [0, -60, 60];
lowerBout = [85, 0, 30];
upperBout = [65, 130, 30];
waist = [55, 80, 30];

bodyLength = [bodyTop[1] - bodyBottom[1]];
maxBodyWidth = [2 * lowerBout[2]];
bodyDepth = 50;

soundboardThickness = 1.8;
backThickness = 1.8;
sideThickness = 1.8;

sideDepth = bodyDepth - backThickness - soundboardThickness;

// Kerf
// ----

useKerf = true;
kerfWidth = 5;
kerfHeight = 10;

// Neck
// ----

neckWidthNarrow = 35;
neckWidthWide = 45;
neckDepthNarrow = 10;
neckDepthWide = 16;

// Heel
// ----

heelWidth = 10;
heelLength = 30;

// Heel Block
// ----------

heelBlockWidth = 30;
heelBlockDepth = 10;

// Heel Dovetail
// -------------

heelDovetailWidth = neckWidthWide - 20;
heelDovetailHeight = sideDepth + soundboardThickness - 10;
heelDovetailDepth = 10;
heelDovetailOffset = 5;
heelDovetailTaper = 1.1;

// Nut
// ---

nutWidth = 4;

pinHeight = 3;
pinRadius = 0.75;
stringSpacing = 9.525;

// Fingerboard
// -----------

scaleLength = 340;
numberOfFrets = 16;

fretWidth = 1.35;
fretDepth = 0.94;
maxFretLength = neckWidthWide;

fingerboardLength = fretDistance(numberOfFrets, scaleLength) + fretWidth + nutWidth;
maxFingerboardWidth = neckWidthWide;
fingerboardDepth = 6;

fingerboardSlopeRadius = 1;

fretFileAngle = 70;

// Beziers
// -------
topUpperBoutBezier = [
    [bodyTop[0], bodyTop[1]],
    [bodyBottom[0] + bodyTop[2], bodyTop[1]],
    [upperBout[0], upperBout[1] + upperBout[2]],
    [upperBout[0], upperBout[1]],
];

upperBoutWaistBezier = [
    [upperBout[0], upperBout[1]],
    [upperBout[0], upperBout[1] - upperBout[2]],
    [waist[0], waist[1] + waist[2]],
    [waist[0], waist[1]]
];

waistLowerBoutBezier = [
    [waist[0], waist[1]],
    [waist[0], waist[1] - waist[2]],
    [lowerBout[0], lowerBout[1] + lowerBout[2]],
    [lowerBout[0], lowerBout[1]]
];

lowerBoutBottomBezier = [
    [lowerBout[0], lowerBout[1]],
    [lowerBout[0], lowerBout[1] - lowerBout[2]],
    [bodyBottom[0] + bodyBottom[2], bodyBottom[1]],
    [bodyBottom[0], bodyBottom[1]]
];
