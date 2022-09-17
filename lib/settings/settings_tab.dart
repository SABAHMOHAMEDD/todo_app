import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/app_provider.dart';
import 'package:todo_app/settings/theme_sheet_bottom.dart';

import 'lang_sheet_bottom.dart';

class SettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: () {
              openLangBottomSheet(context);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              margin: const EdgeInsets.only(top: 20),
              width: 319,
              height: 50,
              decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).primaryColor, width: 1),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.currentLang == 'en'
                        ? AppLocalizations.of(context)!.en
                        : AppLocalizations.of(context)!.ar,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 26,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: () {
              openThemeBottomSheet(context);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              margin: const EdgeInsets.only(top: 20),
              width: 319,
              height: 50,
              decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).primaryColor, width: 1),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.currentTheme == ThemeMode.light
                        ? AppLocalizations.of(context)!.light
                        : AppLocalizations.of(context)!.dark,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 26,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void openLangBottomSheet(context) {
    showModalBottomSheet(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        context: context,
        builder: (buildcontext) {
          return LangSheetBottom();
        });
  }

  void openThemeBottomSheet(context) {
    showModalBottomSheet(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        context: context,
        builder: (buildcontext) {
          return ThemeSheetBottom();
        });
  }
}
