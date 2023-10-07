
 # Bhyve-Qt - A front-end written in Qt for the bhyve emulator

# General runtime dependencies

* Qt 5.10 or later
* CBSD

# Dependencies for building

  - Archlinux and Parabola (runtime deps include build-time deps):
    **qt5-base**

    **Build tools: gcc, make**

# Build process

From Bhyve-Qt's main directory, where bhyve-qt.pro is located, execute:

        mkdir build               # Create a clean directory for the build
        cd build                  # Go into it
        qmake ..                  # Ask Qmake to generate a Makefile[*]
        make                      # Run Make to compile the project

[*]you might need to use the command 'qmake-qt5' instead
