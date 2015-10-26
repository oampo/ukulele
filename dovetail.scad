include <config.scad>;

module dovetail(width, height, depth, offset, taper) {
    linear_extrude(offset, scale=[taper, taper])
        difference() {
            offset(r=offset) {
                polygon([[-width / (2 * taper) + offset, 0],
                         [0, height / taper - offset], [width/ (2 * taper) - offset, 0]]);
            };
            // Doubled offset removes (rounding?) artifact
            translate([-width / 2, 0, 0])
                scale([width, 2 * offset, 1])
                    mirror([0, 1, 0])
                        square(1);
        }
}

dovetail(heelDovetailWidth, heelDovetailHeight, heelDovetailDepth,
         heelDovetailOffset, 1.1);
