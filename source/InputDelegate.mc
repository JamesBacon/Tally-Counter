//
// Copyright 2016-2021 by Garmin Ltd. or its subsidiaries.
// Subject to Garmin SDK License Agreement and Wearables
// Application Developer Agreement.
//

import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

//! Handles the behavior / input events
class InputDelegate extends WatchUi.BehaviorDelegate {

    private var _lastKey as Key?;
    private var _parentView as InputView;

    private var _stroke as Number?; // Creates the Stroke variable.

    //! Constructor
    //! @param view The InputView to operate on
    public function initialize(view as InputView) {
        BehaviorDelegate.initialize();

        _parentView = view;

        _stroke = 0; // Sets the Stroke to 0 when the app is launched.

    }

    // Handles the physical buttons on the watch being pressed.
    public function onKey(evt as KeyEvent) as Boolean {
        var key = evt.getKey();

        // When the Enter key is pressed, the Stroke variable is incremented by 1.
        // The Enter key is the Start/Stop button on the Forerunner 55.
        if (key == KEY_ENTER) {
            _stroke++;
            _parentView.setStroke(_stroke);
        }

        // Resets the Stroke to 0 when the Down key is pressed.
        if (key == KEY_DOWN) {
            _stroke = 0;
            _parentView.setStroke(_stroke);
        }

        if (key == KEY_ESC) { // Requires the user to press the Esc key twice to exit the app.
            if (_lastKey == KEY_ESC) {
                System.exit();
            }
        }

        _lastKey = key; // Saves the last key pressed.

        return true;
    }
}
