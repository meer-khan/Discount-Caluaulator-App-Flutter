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

    print(args);

    // List<Widget> _listViewbuilder(context, args) {
    //   List<Widget> listOfwidgets = [];
    //   listOfwidgets.add(
    //     ListView.builder(
    //       itemCount: args.length,
    //       itemBuilder: (context, index) {
    //         return ListTile(
    //           title: Text(
    //               "Prices: ${args[index]["Price"]}Rs    Discount: ${args[index]["Discount"]}%  "),
    //           subtitle: Text(
    //             "Discounted Price: ${args[index]["Discounted Price"]}Rs"
    //             "Saved: ${args[index]["Saved"]}Rs",
    //           ),
    //           trailing: Icon(Icons.delete),
    //           isThreeLine: true,
    //         );
    //       },
    //     ),
    //   );
    //   return listOfwidgets;
    // }

    clear() {
      print("before : $args");
      args.clear();
      this.setState(() {});

      print("after : $args");
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("History"),
          actions: [
            FloatingActionButton(
              onPressed: clear,
              child: Text(
                "Clear",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
        body: args == []
            ? SafeArea(
                child: Center(
                  child: Row(
                    children: [
                      Text(
                        "NO DATA RIGHT NOW ",
                        style: TextStyle(
                            fontSize: 40, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.purple,
                      thickness: 2,
                      // endIndent: 30,
                      // indent: 30,
                    );
                  },
                  itemCount: args.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        "Prices: ${args[index]["Price"]}Rs    Discount: ${args[index]["Discount"]}%",
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Text(
                        "Discounted Price: ${args[index]["Discounted Price"]}Rs               \n"
                        "Saved: ${args[index]["Saved"]}Rs",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        iconSize: 40,
                        focusColor: Colors.blueAccent,
                        onPressed: () {
                          this.setState(() {
                            args.removeAt(index);
                          });
                        },
                      ),
                      isThreeLine: true,
                    );
                  },
                ),
              ),
      ),
    );
  }
}
