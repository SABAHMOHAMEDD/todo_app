import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/app_provider.dart';

class ThemeSheetBottom extends StatefulWidget {
  @override
  State<ThemeSheetBottom> createState() => _ThemeSheetBottomState();
}

class _ThemeSheetBottomState extends State<ThemeSheetBottom> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(
        children: [
          InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.light);
                Navigator.pop(context);
              },
              child: provider.isDarkMode()
                  ? getUnSelectedRow(AppLocalizations.of(context)!.light)
                  : getSelectedRow(AppLocalizations.of(context)!.light)),
          SizedBox(
            height: 7,
          ),
          InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.dark);
                Navigator.pop(context);
              },
              child: provider.isDarkMode()
                  ? getSelectedRow(AppLocalizations.of(context)!.dark)
                  : getUnSelectedRow(AppLocalizations.of(context)!.dark))
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
