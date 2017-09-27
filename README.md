[![Ada Version](https://img.shields.io/badge/ada-2012-02f88c.svg)](http://www.ada2012.org/)
[![GNAT Version](https://img.shields.io/badge/gnat-2017-015a71.svg)](http://libre.adacore.com/tools/gnat-gpl-edition/)
[![Build Status](https://travis-ci.org/rkoeninger/life.svg?branch=master)](https://travis-ci.org/rkoeninger/life)

# Life

Implementation of the classic zero-player simulation [Conway's Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life).

## Building

This isn't the only build approach that will work, but this is the way I've been doing it.

On Windows, you will need GNAT and GtkAda installed in adjacent directories. These are available for free for non-professional work from [AdaCore's website](http://libre.adacore.com/download/configurations#). Build using the [GPS IDE](http://libre.adacore.com/tools/gps/), which is part of GNAT.

On Debian/Ubuntu, dependencies can be installed using `apt` and the project can be built using `gprbuild`. See the [travis build script](blob/master/.travis.yml) for details.
