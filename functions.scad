function fretDistance(fret, scaleLength) =
    scaleLength - scaleLength / pow(2, fret / 12);

function lerp(a, b, x) =
    a + (b - a) * x;
