import "package:http/http.dart" as http;
import "package:flutter/material.dart";

class MarathiTable extends StatefulWidget {
  const MarathiTable({super.key});

  @override
  State<MarathiTable> createState() => _MarathiTableState();
}

class _MarathiTableState extends State<MarathiTable> {
  @override
  Widget build(BuildContext context) {
    TableRow _tableRow = const TableRow(children: <Widget>[
      Padding(
        padding: EdgeInsets.all(10.0),
        child: Text('Content 1'),
      ),
      Padding(
        padding: EdgeInsets.all(10.0),
        child: Text('Content 2'),
      ),
      Padding(
        padding: EdgeInsets.all(10.0),
        child: Text('Content 3'),
      ),
    ]);
    return Scaffold(
        body: Center(
            child: Column(children: <Widget>[
      Container(
        margin: EdgeInsets.all(20),
        child: Table(
          defaultColumnWidth: FixedColumnWidth(130.0),
          border: TableBorder.all(
              color: Colors.black, style: BorderStyle.solid, width: 2),
          children: [
            TableRow(children: [
              Column(children: [
                Text('Website', style: TextStyle(fontSize: 25.0))
              ]),
              Column(children: [
                Text('Tutorial', style: TextStyle(fontSize: 20.0))
              ]),
              Column(
                  children: [Text('Review', style: TextStyle(fontSize: 20.0))]),
            ]),
            TableRow(children: [
              Column(children: [Text('Javatpoint')]),
              Column(children: [Text('Flutter')]),
              Column(children: [Text('5*')]),
            ]),
            TableRow(children: [
              Column(children: [Text('Javatpoint')]),
              Column(children: [Text('MySQL')]),
              Column(children: [Text('5*')]),
            ]),
            TableRow(children: [
              Column(children: [Text('Javatpoint')]),
              Column(children: [Text('ReactJS')]),
              Column(children: [Text('5*')]),
            ]),
          ],
        ),
      ),
    ])));
  }
}
