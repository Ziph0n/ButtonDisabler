include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = ButtonDisabler
ButtonDisabler_FILES = ButtonDisablerRootListController.m
ButtonDisabler_INSTALL_PATH = /Library/PreferenceBundles
ButtonDisabler_FRAMEWORKS = UIKit Social
ButtonDisabler_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/ButtonDisabler.plist$(ECHO_END)
