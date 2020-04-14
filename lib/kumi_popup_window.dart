import 'package:flutter/material.dart';

import 'PopRoute.dart';

KumiPopupWindow showPopupWindow<T>(
  BuildContext context, {
  Widget Function(KumiPopupWindow popup) childFun,
  KumiPopupGravity gravity,
  bool customAnimation,
  bool customPop,
  bool customPage,
  Color bgColor,
  RenderBox targetRenderBox,
  Size childSize,
  bool underStatusBar,
  bool underAppBar,
  bool clickOutDismiss,
  bool clickBackDismiss,
  double offsetX,
  double offsetY,
  Duration duration,
  Function(KumiPopupWindow popup) onShowStart,
  Function(KumiPopupWindow popup) onShowFinish,
  Function(KumiPopupWindow popup) onDismissStart,
  Function(KumiPopupWindow popup) onDismissFinish,
  Function(KumiPopupWindow popup) onClickOut,
  Function(KumiPopupWindow popup) onClickBack,
}) {
  var popup = KumiPopupWindow(
    gravity: gravity,
    customAnimation: customAnimation,
    customPop: customPop,
    customPage: customPage,
    bgColor: bgColor,
    childFun: childFun,
    targetRenderBox: targetRenderBox,
    childSize: childSize,
    underStatusBar: underStatusBar,
    underAppBar: underAppBar,
    clickOutDismiss: clickOutDismiss,
    clickBackDismiss: clickBackDismiss,
    offsetX: offsetX,
    offsetY: offsetY,
    duration: duration,
    onShowStart: onShowStart,
    onShowFinish: onShowFinish,
    onDismissStart: onDismissStart,
    onDismissFinish: onDismissFinish,
    onClickOut: onClickOut,
    onClickBack: onClickBack,
  );
  popup.show(context);
  return popup;
}

KumiPopupWindow createPopupWindow<T>(
  BuildContext context, {
  Widget Function(KumiPopupWindow popup) childFun,
  KumiPopupGravity gravity,
  bool customAnimation,
  bool customPop,
  bool customPage,
  Color bgColor,
  RenderBox targetRenderBox,
  Size childSize,
  bool underStatusBar,
  bool underAppBar,
  bool clickOutDismiss,
  bool clickBackDismiss,
  double offsetX,
  double offsetY,
  Duration duration,
  Function(KumiPopupWindow popup) onShowStart,
  Function(KumiPopupWindow popup) onShowFinish,
  Function(KumiPopupWindow popup) onDismissStart,
  Function(KumiPopupWindow popup) onDismissFinish,
  Function(KumiPopupWindow popup) onClickOut,
  Function(KumiPopupWindow popup) onClickBack,
}) {
  return KumiPopupWindow(
    gravity: gravity,
    customAnimation: customAnimation,
    customPop: customPop,
    customPage: customPage,
    bgColor: bgColor,
    childFun: childFun,
    targetRenderBox: targetRenderBox,
    childSize: childSize,
    underStatusBar: underStatusBar,
    underAppBar: underAppBar,
    clickOutDismiss: clickOutDismiss,
    clickBackDismiss: clickBackDismiss,
    offsetX: offsetX,
    offsetY: offsetY,
    duration: duration,
    onShowStart: onShowStart,
    onShowFinish: onShowFinish,
    onDismissStart: onDismissStart,
    onDismissFinish: onDismissFinish,
    onClickOut: onClickOut,
    onClickBack: onClickBack,
  );
}

// ignore: must_be_immutable
class KumiPopupWindow extends StatefulWidget {
  /// 自定义弹出框内容的方法，返回的widget将作为弹出框内容，然后赋值给[_child]
  /// 如果[_childSize] == null，那么当绘制完成以后，会将[_child]的尺寸赋值给[_childSize]
  /// Method for customizing the content of the popup window. The returned widget will be used as the content of the popup window, and then assigned to [_child]
  /// If [_childSize] == null, the size of [_child] will be assigned to [_childSize] when the drawing is completed
  final Widget Function(KumiPopupWindow popup) _childFun;

  ///弹出框的相对位置
  ///默认为 [KumiPopupGravity.center]
  /// 如果[_targetRenderBox] == null，那么此时弹出框的位置相对于屏幕，
  /// 如果[_targetRenderBox] != null，那么此时弹出框的位置相对于目标widget
  /// Relative position of the pop-up window.
  /// The default is [KumiPopupGravity.center]
  /// If [_targetRenderBox] == null, then the position of the pop-up window is relative to the screen.
  /// If [_targetRenderBox]! = Null, then the position of the popup window is relative to the target widget
  final KumiPopupGravity _gravity;

