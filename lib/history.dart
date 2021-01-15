import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  // _HistoryState() {
  //   this.args;
  // }
  static const routeName = '/history';

  Color myhex = Color(0xff123456);

  @override
  Widget build(BuildContext context) {
    final List args = ModalRoute.of(context).settings.arguments;

    List<Widget> _listview(args) {
      List<Widget> listOfwidgets = [];
      for (var i = 0; i < args.length; i++) {
        print("Prices: ${args[i]["Price"]} \n");
        if (args == null) {
          return null;
        } else {
          listOfwidgets.add(
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Prices: ${args[i]["Price"]}Rs    Discount: ${args[i]["Discount"]}% \n Discounted Price: ${args[i]["Discounted Price"]}Rs \n Saved: ${args[i]["Saved"]}Rs",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      height: 10,
                      thickness: 00,
                      color: Colors.black,
                    )
                  ],
                ),
              ],
            ),
          );
        }
      }
      return listOfwidgets;
    }

    clear() {
      print("before : $args");
      args.clear();
      this.setState(() {});

      print("after : $args");
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            FloatingActionButton(
              onPressed: clear,
              child: Text(
                "Clear",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.black,
                  ),
                ),
                width: 365,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'History',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(color: Color(0xffb74093)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          // child: Text(
                          //   "Prices: ${args[0]["Price"]}Rs    Discount: ${args[0]["Discount"]}% \n Discounted Price: ${args[0]["Discounted Price"]}Rs \n Saved: ${args[0]["Saved"]}Rs",
                          //   style: TextStyle(
                          //     fontSize: 18,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),

                          child: Column(
                            children: _listview(args),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
