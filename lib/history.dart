import 'package:flutter/material.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  // _HistoryState() {
  //   this.args;
  // }
  static const routeName = '/history';

  @override
  Widget build(BuildContext context) {
    final List args = ModalRoute.of(context).settings.arguments;

    _listview(args) {
      for (var i = 0; i < args.length; i++) {
        print("Prices: ${args[i]["Price"]} \n");
      }
      return;
    }

    return Scaffold(
      appBar: AppBar(),
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
                        RaisedButton(onPressed: () {
                          _listview(args);
                        }),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Colors.amber),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Prices: ${args[0]["Price"]}Rs    Discount: ${args[0]["Discount"]}% \n Discounted Price: ${args[0]["Discounted Price"]}Rs \n Saved: ${args[0]["Saved"]}Rs",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
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
    );
  }
}
