use <fingerboard.scad>;
use <nut.scad>;
include <config.scad>;

module fingerboardNut() {
    fingerboard();
    translate([0, nutWidth / 2, fingerboardDepth + pinHeight / 2])
        nut();
}

fingerboardNut();

