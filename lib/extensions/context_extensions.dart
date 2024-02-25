import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  double get fH => MediaQuery.of(this).size.height;
  double get fW => MediaQuery.of(this).size.width;
}
