
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class Connectivity {

  bool connecteSattus = false;
 late ConnectivityResult result1;


  final Connectivity connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> connectivytsubscription;



   Future<bool> intConnectivity() async {

   // connectivytsubscription = connectivity.onConnectivityChanged.listen(updateConnection);
    try {

      bool isConnect = Connectivity.updateConnection(result1);
      return updateConnection(result1);
    } catch (e) {
      print(e);
    }
    return updateConnection(result1);
  }



  static bool updateConnection(ConnectivityResult result) {
    if (result == ConnectivityResult.wifi) {
      return true;
    } else if (result == ConnectivityResult.mobile) {
      return true;
    } else if (result == ConnectivityResult.none) {
      return false;
    } else {
      return false;
    }
  }


}