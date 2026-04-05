import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sajha_bookstore/splashes/splashpage.dart';
import 'package:sajha_bookstore/utils/toast.dart';

class FirebaseService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  static Future<String?> signInwithGoogle(BuildContext context) async {
    try {
      // In 7.x, we should ensure it's initialized. 
      // If you have specific client IDs, you can pass them here.
      await _googleSignIn.initialize();

      final GoogleSignInAccount googleSignInAccount =
          await _googleSignIn.authenticate();
      
      // In 7.x, tokens are split between authentication (identity) and authorization (access)
      final GoogleSignInAuthentication authentication =
          await googleSignInAccount.authentication;
      final GoogleSignInClientAuthorization authorization =
          await googleSignInAccount.authorizationClient.authorizeScopes([]);

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: authorization.accessToken,
        idToken: authentication.idToken,
      );
      await _auth.signInWithCredential(credential);
      if (!context.mounted) return null;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SplashPage()));
      showToast(message: "Signed in with Google Successfully");
    } on FirebaseAuthException catch (e) {
      print(e.message);
      rethrow;
    }
    return null;
  }

  Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
