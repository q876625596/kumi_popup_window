import 'package:flutter/material.dart';
import 'package:kumi_popup_window/kumi_popup_window.dart';

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
  MyHomePage({Key? key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey btnKey = GlobalKey();
  KumiPopupWindow? popupWindow;

  ValueNotifier<bool> isSelect = ValueNotifier(false);
  var aaa = "false";

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
        title: Text(widget.title ?? ""),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ValueListenableBuilder(
                valueListenable: isSelect,
                builder: (context, bool select, child) {
                  return Text(isSelect.value == false ? "popup child function onclick is false" : "popup child function onclick is true");
                }),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
                key: btnKey,
                height: 50,
                child: Text("popup"),
                color: Colors.redAccent,
                onPressed: () {
                  /*showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                          builder: (context1, StateSetter setBottomSheetState) {
                            return SingleChildScrollView(
                              child: Container(
                                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        setBottomSheetState(() {
                                        aaa = "true";
                                      });
                                      },
                                      child: Text("asdasdasd"),
                                    ),
                                    TextField(
                                      controller: TextEditingController(text: aaa),
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly], //只允许输入数字
                                      textInputAction: TextInputAction.done,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      });*/
                  showPopupWindow(
                    context,
                    //childSize:Size(240, 800),
                    gravity: KumiPopupGravity.centerBottom,
                    //curve: Curves.elasticOut,
                    bgColor: Colors.grey.withOpacity(0.5),
                    clickOutDismiss: true,
                    clickBackDismiss: true,
                    customAnimation: false,
                    customPop: false,
                    customPage: false,
                    // targetRenderBox: (btnKey.currentContext.findRenderObject() as RenderBox),
                    //needSafeDisplay: true,
                    underStatusBar: false,
                    underAppBar: false,
                    //offsetX: -180,
                    //offsetY: 50,
                    duration: Duration(milliseconds: 300),
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
                      return StatefulBuilder(
                          key: GlobalKey(),
                          builder: (popContext, popState) {
                            return GestureDetector(
                              onTap: () {
                                //isSelect.value = !isSelect.value;
                                popState(() {
                                  aaa = "sasdasd";
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                height: 800,
                                width: 300,
                                color: Colors.redAccent,
                                alignment: Alignment.center,
                                child: Text(aaa),
                              ),
                            );
                          });
                    },
                  );
                }),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
