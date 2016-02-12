TEMPLATE = subdirs

deployment.files += qmldir \
                    0.1 \
                    icons \
                    fonts

deployment.path = $$[QT_INSTALL_QML]/quey/ui
INSTALLS += deployment

OTHER_FILES += $$deployment.files
