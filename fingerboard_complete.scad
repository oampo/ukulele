use <fingerboard_frets.scad>;
use <nut.scad>;
include <config.scad>;

module fingerboardComplete() {
    fingerboardFretsShapedFiled();
    translate([0, -fretWidth / 2 - nutWidth / 2, fingerboardDepth + pinHeight / 2])
        nut();
}

fingerboardComplete();
