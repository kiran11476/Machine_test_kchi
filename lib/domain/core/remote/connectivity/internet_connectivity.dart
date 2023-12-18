import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

@singleton
class InternetConnectivity {
  Connectivity get connectivity => Connectivity();

  Future<bool> isNotConnectedToInternet() async {
    final connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return true;
    } else {
      return false;
    }
  }
}
