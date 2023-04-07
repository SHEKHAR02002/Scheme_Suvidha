import 'package:flutter/material.dart';
import 'package:scheme/l10n/l10n.dart';

class LocaleProvider with ChangeNotifier {
  Locale? _locale = const Locale("en");
  Locale? get locale => _locale;
  void setLocale(Locale loc) {
    if (!L10n.support.contains(loc)) return;
    _locale = loc;
    notifyListeners();
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }
}
