import 'package:flutter/material.dart';

import 'history.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/history': (context) => (History()),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Discount Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var totalprice = '0';
  var discount = '0';
  var discountprice;
  var saved;
  var priceController = TextEditingController();
  var discountController = TextEditingController();

  var showTotalPrice = "";
  var showDiscount = "";

  var listOfDiscounts = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.

    priceController.dispose();
    discountController.dispose();
    super.dispose();
  }

  _calculate(totalprice, discount) {
    totalprice = double.parse(totalprice);
    discount = double.parse(discount);
    var cal = (discount * totalprice) / 100;
    discountprice = totalprice - cal;
    return discountprice;
  }

  double _calculateAmountSaved(totalprice, discountprice) {
    totalprice = double.parse(totalprice);
    double saved = totalprice - discountprice;
    return saved;
  }

  _savedButton(showtotalprice, showdiscount, discountprice, saved) {
    listOfDiscounts.add({
      "Price": showtotalprice,
      "Discount": showdiscount,
      "Discounted Price": discountprice,
      "Saved": saved,
    });

    print("list $listOfDiscounts");
    print("list item types : ${listOfDiscounts[0]["Price"]}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          FlatButton(
            onPressed: () {
              // Navigator.pushNamed(context, '/history',
              //     arguments: (listOfDiscounts)  );

              Navigator.pushNamed(context, "/history",
                  arguments: listOfDiscounts);
            },
            child: Text(
              'History',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                elevation: 10.0,
                child: TextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90), //Not Working
                    ),
                    hintText: "Enter Price",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  // onChanged: (text) {
                  //   totalprice = text;
                  // },
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Material(
                elevation: 10.0,
                child: TextField(
                  controller: discountController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(),
                  decoration: InputDecoration(
                      hintText: "Enter Discount",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      )),
                  // onChanged: (text) {
                  //   print("price: controller:  ${priceController.text}");
                  //   discount = text;
                  // },
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              ButtonTheme(
                minWidth: 120,
                height: 40,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'Discount',
                    style: TextStyle(fontSize: 18),
                  ),
                  elevation: 10.0,
                  textColor: Colors.white,
                  color: Colors.purpleAccent,
                  onPressed: () {
                    print("price controller: ${priceController.text}");
                    showTotalPrice = priceController.text;
                    showDiscount = discountController.text;

                    discountprice = _calculate(
                        priceController.text, discountController.text);

                    saved = _calculateAmountSaved(
                        priceController.text, discountprice);
                    priceController.clear();
                    discountController.clear();
                    print(priceController.text);
                    setState(() {});
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 370.0,
                height: 180,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.black,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Calculations",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Price: " +
                                    (showTotalPrice ==
                                            "" // Ambigious logic but working
                                        ? ""
                                        : "$showTotalPrice Rs"),
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Discount: " +
                                    (showDiscount == ""
                                        ? " "
                                        : "$showDiscount%"),
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                discountprice == null
                                    ? "Discounted Price: "
                                    : "Discounted Price: $discountprice",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                saved == null ? "Saved: " : "Saved Rs: $saved",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ButtonTheme(
                minWidth: 130,
                height: 40,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: RaisedButton(
                  onPressed: () {
                    print("List before call: $listOfDiscounts");
                    _savedButton(
                        showTotalPrice, showDiscount, discountprice, saved);
                  },
                  color: Colors.amber,
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: 18),
                  ),
                  elevation: 10.0,
                  textColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
