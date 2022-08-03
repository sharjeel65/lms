import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lms/functions/StringProcess.dart';

String errormessage = '';
String authStatus = '';
User? userforverification;

class FireAuth {
  // For registering a new user
  static Future<User?> registerUsingEmailPassword({
    required String name,
    required String email,
    required String password,
    required String gender,
    required String dob,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      userforverification = userCredential.user;
      await user!.updateDisplayName(name);
      await user.updatePhotoURL(
          'https://firebasestorage.googleapis.com/v0/b/lmsapp-44b29.appspot.com/o/AvatarMaker.png?alt=media&token=58b89cdc-5145-4ed6-9b6a-6f3732149ce0');
      await user.reload();
      user = auth.currentUser;
      firestore.collection('users').doc(user?.uid).set({
        'email': email,
        'nickname': name,
        'Password': password,
        'uid': StringProcess.stringProcess(user?.uid),
        'admin': false,
        'verified': false,
        'gender': gender,
        'dob': dob,
      }).then((_) => {print('success')});
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid email":
          {
            errormessage = 'Your email appears to be malformed';
            print(errormessage);
          }
          break;
        case "weak-password":
          {
            errormessage = 'Your password must be greater than 6 characters';
            print(errormessage);
          }
          break;
        case "email-already-in-use":
          {
            errormessage = 'Email is already registered';
            print(errormessage);
          }
          break;
        default:
          {
            errormessage = "Unidentified error happened";
            print(e);
          }
      }
    } catch (e) {
      print(e);
    }
    if (user?.emailVerified == false) {
      await user?.sendEmailVerification();
      errormessage =
      'A verification email has been sent to you. Please check your email/spam folder and verify!';
      return user;
    } else {
      return user;
    }
  }

  // For signing in an user (have already registered)
  static Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          {
            errormessage = 'Your email address appears to be malformed.';
            print(errormessage);
          }
          break;
        case "wrong-password":
          {
            errormessage = 'Your password or email is incorrect.';
            print(errormessage);
          }
          break;
        case "user-not-found":
          {
            errormessage = 'Your password or email is incorrect.';
            print(errormessage);
          }
          break;
        case "user-disabled":
          {
            errormessage = 'User with this email has been disabled.';
            print(errormessage);
          }
          break;
        case "too-many-requests":
          {
            errormessage = 'Too many requests. Try again later.';
            print(errormessage);
          }
          break;
        case "operation-not-allowed":
          {
            errormessage = 'Signing in with Email and Password is not enabled.';
            print(errormessage);
          }
          break;
        case "unknown":
          {
            errormessage = 'Please enter Email and Password both';
            print(errormessage);
          }
          break;
        default:
          {
            errormessage = "An undefined Error happened.";
            print(errormessage);
          }
      }
    }
    if (user?.photoURL == null) {
      await user?.updatePhotoURL(
          'https://firebasestorage.googleapis.com/v0/b/lmsapp-44b29.appspot.com/o/AvatarMaker.png?alt=media&token=58b89cdc-5145-4ed6-9b6a-6f3732149ce0');
    }
    if (user?.emailVerified == false) {
      await user?.sendEmailVerification();
      errormessage =
          'A verification email has been sent to you. Please check your email/spam folder and verify!';
    } else {
      return user;
    }
  }

  static Future<User?> refreshUser(User user) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await user.reload();
    User? refreshedUser = auth.currentUser;

    return refreshedUser;
  }
}

class errors {
  String error() {
    return errormessage;
  }
}
