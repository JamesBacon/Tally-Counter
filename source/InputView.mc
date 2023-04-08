//
// Copyright 2015-2021 by Garmin Ltd. or its subsidiaries.
// Subject to Garmin SDK License Agreement and Wearables
// Application Developer Agreement.
//

import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

//! Displays information about which behavior / input events are triggered
class InputView extends WatchUi.View {

    private var _stroke;

    //! Constructor
    public function initialize() {
        View.initialize();
        _stroke = 0;
    }

    //! Update the view
    //! @param dc Device Context
    public function onUpdate(dc as Dc) as Void {
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();

        var dy = dc.getFontHeight(Graphics.FONT_SMALL);
        var x = dc.getWidth() / 2;
        var y = dc.getHeight() / 2;
        y -= (4 * dy) / 2;

        dc.drawText(x, y, Graphics.FONT_NUMBER_HOT, _stroke, Graphics.TEXT_JUSTIFY_CENTER);
    }

    // Set the stroke
    public function setStroke(stroke) as Void {
        _stroke = stroke;
        WatchUi.requestUpdate();
    }
}
