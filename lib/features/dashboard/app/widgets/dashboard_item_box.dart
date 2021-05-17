import 'package:flutter/material.dart';

//useful
class DashboardBox extends StatefulWidget {
  final Color color;
  final int number;
  final String boxName;
  final Function onTap;

  DashboardBox({
    Key key,
    this.color = Colors.red,
    this.number,
    this.boxName,
    this.onTap,
  }) : super(key: key);
  @override
  _DashboardBoxState createState() => _DashboardBoxState();
}

class _DashboardBoxState extends State<DashboardBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onTap(),
      child: Container(
        width: 100.0,
        height: 100.0,
        color: widget.color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${widget.number}',
              style: TextStyle(fontSize: 40.0),
            ),
            Text(
              '${widget.boxName}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            )
          ],
        ),
      ),
    );
  }
}
