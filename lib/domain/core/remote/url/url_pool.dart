import 'package:injectable/injectable.dart';

@singleton
class URLPool {
  String get baseUrl => 'http://www.mocky.io';
  String get version => '/v2';
  String get baseUrlWithVersion => '$baseUrl$version';
  String get getEmployees => '/5d565297300000680030a986';
}
