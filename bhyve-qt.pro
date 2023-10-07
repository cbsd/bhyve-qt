##
## Bhyve-Qt - A front-end for bhyve emulator
##

message("Generating Makefile for Bhyve-Qt... $$escape_expand(\\n)")

#QT += core gui widgets network core5compat
QT += core gui widgets network
message("Building with Qt v$$QT_VERSION")

lessThan(QT_MAJOR_VERSION, 5) {
    warning(" >>> You're trying to build with Qt 4")
    warning(" >>> This version of Bhyve-Qt requires Qt 5")
    warning(" >>> You might need to use qmake-qt5 instead $$escape_expand(\\n)")

    error("Aborting!")
}

# SOURCE_DATE_EPOCH is read from environment, to enable reproducible builds in Debian
source_date_epoch = $$(SOURCE_DATE_EPOCH)
!isEmpty(source_date_epoch) {
    message("Creating a reproducible build (avoiding hardcoded timestamps) \
             because SOURCE_DATE_EPOCH is defined: $$(SOURCE_DATE_EPOCH)")
    DEFINES += REPRODUCIBLEBUILD
}


TARGET = bhyve-qt

TEMPLATE = app

CONFIG += c++14

DEFINES += QT_DEPRECATED_WARNINGS

SOURCES +=  src/main.cpp\
            src/components/customfilter.cpp \
            src/mainwindow.cpp \
            src/helpwidget.cpp \
            src/aboutwidget.cpp \
            src/configwindow.cpp \
            src/machinewizard.cpp \
            src/machine.cpp \
            src/newmachine/machinepage.cpp \
            src/utils/systemutils.cpp \
            src/newmachine/generalpage.cpp \
            src/newmachine/hardwarepage.cpp \
            src/newmachine/acceleratorpage.cpp \
            src/newmachine/memorypage.cpp \
            src/newmachine/diskpage.cpp \
            src/newmachine/conclusionpage.cpp \
            src/machineconfig/machineconfigwindow.cpp \
            src/utils/logger.cpp \
            src/machineutils.cpp \
            src/machineconfig/machineconfiggeneral.cpp \
            src/machineconfig/machineconfighardware.cpp \
            src/machineconfig/machineconfigboot.cpp \
            src/machineconfig/machineconfigmedia.cpp \
            src/machineconfig/machineconfignetwork.cpp \
            src/machineconfig/machineconfigaudio.cpp \
            src/machineconfig/machineconfigaccel.cpp \
            src/utils/newdiskwizard.cpp \
            src/qemu.cpp \
            src/machineconfig/machineconfiggeneraltabs.cpp \
            src/machineconfig/machineconfighardwaretabs.cpp \
            src/utils/firstrunwizard.cpp \
            src/boot.cpp \
            src/media.cpp \
            src/export-import/export.cpp \
            src/export-import/exportgeneralpage.cpp \
            src/export-import/exportmediapage.cpp \
            src/export-import/import.cpp \
            src/export-import/importgeneralpage.cpp \
            src/export-import/importdestinationpage.cpp \
            src/export-import/exportdetailspage.cpp \
            src/export-import/importdetailspage.cpp \
            src/export-import/importmediapage.cpp

HEADERS  += src/mainwindow.h \
            src/components/customfilter.h \
            src/helpwidget.h \
            src/aboutwidget.h \
            src/configwindow.h \
            src/machinewizard.h \
            src/machine.h \
            src/utils/systemutils.h \
            src/newmachine/generalpage.h \
            src/newmachine/machinepage.h \
            src/newmachine/hardwarepage.h \
            src/newmachine/acceleratorpage.h \
            src/newmachine/memorypage.h \
            src/newmachine/diskpage.h \
            src/newmachine/conclusionpage.h \
            src/machineconfig/machineconfigwindow.h \
            src/utils/logger.h \
            src/machineutils.h \
            src/machineconfig/machineconfiggeneral.h \
            src/machineconfig/machineconfighardware.h \
            src/machineconfig/machineconfigboot.h \
            src/machineconfig/machineconfigmedia.h \
            src/machineconfig/machineconfignetwork.h \
            src/machineconfig/machineconfigaudio.h \
            src/machineconfig/machineconfigaccel.h \
            src/utils/newdiskwizard.h \
            src/qemu.h \
            src/machineconfig/machineconfiggeneraltabs.h \
            src/machineconfig/machineconfighardwaretabs.h \
            src/utils/firstrunwizard.h \
            src/boot.h \
            src/media.h \
            src/export-import/export.h \
            src/export-import/exportgeneralpage.h \
            src/export-import/exportmediapage.h \
            src/export-import/import.h \
            src/export-import/importgeneralpage.h \
            src/export-import/importdestinationpage.h \
            src/export-import/exportdetailspage.h \
            src/export-import/importdetailspage.h \
            src/export-import/importmediapage.h

OTHER_FILES += \
    CHANGELOG \
    LICENSE \
    bhyve-qt.desktop \
    README \
    translations

RESOURCES += bhyve-qt.qrc

RC_ICONS += bhyve-qt.ico
