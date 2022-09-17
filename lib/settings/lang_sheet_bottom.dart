import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/app_provider.dart';

class LangSheetBottom extends StatefulWidget {
  @override
  State<LangSheetBottom> createState() => _LangSheetBottomState();
}

class _LangSheetBottomState extends State<LangSheetBottom> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(
        children: [
          InkWell(
              onTap: () {
                provider.changeLang('en');
                Navigator.pop(context);
              },
              child: provider.currentLang == 'en'
                  ? getSelectedRow('English')
                  : getUnSelectedRow('English')),
          InkWell(
              onTap: () {
                provider.changeLang('ar');
              },
              child: provider.currentLang == 'ar'
                  ? getSelectedRow('العربية')
                  : getUnSelectedRow('العربية'))
        ],
      ),
    );
  }

  getSelectedRow(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 20),
        ),
        Icon(
          Icons.check,
          color: Theme.of(context).primaryColor,
        )
      ],
    );
  }

  getUnSelectedRow(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 20),
        ),
      ],
    );
  }
}
