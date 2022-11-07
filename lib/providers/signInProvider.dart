import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInProvaider extends ChangeNotifier {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  bool _hasError = false;
  bool get hasError => _hasError;

  String? _errorCode;
  String? get errorCode => _errorCode;

  String? _provider;
  String? get provider => _provider;

  String? _uid;
  String? get uid => _uid;

  String? _name;
  String? get name => _name;

  String? _email;
  String? get email => _email;

  String? _photoUrl;
  String? get photoUrl => _photoUrl;

  signInProvider() {
    checkSignInUser();
  }

  Future checkSignInUser() async {
    final SharedPreferences shared = await SharedPreferences.getInstance();
    _isSignedIn = shared.getBool("signed_in") ?? false;
    notifyListeners();
  }

  Future setSignIn() async {
    final SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setBool("signed_in", true);
    _isSignedIn = true;
    notifyListeners();
  }

  Future signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      try {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final User userDetails =
            (await FirebaseAuth.instance.signInWithCredential(authCredential))
                .user!;

        _name = userDetails.displayName;
        _email = userDetails.email;
        _photoUrl = userDetails.photoURL;
        _provider = "GOOGLE";
        _uid = userDetails.uid;
        notifyListeners();
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case "account-exists-with-different-credential":
            _errorCode = "La cuenta ya existe con datos diferentes";
            _hasError = true;
            notifyListeners();
            break;

          case "null":
            _errorCode = "Error inesperado al iniciar sesión";
            _hasError = true;
            notifyListeners();
            break;

          default:
            _errorCode = e.toString();
            _hasError = true;
            notifyListeners();
        }
      }
    } else {
      _hasError = true;
      notifyListeners();
    }
  }

  Future getUserDataFromFirestore(uid) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .get()
        .then((DocumentSnapshot snapshot) => {
              _uid = snapshot['uid'],
              _name = snapshot['name'],
              _email = snapshot['email'],
              _photoUrl = snapshot['photoUrl'],
              _provider = snapshot['provider'],
            });
  }

  Future saveDataToFirestore() async {
    final DocumentReference user =
        FirebaseFirestore.instance.collection("users").doc(uid);
    await user.set({
      "name": _name,
      "email": _email,
      "uid": _uid,
      "photoUrl": _photoUrl,
      "provider": _provider,
    });
    notifyListeners();
  }

  Future saveDataToSharedPreferences() async {
    final SharedPreferences shared = await SharedPreferences.getInstance();
    await shared.setString('name', _name!);
    await shared.setString('email', _email!);
    await shared.setString('uid', _uid!);
    await shared.setString('photoUrl', _photoUrl!);
    await shared.setString('provider', _provider!);
    notifyListeners();
  }

  Future getDataFromSharedPreferences() async {
    final SharedPreferences shared = await SharedPreferences.getInstance();
    _name = shared.getString("name");
    _email = shared.getString("email");
    _photoUrl = shared.getString("photoUrl");
    _uid = shared.getString('uid');
    _provider = shared.getString("provider");
    notifyListeners();
  }

  Future<bool> checkUserExists() async {
    DocumentSnapshot snap =
        await FirebaseFirestore.instance.collection('users').doc(_uid).get();
    if (snap.exists) {
      print("existing user");
      return true;
    } else {
      print("new user");
      return false;
    }
  }

  Future clearStoredData() async {
    final SharedPreferences shared = await SharedPreferences.getInstance();
    shared.clear();
  }

  Future userSignOut() async {
    await FirebaseAuth.instance.signOut();
    await googleSignIn.signOut();
    _isSignedIn = false;

    notifyListeners();

    clearStoredData();
  }
}
