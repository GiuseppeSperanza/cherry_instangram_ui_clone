import 'package:flutter/material.dart';

class UserStatistics extends StatelessWidget {
  UserStatistics({
    @required this.labels,
    @required this.values,
  });
  final List<String> labels;
  final List<int> values;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 16,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black12,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: List.generate(
          labels.length,
          (index) => Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  Text(
                    values[index].toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    labels[index],
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
