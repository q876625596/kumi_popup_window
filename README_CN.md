# ✨ kumi_popup_window

[![pub package](https://img.shields.io/pub/v/kumi_popup_window.svg)](https://pub.dev/packages/kumi_popup_window)

**[语言切换]** [English](README.md) | [中文文档](README_CN.md)

一个简单易用的弹窗，没有花里胡哨的预设样板，麻雀虽小五脏俱全，想弹出什么全都由你自定义。

**1.获取**

```yaml
dependencies:
  kumi_popup_window: ^1.0.7
```

**2.导入**

```dart
import 'package:kumi_popup_window/kumi_popup_window.dart';
```

**3.使用**
```dart
//showPopupWindow 和 createPopupWindow 均可
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
  //childSize: null,
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
  onClickOut: (pop){
    print("onClickOut");
  },
  onClickBack: (pop){
    print("onClickBack");
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

**注意**
**数据更新请使用ValueNotifier，不要使用setState，用法可Baidu，Google，或者查看[示例](example/lib/main.dart)**

简要说明，详细说明请看[这里](lib/kumi_popup_window.dart)


参数|描述|默认值
--|--|--|
childFun|自定义弹出框内容的方法，返回的widget将作为弹出框内容|无默认，必填
gravity|弹出框的相对位置|KumiPopupGravity.center
customAnimation|自定义popupWindow的动画|false
customPop|自定义popupWindow的位置与动画|false
customPage|自定义整个页面，包括Scaffold|false
bgColor|遮罩层的颜色|Colors.black.withOpacity(0.5)
targetRenderBox|目标widget的RenderBox|null
underStatusBar|顶部弹出时，是否在statusBar下方|false
underAppBar|顶部弹出时，是否在AppBar下方|false
clickOutDismiss|点击弹出框以外的区域是否收起|true
clickBackDismiss|点击物理返回按钮是否收起|true
offsetX|横轴贴边处偏移量|0.0
offsetY|纵轴贴边处偏移量|0.0
duration|动画的时长|Duration(milliseconds: 200)
isShow|当前弹框是否已经显示|false
onShowStart|弹出动画开始的监听|null
onShowEnd|弹出动画结束的监听|null
onDismissStart|收起动画开始的监听|null
onDismissEnd|收起动画结束的监听|null
onClickOut|点击弹框以外的监听|null
onClickBack|点击物理返回按钮的监听|null

属性/方法|描述
--|--|
child|弹出框的widget,可通过GlobalKey获取其尺寸和位置
controller|动画控制器
show()|显示popup window
dismiss()|收起popup window

## 联系我

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

