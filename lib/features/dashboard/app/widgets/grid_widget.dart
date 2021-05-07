//this is the code to create a non-scrollable grid widget

import 'package:flutter/material.dart';

//useful
class BasicGrid extends StatelessWidget {
  const BasicGrid({
    Key key,
    this.columnCount = 2,
    @required this.children,
    this.gap,
    this.padding,
    this.margin,
  }) : super(key: key);

  /// Number of column.
  final int columnCount;

  /// List of the widget to display.
  final List<Widget> children;

  /// Empty space between children
  final double gap;

  /// Empty space.
  final EdgeInsets padding;

  /// Empty space.
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgets = [];

    final childrenLength = children.length;
    final rowCount = (childrenLength / columnCount).ceil();
    for (int i = 0; i < rowCount; i++) {
      final List<Widget> row = [];
      for (int x = 0; x < columnCount; x++) {
        final index = i * columnCount + x;
        if (index <= childrenLength - 1) {
          row.add(Container(child: children[index]));
        } else {
          row.add(Expanded(child: Container()));
        }
        if (x != columnCount - 1) {
          row.add(SizedBox(width: gap));
        }
      }
      widgets.add(Row(children: row));
      if (i != rowCount - 1) {
        widgets.add(SizedBox(height: gap));
      }
    }

    return Container(
      padding: padding,
      margin: margin,
      child: Column(children: widgets),
    );
  }
}

class GridForDashBoard extends StatelessWidget {
  const GridForDashBoard({
    Key key,
    this.columnCount = 2,
    @required this.children,
    this.gap,
    this.padding,
    this.margin,
  }) : super(key: key);

  /// Number of column.
  final int columnCount;

  /// List of the widget to display.
  final List<Widget> children;

  /// Empty space between children
  final double gap;

  /// Empty space.
  final EdgeInsets padding;

  /// Empty space.
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgets = [];

    final childrenLength = children.length;
    final rowCount = (childrenLength / columnCount).ceil();
    for (int i = 0; i < rowCount; i++) {
      final List<Widget> row = [];
      for (int x = 0; x < columnCount; x++) {
        final index = i * columnCount + x;
        if (index <= childrenLength - 1) {
          row.add(Expanded(child: children[index]));
        } else {
          row.add(Expanded(child: Container()));
        }
        if (x != columnCount - 1) {
          row.add(SizedBox(width: gap));
        }
      }
      widgets.add(Row(children: row));
      if (i != rowCount - 1) {
        widgets.add(SizedBox(height: gap));
      }
    }

    return Container(
      padding: padding,
      margin: margin,
      child: Column(children: widgets),
    );
  }
}
