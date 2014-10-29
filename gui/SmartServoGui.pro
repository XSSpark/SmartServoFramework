#-------------------------------------------------
#
# Project created by QtCreator 2014-03-21T10:06:09
#
#-------------------------------------------------

TARGET      = SmartServoGui
TEMPLATE    = app
CONFIG     += qt
QT         += core gui widgets

DESTDIR     = build/
RCC_DIR     = build/
UI_DIR      = build/
MOC_DIR     = build/
OBJECTS_DIR = build/

# OS specifics build settings:
unix {
    *-g++* {
        message("Using GCC")
        QMAKE_CXXFLAGS += -pthread

        if: system("gcc -dumpversion | grep 4.[0-5]") {
            error("You need at least GCC 4.6+ to use C++11 features")
        } else: system("gcc -dumpversion | grep 4.6") {
            QMAKE_CXXFLAGS += -std=c++0x -Wno-unused-parameter
        } else: {
            QMAKE_CXXFLAGS += -std=c++11 -Wno-unused-parameter
        }
    }
    *clang* {
        message("Using Clang")
        QMAKE_CXXFLAGS += -std=c++11 -Wno-unused-parameter
    }
}
win32 {
    *-g++* {
        message("Using MinGW / Windows")
        QMAKE_CXXFLAGS += -pthread -std=c++11 -Wno-unused-parameter
    }
    *-msvc* {
        message("Using MSVC / Windows")
    }
}

# Smart Servo Framework sources
SOURCES    += ../src/*.cpp

# GUI application sources
SOURCES    += src/main.cpp src/mainwindow.cpp src/advancescanner.cpp src/qabout.cpp
HEADERS    += src/mainwindow.h src/advancescanner.h src/qabout.h

TRANSLATIONS = resources/lang/es.ts resources/lang/fr.ts resources/lang/it.ts

RESOURCES  += resources/resources.qrc

FORMS      += ui/mainwindow.ui \
              ui/advancescanner.ui \
              ui/qabout.ui