  /// 自定义popupWindow的动画
  /// 默认为false。
  /// 如果为true，那么此时默认动画无效，需要为[_childFun]返回的widget自定义动画
  /// Custom popupWindow animation
  ///The default is false.
  ///If true, then the default animation is invalid at this time, you need to customize the animation for the widget returned by [_childFun]
  final bool _customAnimation;

  ///自定义popupWindow的位置与动画
  /// 默认为false。
  /// 如果为true，那么此时[_gravity]和默认动画均无效，需要为[_childFun]返回的widget自定义位置与动画
  /// Customize the position and animation of popupWindow
  ///The default is false.
  ///If true, then both [_gravity] and the default animation are invalid. You need to customize the position and animation for the widget returned by [_childFun]
  final bool _customPop;

  /// 自定义整个页面，包括[Scaffold]
  /// 默认为false。
  /// 如果为true，需要为[_childFun]返回的widget自定义整个页面
  /// Customize the entire page, including [Scaffold]
  ///The default is false.
  ///If true, you need to customize the entire page for the widget returned by [_childFun]
  final bool _customPage;

  ///遮罩层的颜色
  ///默认为[Colors.black].withOpacity(0.5)
  ///The color of the mask layer
  ///The default is [Colors.black].withOpacity(0.5)
  final Color _bgColor;

  ///目标widget的[RenderBox]
  ///默认为null
  ///通过该属性获取目标widget的位置与尺寸
  ///具体看[_gravity]的说明
  ///[RenderBox] of the target widget
  ///The default is  null
  ///Get the position and size of the target widget through this property
  ///See the description of [_gravity]
  final RenderBox _targetRenderBox;

  ///顶部弹出时，是否在statusBar下方
  ///默认为false
  ///When the top pops up, is it below the statusBar
  ///The default is false
  final bool _underStatusBar;

  ///顶部弹出时，是否在AppBar下方
  ///默认为false
  ///When the top pops up, is it below the AppBar
  ///The default is false
  final bool _underAppBar;

  ///点击弹出框以外的区域是否收起
  ///默认为true
  ///Click outside the pop-up window to dismiss
  ///The default is true
  final bool _clickOutDismiss;

  ///点击物理返回按钮是否收起
  ///默认为true
  ///Click the physical back button to dismiss
  ///The default is true
  final bool _clickBackDismiss;

  ///横轴贴边处偏移量
  ///默认为0.0
  /// 如果 [_offsetX] > 0，向右偏移
  /// 如果 [_offsetX] < 0，向左偏移
  ///Offset at horizontal axis edge
  ///The default is 0.0
  ///If [_offsetX] > 0, offset to the right
  ///If [_offsetX] < 0, offset to the left
  final double _offsetX;

  ///纵轴贴边处偏移量
  ///默认为0.0
  /// 如果 [_offsetY] > 0，向下偏移
  /// 如果 [_offsetY] < 0，向上偏移
  ///Offset at vertical axis edge
  ///The default is 0.0
  ///If [_offsetY] > 0, offset to the down
  ///If [_offsetY] < 0, offset to the up
  final double _offsetY;

  ///动画的时长
  ///默认为 200ms
  ///Duration of the animation
  ///The default is 200ms
  final Duration _duration;

  ///弹出动画开始的监听
  /// When the popupWindow show animation start
  final Function(KumiPopupWindow popup) _onShowStart;

  ///弹出动画结束的监听
  /// When the popupWindow show animation finish
  final Function(KumiPopupWindow popup) _onShowEnd;

  ///收起动画开始的监听
  /// When the popupWindow dismiss animation start
  final Function(KumiPopupWindow popup) _onDismissStart;

  ///收起动画结束的监听
  /// When the popupWindow dismiss animation finish
  final Function(KumiPopupWindow popup) _onDismissEnd;

  ///点击弹框以外的监听
  ///只有当[_clickOutDismiss] == false 才有效
  /// Click on the listener outside the popup
  /// Only works when [_clickOutDismiss] == false
  final Function(KumiPopupWindow popup) _onClickOut;

  ///点击物理返回按钮的监听
  ///只有当[_clickBackDismiss] == false 才有效
  /// Listening on clicking the physical back button
  /// Only works when [_clickBackDismiss] == false
  final Function(KumiPopupWindow popup) _onClickBack;

