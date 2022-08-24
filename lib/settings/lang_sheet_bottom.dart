import 'package:flutter/material.dart';

class LangSheetBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(9),
          width: double.infinity,
          height: 55,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border:
                  Border.all(width: 2, color: Theme.of(context).primaryColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('English', style: Theme.of(context).textTheme.titleSmall),
              Icon(
                Icons.check,
                color: Theme.of(context).primaryColor,
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(9),
          width: double.infinity,
          height: 55,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border:
                  Border.all(width: 2, color: Theme.of(context).primaryColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'العربية',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Icon(
                Icons.check,
                color: Theme.of(context).primaryColor,
              )
            ],
          ),
        )
      ],
    );
  }
}