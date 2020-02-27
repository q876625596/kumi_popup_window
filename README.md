# ✨ kumi_popup_window

[![pub package](https://img.shields.io/pub/v/kumi_popup_window.svg)](https://pub.dev/packages/kumi_popup_window)

**[Language]** [English](README.md) | [中文文档](README_CN.md)

A simple and easy-to-use pop-up window. There are no flashy preset templates. Everything you want to pop up is customized by you.

**1.Install**

```yaml
dependencies:
  kumi_popup_window: ^1.0.0
```

**2.Import**

```dart
import 'package:kumi_popup_window/kumi_popup_window.dart';
```

**3.Use**
```dart
              //both sowPopupWindow and createPopupWindow
              showPopupWindow(
                context,
                gravity: KumiPopupGravity.rightBottom,
                bgColor: Colors.grey.withOpacity(0.5),
                clickOutDismiss: true,
                clickBackDismiss: true,
                customAnimation: false,
                customPop: false,
                customPage: false,
                //targetRenderBox: (btnKey.currentContext.findRenderObject() as RenderBox),
                underStatusBar: false,
                underAppBar: true,
                offsetX: 0,
                offsetY: 0,
                duration: Duration(milliseconds: 200),
                onShowStart: (pop) {
                  print("showStart");
                },
                onShowFinish: (pop) {
                  print("showFinish");
                },
                onDismissStart: (pop) {
                  print("dismissStart");
                },
                onDismissFinish: (pop) {
                  print("dismissFinish");
                },
                childFun: (pop) {
                  return Container(
                    key: GlobalKey(),
                    padding: EdgeInsets.all(10),
                    height: 100,
                    width: 100,
                    color: Colors.redAccent,
                  );
                },
              );

```

Brief description, see [here](lib/kumi_popup_window.dart) for details


params|description|default
--|--|--|
childFun|Method for customizing the content of the popup window. The returned widget will be used as the content of the popup window|null，(require)
gravity|Relative position of the pop-up window.|KumiPopupGravity.center
customAnimation|Custom popupWindow animation|false
customPop|Customize the position and animation of popupWindow|false
customPage|Customize the entire page, including Scaffold|false
bgColor|The color of the mask layer|Colors.black.withOpacity(0.5)
targetRenderBox|RenderBox of the target widget|null
underStatusBar|When the top pops up, is it below the statusBar|false
underAppBar|When the top pops up, is it below the AppBar|false
clickOutDismiss|Click outside the pop-up window to dismiss|true
clickBackDismiss|Click the physical back button to dismiss|true
offsetX|Offset at horizontal axis edge|0.0
offsetY|Offset at vertical axis edge|0.0
duration|Duration of the animation|Duration(milliseconds: 200)
onShowStart|When the popupWindow show animation start|null
onShowEnd|When the popupWindow show animation finish|null
onDismissStart|When the popupWindow dismiss animation start|null
onDismissEnd|When the popupWindow dismiss animation finish|null

property/method|description
--|--|
child|Popup window widget,Get its size and position by GlobalKey
controller|Animation Controller
show()|popup window show
dismiss()|popup window dismiss

## About

* QQ：876625596
* Email：876625596@qq.com
* Github：https://github.com/q876625596

## License

MIT License

Copyright (c) 2020 q876625596

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
