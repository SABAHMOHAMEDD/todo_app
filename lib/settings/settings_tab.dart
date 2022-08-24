import 'package:flutter/material.dart';
import 'package:todo_app/settings/theme_sheet_bottom.dart';

import 'lang_sheet_bottom.dart';

class SettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Language',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
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
                  color: Colors.white,
                  border: Border.all(
                      width: 1, color: Theme.of(context).primaryColor)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'English',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    size: 26,
                    color: Color(0xFF5D9CEC),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            'Theme',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
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
                  color: Colors.white,
                  border: Border.all(
                      width: 1, color: Theme.of(context).primaryColor)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Light',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    size: 26,
                    color: Color(0xFF5D9CEC),
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
        context: context,
        builder: (buildcontext) {
          return LangSheetBottom();
        });
  }

  void openThemeBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (buildcontext) {
          return ThemeSheetBottom();
        });
  }
}
