import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

double customWidth(num value) {
  return ScreenUtil().setWidth(value).toDouble();
}

double customHeight(num value) {
  return ScreenUtil().setHeight(value).toDouble();
}

double customFontSize(num value) {
  return ScreenUtil().setSp(value).toDouble();
}

class VerticalGap extends StatelessWidget {
  final num value;
  const VerticalGap({required this.value, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: customHeight(value));
  }
}

class HorizontalGap extends StatelessWidget {
  final num value;
  const HorizontalGap({required this.value, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: customWidth(value));
  }
}