  ///弹出框的尺寸
  ///如果为null，那么将在绘制完成之后计算并赋值
  /// PopupWindow  size
  /// If null, it will be calculated and assigned after drawing
  Size _childSize;

  ///弹出框的widget
  ///[_childFun]返回的widget
  ///Popup window widget
  ///[_childFun] Returned widget
  Widget _child;

  Widget get child => _child;

  ///动画控制器
  //AnimationController
  AnimationController _controller;

  AnimationController get controller => _controller;

  KumiPopupWindow({
    @required Widget Function(KumiPopupWindow popup) childFun,
    KumiPopupGravity gravity,
    bool customAnimation,
    bool customPop,
    bool customPage,
    Color bgColor,
    RenderBox targetRenderBox,
    Size childSize,
    bool underStatusBar,
    bool underAppBar,
    bool clickOutDismiss,
    bool clickBackDismiss,
    double offsetX,
    double offsetY,
    Duration duration,
    Function(KumiPopupWindow popup) onShowStart,
    Function(KumiPopupWindow popup) onShowFinish,
    Function(KumiPopupWindow popup) onDismissStart,
    Function(KumiPopupWindow popup) onDismissFinish,
    Function(KumiPopupWindow popup) onClickOut,
    Function(KumiPopupWindow popup) onClickBack,
  })  : _childFun = childFun,
        _gravity = gravity ?? KumiPopupGravity.center,
        _customAnimation = customAnimation ?? false,
        _customPop = customPop ?? false,
        _customPage = customPage ?? false,
        _bgColor = bgColor ?? Colors.black.withOpacity(0.5),
        _targetRenderBox = targetRenderBox,
        _childSize = childSize,
        _underStatusBar = underStatusBar ?? false,
        _underAppBar = underAppBar ?? false,
        _clickOutDismiss = clickOutDismiss ?? true,
        _clickBackDismiss = clickBackDismiss ?? true,
        _offsetX = offsetX ?? 0,
        _offsetY = offsetY ?? 0,
        _duration = duration ?? Duration(milliseconds: 200),
        _onShowStart = onShowStart,
        _onShowEnd = onShowFinish,
        _onDismissStart = onDismissStart,
        _onDismissEnd = onDismissFinish,
        _onClickOut = onClickOut,
        _onClickBack = onClickBack;

  @override
  _KumiPopupWindowState createState() => _KumiPopupWindowState();

  ///收起弹框
  ///popup window dismiss
  Future dismiss(BuildContext context, {bool notStartAnimation, Function(KumiPopupWindow pop) onFinish}) async {
    _isShow = false;
    if (notStartAnimation == true) {
      Navigator.pop(context);
      if (onFinish != null) {
        onFinish(this);
      }
      return;
    }
    await _controller.reverse();
    Navigator.pop(context);
    if (onFinish != null) {
      onFinish(this);
    }
  }

  ///弹出弹框
  ///popup window show
  Future show(BuildContext context) async {
    Navigator.push(
      context,
      PopRoute(
        child: this,
      ),
    );
    _isShow = true;
  }

  bool _isShow;

  bool get isShow => _isShow;
}

class _KumiPopupWindowState extends State<KumiPopupWindow> with SingleTickerProviderStateMixin {
  Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    widget._controller = AnimationController(duration: widget._duration, vsync: this);
    widget._controller.addStatusListener((status) {
      switch (status) {
        case AnimationStatus.forward:
          if (widget._onShowStart != null) {
            widget._onShowStart(widget);
          }
          break;
        case AnimationStatus.dismissed:
          if (widget._onDismissEnd != null) {
            widget._onDismissEnd(widget);
          }
          break;
        case AnimationStatus.reverse:
          if (widget._onDismissStart != null) {
            widget._onDismissStart(widget);
          }
          break;
        case AnimationStatus.completed:
          if (widget._onShowEnd != null) {
            widget._onShowEnd(widget);
          }
          break;
      }
    });

    ///将弹出框保存起来，保证其唯一性
    ///Save the popup window to ensure its uniqueness
    widget._child = widget._childFun(widget);

    ///如果已经设置过弹出框的尺寸，那么可以直接开始动画
    ///If you have set the size of the popup window, you can start the animation directly
    if (widget._childSize != null) {
      widget._controller.forward();
    }

