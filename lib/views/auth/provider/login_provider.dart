import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:damodi_daily_mood_diary/utils/state/finite_state.dart';
import 'package:damodi_daily_mood_diary/utils/widgets/custom_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginProvider extends ChangeNotifier {
  MyState state = MyState.none;

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<void> loginWithGoogle() async {
    state = MyState.loading;
    notifyListeners();

    try {
      final GoogleSignInAccount? userGoogle = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication authGoogle =
          await userGoogle!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: authGoogle.accessToken,
        idToken: authGoogle.idToken,
      );
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      if (userCredential.user != null) {
        await messaging.getToken().then((value) {
          users.doc(userCredential.user!.uid).set({
            'fcmToken': value,
            'lastLogin': DateTime.now().toString(),
          });
        });

        await Future.delayed(const Duration(seconds: 2));

        state = MyState.success;
        notifyListeners();
      } else {
        const CustomAlert(
          title: 'This is an error message',
          icon: Icons.error,
          isError: true,
        );
        state = MyState.error;
        notifyListeners();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        const CustomAlert(
          title: 'This is an error message',
          icon: Icons.error,
          isError: true,
        );
        state = MyState.error;
        notifyListeners();
      } else if (e.code == 'wrong-password') {
        const CustomAlert(
          title: 'This is an error message',
          icon: Icons.error,
          isError: true,
        );
        state = MyState.error;
        notifyListeners();
      }
    }
  }
}
