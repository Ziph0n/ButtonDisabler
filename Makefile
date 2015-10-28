export THEOS_DEVICE_IP=192.168.1.20

ARCHS = armv7 arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ButtonDisabler
ButtonDisabler_FILES = Tweak.xm
ButtonDisabler_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += buttondisabler
include $(THEOS_MAKE_PATH)/aggregate.mk
