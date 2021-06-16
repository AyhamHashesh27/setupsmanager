// // @dart=2.9
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:setups_manager/Data/Models/setups_manager_user.dart';

// class AuthenticationService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   // create user obj based on firebase user
//   SetupsManagerUser _userFromFirebaseUser(FirebaseUser user) {
//     return user != null ? SetupsManagerUser(user.uid) : null;
//   }

//   // auth change user stream
//   Stream<SetupsManagerUser> get user {
//     return _auth.onAuthStateChanged
//         //.map((FirebaseUser user) => _userFromFirebaseUser(user));
//         .map(_userFromFirebaseUser);
//   }

//   // Sign in anonymously
//   Future signInAnon() async {
//     try {
//       AuthResult result = await _auth.signInAnonymously();
//       FirebaseUser user = result.user;
//       return _userFromFirebaseUser(user);
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }

//   // sign out
//   Future signOut() async {
//     try {
//       return await _auth.signOut();
//     } catch (error) {
//       print(error.toString());
//       return null;
//     }
//   }
// }
