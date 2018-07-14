# wingpanel-indicator-periods
Life indicator for elementary OS
View how much has been used of a day, week, month, and year.

Builds upon the structure from https://github.com/PlugaruT/wingpanel-indicator-sys-monitor

# Building and Installation

You'll need the following dependencies:

libglib2.0-dev
libgee-0.8-dev
libgranite-dev
libgtk-3-dev
libwingpanel-2.0-dev
meson
valac

# Run meson to configure the build environment and then ninja to build

meson build --prefix=/usr
cd build
ninja

# To install, use ninja install

sudo ninja install