    ///绘制完成的监听
    ///Draw completed listener
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      if (widget._customPage) {
        widget._controller.forward();
        return;
      }
      if (widget._customPop) {
        widget._controller.forward();
        return;
      }

      ///如果未设置弹出框的尺寸
      ///If the size of the popup box is not set
      if (widget._childSize == null) {
        ///那么此时可以直接获取弹出框绘制完成之后的尺寸
        ///Then you can directly get the size after the popup window is drawn.
        widget._childSize = (widget._child.key as GlobalKey).currentContext.size;

        ///并且开始动画，必须放在setState里面
        ///And start the animation, must be placed in setState
        setState(() {
          widget._controller.forward();
        });
      }
    });
  }

  dispose() {
    widget._controller.dispose();
    super.dispose();
  }

  ///获取statusBar的高度
  ///Get the height of statusBar
  double _getStatusBar(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.padding.top;
  }

  ///获取statusBar和appBar的总高度
  ///Get the total height of statusBar and appBar
  double _getStatusBarAndAppBarHeight(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.padding.top + kToolbarHeight;
  }

  ///判断是否需要将弹出框显示在statusBar或者appBar下方，并返回偏移量
  ///Determines whether the pop-up window needs to be displayed below the statusBar or appBar and returns the offset
  double _getTopPadding(BuildContext context) {
    return widget._underAppBar == true ? _getStatusBarAndAppBarHeight(context) : (widget._underStatusBar == true ? _getStatusBar(context) : 0);
  }

  ///当popup window的中心点与屏幕中心点重合时，此时popup window的x轴坐标
  ///When the center point of the popup window coincides with the center point of the screen, the x-axis coordinate of the popup window at this time
  double _getScreenCenterX() {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    if (widget._childSize == null) {
      return mediaQuery.size.width / 2;
    }
    return (mediaQuery.size.width - widget._childSize.width) / 2;
  }

  ///当popup window的中心点与屏幕中心点重合时，此时popup window的y轴坐标
  ///When the center point of the popup window coincides with the center point of the screen, the y-axis coordinate of the popup window at this time
  double _getScreenCenterY() {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    if (widget._childSize == null) {
      return mediaQuery.size.height / 2;
    }
    return (mediaQuery.size.height - widget._childSize.height) / 2;
  }

  Widget getLayout(BuildContext context) {
    ///如果想要自定义整个页面
    ///If you want to customize the entire page
    if (widget._customPage) {
      return WillPopScope(
          child: widget._child,
          onWillPop: () {
            if (widget._clickBackDismiss) {
              widget.dismiss(context);
            }
            return Future.value(false);
          });
    }

    ///如果想要自定义popup window的位置和动画
    ///If you want to customize the position and animation of the popup window
    if (widget._customPop) {
      return WillPopScope(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: <Widget>[
                Positioned(
                  child: GestureDetector(
                    child: FadeTransition(
                      opacity: Tween(begin: 0.0, end: 1.0).animate(widget._controller),
                      child: Container(
                        alignment: Alignment.center,
                        color: widget._bgColor,
                      ),
                    ),
                    onTap: () {
                      if (widget._clickOutDismiss) {
                        widget.dismiss(context);
                        return;
                      }
                      if (widget._onClickOut != null) {
                        widget._onClickOut(widget);
                      }
                    },
                  ),
                ),
                widget._child,
              ],
            ),
          ),
          onWillPop: () {
            if (widget._clickBackDismiss) {
              widget.dismiss(context);
              return Future.value(false);
            }
            if (widget._onClickBack != null) {
              widget._onClickBack(widget);
            }
            return Future.value(false);
          });
    }

    ///popup window的最终widget
    ///The final widget of the popup window
    var childView;

    ///目标widget的坐标
    ///The position of the target widget
    Offset targetOffset;

    ///目标widget的尺寸
    ///The size of the target widget
    Size targetSize;

    ///当popup window的位置相对于某个目标widget时，需要初始化目标widget的坐标与尺寸
    ///When the position of the popup window is relative to a target widget, you need to initialize the position and size of the target widget
    if (widget._targetRenderBox != null) {
      targetOffset = widget._targetRenderBox.localToGlobal(Offset.zero);
      targetSize = widget._targetRenderBox.size;
    }
    switch (widget._gravity) {
      case KumiPopupGravity.leftTop:
        if (widget._targetRenderBox == null) {
          ///如果位置相对于屏幕，从屏幕左上角弹出
          ///If the position is relative to the screen，Pop up from the top left corner of the screen
          childView = Positioned(
            left: widget._offsetX,
            top: _getTopPadding(context) + widget._offsetY,
            child: widget._customAnimation
                ? widget._child
                : ScaleTransition(
                    scale: Tween(begin: 0.0, end: 1.0).animate(widget._controller),
                    child: SlideTransition(
                      position: Tween(begin: Offset(-1, -1), end: Offset(0, 0)).animate(widget._controller),
                      child: FadeTransition(
                        opacity: Tween(begin: -1.0, end: 1.0).animate(widget._controller),
                        child: widget._child,
                      ),
                    ),
                  ),
          );
        } else {
          ///如果位置相对于目标widget，从目标widget的左上角弹出
          ///弹出之前，弹出框左上角与目标widget的左上角对齐
          ///If the position is relative to the target widget, pop up from the upper left corner of the target widget
          ///Before popup, the upper left corner of the popup box is aligned with the upper left corner of the target widget
          childView = Positioned(
            left: targetOffset.dx + widget._offsetX,
            top: targetOffset.dy + widget._offsetY,
            child: widget._customAnimation
                ? widget._child
                : ScaleTransition(
                    scale: Tween(begin: 0.0, end: 1.0).animate(widget._controller),
                    child: SlideTransition(
                      position: Tween(begin: Offset(0, 0), end: Offset(-1, -1)).animate(widget._controller),
                      child: FadeTransition(
                        opacity: Tween(begin: -1.0, end: 1.0).animate(widget._controller),
                        child: widget._child,
                      ),
                    ),
                  ),
          );
        }
        break;
      case KumiPopupGravity.centerTop:
        if (widget._targetRenderBox == null) {
          ///如果位置相对于屏幕，从屏幕正上方弹出
          ///If the position is relative to the screen，Pop up from the top center corner of the screen
          childView = Positioned(
            left: _getScreenCenterX() + widget._offsetX,
            top: _getTopPadding(context) + widget._offsetY,
            child: widget._customAnimation
                ? widget._child
                : SlideTransition(
                    position: Tween(begin: Offset(0, -1), end: Offset(0, 0)).animate(widget._controller),
                    child: FadeTransition(
                      opacity: Tween(begin: -1.0, end: 1.0).animate(widget._controller),
                      child: widget._child,
                    ),
                  ),
          );
        } else {
          ///如果位置相对于目标widget，从目标widget的正上方弹出
          ///弹出之前，弹出框的x轴中心点与目标widget的x轴中心点对齐，弹出框的上边与目标widget的上边对齐
          ///If the position is relative to the target widget, pop up from directly above the target widget
          ///Before the pop-up, the x-axis center point of the popup window is aligned with the x-axis center point of the target widget, and the top of the popup window is aligned with the top of the target widget
          childView = Positioned(
            left: targetOffset.dx - (widget._childSize == null ? 0 : widget._childSize.width - targetSize.width) / 2 + widget._offsetX,
            top: targetOffset.dy + widget._offsetY,
            child: widget._customAnimation
                ? widget._child
                : ScaleTransition(
                    scale: Tween(begin: 0.0, end: 1.0).animate(widget._controller),
                    child: SlideTransition(
                      position: Tween(begin: Offset(0, 0), end: Offset(0, -1)).animate(widget._controller),
                      child: FadeTransition(
                        opacity: Tween(begin: -1.0, end: 1.0).animate(widget._controller),
                        child: widget._child,
                      ),
                    ),
                  ),
          );
        }
        break;
      case KumiPopupGravity.rightTop:
        if (widget._targetRenderBox == null) {
          ///如果位置相对于屏幕，从屏幕右上角弹出
          ///If the position is relative to the screen，Pop up from the top right corner of the screen
          childView = Positioned(
            right: -widget._offsetX,
            top: _getTopPadding(context) + widget._offsetY,
            child: widget._customAnimation
                ? widget._child
                : ScaleTransition(
                    scale: Tween(begin: 0.0, end: 1.0).animate(widget._controller),
                    child: SlideTransition(
                      position: Tween(begin: Offset(1, -1), end: Offset(0, 0)).animate(widget._controller),
                      child: FadeTransition(
                        opacity: Tween(begin: -1.0, end: 1.0).animate(widget._controller),
                        child: widget._child,
                      ),
                    ),
                  ),
          );
        } else {
          ///如果位置相对于目标widget，从目标widget的右上方弹出
          ///弹出之前，弹出框的右上角与目标widget的右上角对齐
          ///If the position is relative to the target widget, pop up from the upper right of the target widget
          ///Before popup, the upper right corner of the popup box is aligned with the upper right corner of the target widget
          childView = Positioned(
            left: targetOffset.dx - (widget._childSize == null ? 0 : widget._childSize.width - targetSize.width) + widget._offsetX,
            top: targetOffset.dy + widget._offsetY,
            child: widget._customAnimation
                ? widget._child
                : ScaleTransition(
                    scale: Tween(begin: 0.0, end: 1.0).animate(widget._controller),
                    child: SlideTransition(
                      position: Tween(begin: Offset(0, 0), end: Offset(1, -1)).animate(widget._controller),
                      child: FadeTransition(
                        opacity: Tween(begin: -1.0, end: 1.0).animate(widget._controller),
                        child: widget._child,
                      ),
                    ),
                  ),
          );
        }
        break;
      case KumiPopupGravity.leftCenter:
        if (widget._targetRenderBox == null) {
          ///如果位置相对于屏幕，从屏幕正左方弹出
          ///If the position is relative to the screen, pop up from the left of the screen
          childView = Positioned(
            left: widget._offsetX,
            top: _getScreenCenterY() + widget._offsetY + _getTopPadding(context) / 2,
            child: widget._customAnimation
                ? widget._child
                : SlideTransition(
                    position: Tween(begin: Offset(-1, 0), end: Offset(0, 0)).animate(widget._controller),
                    child: FadeTransition(
                      opacity: Tween(begin: -1.0, end: 1.0).animate(widget._controller),
                      child: widget._child,
                    ),
                  ),
          );
        } else {
          ///如果位置相对于目标widget，从目标widget的正左方弹出
          ///弹出之前，弹出框的y轴中心点与目标widget的y轴中心点对齐，弹出框的左边与目标widget的左边对齐
          ///If the position is relative to the target widget, pop up from the left of the target widget
          ///Before the pop-up, the y-axis center point of the popup window is aligned with the y-axis center point of the target widget, and the left side of the popup window is aligned with the left side of the target widget
          childView = Positioned(
            left: targetOffset.dx + widget._offsetX,
            top: targetOffset.dy - (widget._childSize == null ? 0 : widget._childSize.height - targetSize.height) / 2 + widget._offsetY,
            child: widget._customAnimation
                ? widget._child
                : ScaleTransition(
                    scale: Tween(begin: 0.0, end: 1.0).animate(widget._controller),
                    child: SlideTransition(
                      position: Tween(begin: Offset(0, 0), end: Offset(-1, 0)).animate(widget._controller),
                      child: FadeTransition(
                        opacity: Tween(begin: -1.0, end: 1.0).animate(widget._controller),
                        child: widget._child,
                      ),
                    ),
                  ),
          );
        }
        break;
      case KumiPopupGravity.center:
        if (widget._targetRenderBox == null) {
          ///如果位置相对于屏幕，从屏幕正中心弹出
          ///If the position is relative to the screen, pop up from the center of the screen
          childView = Positioned(
            left: _getScreenCenterX() + widget._offsetX,
            top: _getScreenCenterY() + widget._offsetY + _getTopPadding(context) / 2,
            child: widget._customAnimation
                ? widget._child
                : ScaleTransition(
                    scale: Tween(begin: 0.0, end: 1.0).animate(widget._controller),
                    child: FadeTransition(
                      opacity: Tween(begin: -1.0, end: 1.0).animate(widget._controller),
                      child: widget._child,
                    ),
                  ),
          );
        } else {
          ///如果位置相对于目标widget，从目标widget的正中心弹出
          ///弹出之前，弹出框的中心点与目标widget的中心点对齐
          ///If the position is relative to the target widget, pop it up from the center of the target widget
          ///Before pop-up, the center point of the popup window is aligned with the center point of the target widget
          childView = Positioned(
            left: targetOffset.dx - (widget._childSize == null ? 0 : widget._childSize.width - targetSize.width) / 2 + widget._offsetX,
            top: targetOffset.dy - (widget._childSize == null ? 0 : widget._childSize.height - targetSize.height) / 2 + widget._offsetY,
            child: widget._customAnimation
                ? widget._child
                : ScaleTransition(
                    scale: Tween(begin: 0.0, end: 1.0).animate(widget._controller),
                    child: FadeTransition(
                      opacity: Tween(begin: -1.0, end: 1.0).animate(widget._controller),
                      child: widget._child,
                    )),
          );
        }
        break;
      case KumiPopupGravity.rightCenter:
        if (widget._targetRenderBox == null) {
          ///如果位置相对于屏幕，从屏幕正右方弹出
          ///If the position is relative to the screen, pop up from the right of the screen
          childView = Positioned(
            right: -widget._offsetX,
            top: _getScreenCenterY() + widget._offsetY + _getTopPadding(context) / 2,
            child: widget._customAnimation
                ? widget._child
                : SlideTransition(
                    position: Tween(begin: Offset(1, 0), end: Offset(0, 0)).animate(widget._controller),
                    child: FadeTransition(
                      opacity: Tween(begin: -1.0, end: 1.0).animate(widget._controller),
                      child: widget._child,
                    ),
                  ),
          );
        } else {
          ///如果位置相对于目标widget，从目标widget的正右方弹出
          ///弹出之前，弹出框的y轴中心点与目标widget的y轴中心点对齐，弹出框的右边与目标widget的右边对齐
          ///If the position is relative to the target widget, pop up from the left of the target widget
          ///Before the pop-up, the y-axis center point of the popup window is aligned with the y-axis center point of the target widget, and the right side of the popup window is aligned with the right side of the target widget
          childView = Positioned(
            left: targetOffset.dx - (widget._childSize == null ? 0 : widget._childSize.width - targetSize.width) + widget._offsetX,
            top: targetOffset.dy - (widget._childSize == null ? 0 : widget._childSize.height - targetSize.height) / 2 + widget._offsetY,
            child: widget._customAnimation
                ? widget._child
                : ScaleTransition(
                    scale: Tween(begin: 0.0, end: 1.0).animate(widget._controller),
                    child: SlideTransition(
                      position: Tween(begin: Offset(0, 0), end: Offset(1, 0)).animate(widget._controller),
                      child: FadeTransition(
                        opacity: Tween(begin: -1.0, end: 1.0).animate(widget._controller),
                        child: widget._child,
                      ),
                    ),
                  ),
          );
        }
        break;
      case KumiPopupGravity.leftBottom:
        if (widget._targetRenderBox == null) {
          ///如果位置相对于屏幕，从屏幕左下方弹出
          ///If the position is relative to the screen, pop up from the bottom left of the screen
          childView = Positioned(
            left: widget._offsetX,
            bottom: -widget._offsetY,
            child: widget._customAnimation
                ? widget._child
                : ScaleTransition(
                    scale: Tween(begin: 0.0, end: 1.0).animate(widget._controller),
                    child: SlideTransition(
                      position: Tween(begin: Offset(-1, 1), end: Offset(0, 0)).animate(widget._controller),
                      child: FadeTransition(
                        opacity: Tween(begin: -1.0, end: 1.0).animate(widget._controller),
                        child: widget._child,
                      ),
                    ),
                  ),
          );
        } else {
          ///如果位置相对于目标widget，从目标widget的左下方弹出
          ///弹出之前，弹出框的左下角与目标widget的左下角对齐
          ///If the position is relative to the target widget, pop up from the bottom left of the target widget
          ///Before popping up, the bottom left corner of the popup box is aligned with the bottom left corner of the target widget
          childView = Positioned(
            left: targetOffset.dx + widget._offsetX,
            top: targetOffset.dy - (widget._childSize == null ? 0 : widget._childSize.height - targetSize.height) + widget._offsetY,
            child: widget._customAnimation
                ? widget._child
                : ScaleTransition(
                    scale: Tween(begin: 0.0, end: 1.0).animate(widget._controller),
                    child: SlideTransition(
                      position: Tween(begin: Offset(0, 0), end: Offset(-1, 1)).animate(widget._controller),
                      child: FadeTransition(
                        opacity: Tween(begin: -1.0, end: 1.0).animate(widget._controller),
                        child: widget._child,
                      ),
                    ),
                  ),
          );
        }
        break;
      case KumiPopupGravity.centerBottom:
        if (widget._targetRenderBox == null) {
          ///如果位置相对于屏幕，从屏幕正下方弹出
          ///If the position is relative to the screen, it pops up right below the screen
          childView = Positioned(
            left: _getScreenCenterX() + widget._offsetX,
            bottom: -widget._offsetY,
            child: widget._customAnimation
                ? widget._child
                : SlideTransition(
                    position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(widget._controller),
                    child: FadeTransition(
                      opacity: Tween(begin: -1.0, end: 1.0).animate(widget._controller),
                      child: widget._child,
                    ),
                  ),
          );
        } else {
          ///如果位置相对于目标widget，从目标widget的正下方弹出
          ///弹出之前，弹出框的x轴中心点与目标widget的x轴中心点对齐，弹出框的右边与目标widget的下边对齐
          ///If the position is relative to the target widget, pop up from directly below the target widget
          ///Before the pop-up, the x-axis center point of the popup window is aligned with the x-axis center point of the target widget, and the right side of the popup window is aligned with the bottom of the target widget
          childView = Positioned(
            left: targetOffset.dx - (widget._childSize == null ? 0 : widget._childSize.width - targetSize.width) / 2 + widget._offsetX,
            top: targetOffset.dy - (widget._childSize == null ? 0 : widget._childSize.height - targetSize.height) + widget._offsetY,
            child: widget._customAnimation
                ? widget._child
                : ScaleTransition(
                    scale: Tween(begin: 0.0, end: 1.0).animate(widget._controller),
                    child: SlideTransition(
                      position: Tween(begin: Offset(0, 0), end: Offset(0, 1)).animate(widget._controller),
                      child: FadeTransition(
                        opacity: Tween(begin: -1.0, end: 1.0).animate(widget._controller),
                        child: widget._child,
                      ),
                    ),
                  ),
          );
        }
        break;
      case KumiPopupGravity.rightBottom:
        if (widget._targetRenderBox == null) {
          ///如果位置相对于屏幕，从屏幕右下方弹出
          ///If the position is relative to the screen, pop up from the bottom right of the screen
          childView = Positioned(
            right: -widget._offsetX,
            bottom: -widget._offsetY,
            child: widget._customAnimation
                ? widget._child
                : ScaleTransition(
                    scale: Tween(begin: 0.0, end: 1.0).animate(widget._controller),
                    child: SlideTransition(
                      position: Tween(begin: Offset(1, 1), end: Offset(0, 0)).animate(widget._controller),
                      child: FadeTransition(
                        opacity: Tween(begin: -1.0, end: 1.0).animate(widget._controller),
                        child: widget._child,
                      ),
                    ),
                  ),
          );
        } else {
          ///如果位置相对于目标widget，从目标widget的右下方弹出
          ///弹出之前，弹出框的右下角与目标widget的右下角对齐
          ///If the position is relative to the target widget, pop up from the bottom right of the target widget
          ///Before popping up, the bottom right corner of the popup box is aligned with the bottom right corner of the target widget
          childView = Positioned(
            left: targetOffset.dx - (widget._childSize == null ? 0 : widget._childSize.width - targetSize.width) + widget._offsetX,
            top: targetOffset.dy - (widget._childSize == null ? 0 : widget._childSize.height - targetSize.height) + widget._offsetY,
            child: widget._customAnimation
                ? widget._child
                : ScaleTransition(
                    scale: Tween(begin: 0.0, end: 1.0).animate(widget._controller),
                    child: SlideTransition(
                      position: Tween(begin: Offset(0, 0), end: Offset(1, 1)).animate(widget._controller),
                      child: FadeTransition(
                        opacity: Tween(begin: -1.0, end: 1.0).animate(widget._controller),
                        child: widget._child,
                      ),
                    ),
                  ),
          );
        }
        break;
      default:
        break;
    }
    return WillPopScope(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Positioned(
                child: GestureDetector(
                  child: FadeTransition(
                    opacity: Tween(begin: 0.0, end: 1.0).animate(widget._controller),
                    child: Container(
                      alignment: Alignment.center,
                      color: widget._bgColor,
                    ),
                  ),
                  onTap: () {
                    if (widget._clickOutDismiss) {
                      widget.dismiss(context);
                      return;
                    }
                    if (widget._onClickOut != null) {
                      widget._onClickOut(widget);
                    }
                  },
                ),
              ),
              childView,
            ],
          ),
        ),
        onWillPop: () {
          if (widget._clickBackDismiss) {
            widget.dismiss(context);
            return Future.value(false);
          }
          if (widget._onClickBack != null) {
            widget._onClickBack(widget);
          }
          return Future.value(false);
        });
  }

  @override
  Widget build(BuildContext context) {
    return getLayout(context);
  }
}

enum KumiPopupGravity { leftTop, centerTop, rightTop, leftCenter, center, rightCenter, leftBottom, centerBottom, rightBottom }
