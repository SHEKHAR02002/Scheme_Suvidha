import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:scheme/l10n/language_model.dart';
import 'package:scheme/provider/googletranslator.dart';
import 'package:scheme/provider/locale_provider.dart';

LanguageModel? chosenvalue = LanguageModel(code: 'en', name: 'English');

class LanguageDropdown extends StatefulWidget {
  const LanguageDropdown({Key? key}) : super(key: key);

  @override
  State<LanguageDropdown> createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  final List<LanguageModel> languages = [
    LanguageModel(code: 'en', name: 'English'),
    LanguageModel(code: 'hi', name: 'Hindi'),
    LanguageModel(code: 'mr', name: 'Marathi'),
  ];
  @override
  void initState() {
    super.initState();
    // chosenvalue = LanguageModel(code: 'en', name: 'English');
  }

  @override
  Widget build(BuildContext context) {
    var language = AppLocalizations.of(context)!;
    return DropdownButton<LanguageModel>(
      underline: const SizedBox.shrink(),
      iconSize: 25,
      elevation: 0,
      hint: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text(language.language),
      ),
      items:
          languages.map<DropdownMenuItem<LanguageModel>>((LanguageModel value) {
        return DropdownMenuItem<LanguageModel>(
          value: value,
          child: Text(
            value.name!,
          ),
        );
      }).toList(),
      onChanged: (LanguageModel? newValue) {
        setState(() {
          chosenvalue = newValue!;
          if (chosenvalue!.code == "en") {
            turnOnGOOGleAPI = false;
          } else {
            turnOnGOOGleAPI = true;
          }
          Provider.of<LocaleProvider>(context, listen: false)
              .setLocale(Locale(newValue.code!));
        });
      },
    );
  }
}
