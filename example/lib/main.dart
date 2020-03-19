import 'package:flutter/material.dart';
import 'package:kumi_popup_window/kumi_popup_window.dart';

import 'kumi_popup_window.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey btnKey = GlobalKey();
  KumiPopupWindow popupWindow;

  ValueNotifier<bool> isSelect = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: MaterialButton(
            key: btnKey,
            child: Text("popup"),
            color: Colors.redAccent,
            onPressed: () {
              /* if (popupWindow == null) {
                popupWindow = createPopupWindow(
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
                  onClickOut: (pop){
                    print("onClickOut");
                  },
                  onClickBack: (pop){
                    print("onClickBack");
                  },
                  childFun: (controller) {
                    return Container(
                      key: GlobalKey(),
                      padding: EdgeInsets.all(10),
                      height: 100,
                      width: 100,
                      color: Colors.redAccent,
                    );
                  },
                );
              }
              popupWindow.show(context);*/
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
                onClickOut: (pop) {
                  print("onClickOut");
                },
                onClickBack: (pop) {
                  print("onClickBack");
                },
                childFun: (pop) {
                  return GestureDetector(
                    key: GlobalKey(),
                    onTap: () {
                      isSelect.value = !isSelect.value;
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 100,
                      width: 100,
                      color: Colors.redAccent,
                      alignment: Alignment.center,
                      child: ValueListenableBuilder(
                          valueListenable: isSelect,
                          builder: (context, bool select, child) {
                            return Text(isSelect.value.toString());
                          }),
                    ),
                  );
                },
              );
            }),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
