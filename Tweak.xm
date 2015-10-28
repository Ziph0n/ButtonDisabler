NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.ziph0n.buttondisabler.plist"];
BOOL enabled = [[prefs objectForKey:@"enabled"] boolValue];
BOOL lockbutton = [[prefs objectForKey:@"lockbutton"] boolValue];
BOOL ringerswitch = [[prefs objectForKey:@"ringerswitch"] boolValue];
BOOL volumeboth = [[prefs objectForKey:@"volumeboth"] boolValue];
BOOL volumeup = [[prefs objectForKey:@"volumeup"] boolValue];
BOOL volumedown = [[prefs objectForKey:@"volumedown"] boolValue];
BOOL headsetmiddle = [[prefs objectForKey:@"headsetmiddle"] boolValue];
BOOL headsetmiddlesimpleclick = [[prefs objectForKey:@"headsetmiddlesimpleclick"] boolValue];
BOOL headsetmiddledoubleclick = [[prefs objectForKey:@"headsetmiddledoubleclick"] boolValue];
BOOL headsetmiddletripleclick = [[prefs objectForKey:@"headsetmiddletripleclick"] boolValue];
BOOL headsetmiddlelongclick = [[prefs objectForKey:@"headsetmiddlelongclick"] boolValue];
BOOL homebutton = [[prefs objectForKey:@"homebutton"] boolValue];
BOOL homebuttonnotls = [[prefs objectForKey:@"homebuttonnotls"] boolValue];

%hook SpringBoard

- (void)_lockButtonUp:(struct __IOHIDEvent *)arg1 fromSource:(int)arg2 { //disable the lock button
	
	if (enabled) {
		if (lockbutton) {
		} else {
			%orig;
		}
	} else {
		%orig;
	}
}

- (void)_lockButtonDown:(struct __IOHIDEvent *)arg1 fromSource:(int)arg2 { //disable the lock button
	
	if (enabled) {
		if (lockbutton) {
		} else {
			%orig;
		}
	} else {
		%orig;
	}
}

- (void)_ringerChanged:(struct __IOHIDEvent *)arg1 { //disable the ringer switch
	
	if (enabled) {
		if (ringerswitch) {
		} else {
			%orig;
		}
	} else {
		%orig;
	}
}

- (_Bool)_volumeChanged:(struct __IOHIDEvent *)arg1 { //disable volume buttons (both)

	if (enabled) {
		if (volumeboth) {
			return FALSE;
		} else {
			return %orig;
		}
	} else {
		return %orig;
	}
}

- (void)_headsetButtonUp:(struct __IOHIDEvent *)arg1 { //disable headset middle button

	if (enabled) {
		if (headsetmiddle) {
		} else {
			%orig;
		}
	} else {
		%orig;
	}
}

- (void)_headsetButtonDown:(struct __IOHIDEvent *)arg1 { //disable headset middle button (all actons)

	if (enabled) {
		if (headsetmiddle) {
		} else {
			%orig;
		}
	} else {
		%orig;
	}
}

- (void)_menuButtonUp:(struct __IOHIDEvent *)arg1 { //disable home button (everywhere)

	if (enabled) {
		if (homebutton) {
		} else {
			%orig;
		}
	} else {
		%orig;
	}
}

- (void)_menuButtonDown:(struct __IOHIDEvent *)arg1 { //disable home button (everywhere)

	if (enabled) {
		if (homebutton) {
		} else {
			%orig;
		}
	} else {
		%orig;
	}
}

- (void)_setMenuButtonTimer:(id)arg1 { //disable home button (not on ls)

	if (enabled) {
		if (homebuttonnotls) {
		} else {
			%orig;
		}
	} else {
		%orig;
	}
}

- (void)_menuButtonWasHeld { //disable home button (not on ls)

	if (enabled) {
		if (homebuttonnotls) {
		} else {
			%orig;
		}
	} else {
		%orig;
	}
}

%end

%hook VolumeControl

- (void)increaseVolume { //disable volume up button
	
	if (enabled) {
		if (volumeup) {
		} else {
			%orig;
		}
	} else {
		%orig;
	}
}

- (void)decreaseVolume { //disable volume down button

	if (enabled) {
		if (volumedown) {
		} else {
			%orig;
		}
	} else {
		%orig;
	}
}

%end

%hook UIApplication

- (void)_handleHeadsetButtonClick { //disable headset middle button (simple click)

	if (enabled) {
		if (headsetmiddlesimpleclick) {
		} else {
			%orig;
		}
	} else {
		%orig;
	}
}

- (void)_handleHeadsetButtonDoubleClick { //disable headset middle button (double click)

	if (enabled) {
		if (headsetmiddledoubleclick) {
		} else {
			%orig;
		}
	} else {
		%orig;
	}
}

- (void)_handleHeadsetButtonTripleClick { //disable headset middle button (triple click)

	if (enabled) {
		if (headsetmiddletripleclick) {
		} else {
			%orig;
		}
	} else {
		%orig;
	}
}

%end

%hook SBVoiceControlController

- (void)handleHeadsetButtonDownWithClickCount:(unsigned long long)arg1 { //disable headset middle button (long click - siri)
	
	if (enabled) {
		if (headsetmiddlelongclick) {
		} else {
			%orig;
		}
	} else {
		%orig;
	}
}
%end