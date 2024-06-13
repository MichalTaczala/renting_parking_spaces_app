import 'package:flutter/material.dart';

class ScrollableIfMuchContentWidget extends StatelessWidget {
  const ScrollableIfMuchContentWidget(
      {super.key,
      required this.upperWidget,
      required this.lowerWidget,
      this.paddingValue = 32.0});
  final Widget upperWidget;
  final Widget lowerWidget;
  final double paddingValue;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SizedBox(
        height: constraints.maxHeight,
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: EdgeInsets.all(paddingValue),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  upperWidget,
                  lowerWidget,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
