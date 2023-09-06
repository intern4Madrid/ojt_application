import 'package:flutter/material.dart';

class AdminFileOpener extends ChangeNotifier {
  bool _isAdded = false;

  bool get isAdded => _isAdded;

  set isAdded(bool value) {
    _isAdded = value;
    notifyListeners();
  }

  Widget? _widget;

  Widget get widget => _widget!;

  set widget(Widget value) {
    _widget = value;
    notifyListeners();
  }
}
