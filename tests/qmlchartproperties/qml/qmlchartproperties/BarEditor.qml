/****************************************************************************
**
** Copyright (C) 2012 Digia Plc
** All rights reserved.
** For any questions to Digia, please use contact form at http://qt.digia.com
**
** This file is part of the Qt Commercial Charts Add-on.
**
** $QT_BEGIN_LICENSE$
** Licensees holding valid Qt Commercial licenses may use this file in
** accordance with the Qt Commercial License Agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and Digia.
**
** If you have questions regarding the use of this file, please use
** contact form at http://qt.digia.com
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 1.0
import QtCommercial.Chart 1.0

Flow {
    id: flow
    spacing: 5
    flow: Flow.TopToBottom
    property variant series

    onSeriesChanged: {
        if (series && series.name == "bar") {
            seriesConnections.target = series;
            setConnections.target = series.at(0);
        } else {
            seriesConnections.target = null;
            setConnections.target = null;
        }
    }

    Connections {
        id: seriesConnections
        target: null
        onNameChanged:              console.log("series.onNameChanged: " + series.name);
        onVisibleChanged:           console.log("series.onVisibleChanged: " + series.visible);
        onLabelsVisibleChanged:     console.log("series.onLabelsVisibleChanged: " + series.labelsVisible);
        onCountChanged:             console.log("series.onCountChanged: " + count);
    }

    Connections {
        id: setConnections
        target: null
        onColorChanged:             console.log("series.onColorChanged: " + color);
        onBorderColorChanged:       console.log("series.onBorderColorChanged: " + color);
        onLabelColorChanged:        console.log("series.onLabelColorChanged: " + color);
        onCountChanged:             console.log("series.onCountChanged: " + count);
    }

    Button {
        text: "visible"
        onClicked: series.visible = !series.visible;
    }
    Button {
        text: "labels visible"
        onClicked: series.labelsVisible = !series.labelsVisible;
    }
    Button {
        text: "bar width +"
        onClicked: series.barWidth += 0.1;
    }
    Button {
        text: "bar width -"
        onClicked: series.barWidth -= 0.1;
    }
    Button {
        text: "set 1 color"
        onClicked: series.at(0).color = main.nextColor();
    }
    Button {
        text: "set 1 border color"
        onClicked: series.at(0).borderColor = main.nextColor();
    }
    Button {
        text: "set 1 label color"
        onClicked: series.at(0).labelColor = main.nextColor();
    }
    Button {
        text: "set 1 font size +"
        onClicked: series.at(0).labelFont.pixelSize += 1;
    }
    Button {
        text: "set 1 font size -"
        onClicked: series.at(0).labelFont.pixelSize -= 1;
    }
}
