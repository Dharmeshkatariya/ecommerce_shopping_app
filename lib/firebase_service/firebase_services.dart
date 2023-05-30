import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:furniture_shoping/common.dart';
import 'package:furniture_shoping/routes/nameroutes.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthMethod {
  final FirebaseAuth auth = FirebaseAuth.instance;

  GoogleSignIn googleSignIn = GoogleSignIn();

  googleSignInUser() async {
    try {
      var result = await googleSignIn.signIn();
      if (result == null) {
        Common.commonSnabar("Google", "Please try again later");
      }
      final userdata = await result!.authentication;

      final credential = GoogleAuthProvider.credential(idToken: userdata.idToken, accessToken: userdata.accessToken);

      var finalResult = await auth.signInWithCredential(credential);

      Common.commonSnabar("login", "success");
      var shareP = await SharedPreferences.getInstance();

      shareP.setString("username", finalResult.user!.displayName!);
      shareP.setString("email", finalResult.user!.email!);
   shareP.getBool("login") ?? false;
      shareP.setString("googleImage", finalResult.user!.photoURL!);

      Get.toNamed(NameRoutes.dashBoardScreen);

    } catch (e) {

      print(e);

    }
  }

  // log out google log out
  googleSignOut() async {

    await googleSignIn.disconnect();

    auth.signOut();

  }

  facebookSignInUser() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;
      // use the accessToken to make API calls
    } else {
      print('Facebook login failed: ${result.status}');
    }
  }

  Future<void> loginWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        final AuthCredential credential =
            FacebookAuthProvider.credential(accessToken.token);

        final UserCredential authResult =
            await FirebaseAuth.instance.signInWithCredential(credential);
        final User? user = authResult.user;

        if (user != null) {
          // user is logged in
        } else {
          // authentication failed
        }
      } else {
        // login failed
      }
    } catch (e) {
      // handle error
    }
  }
}
