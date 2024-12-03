import 'package:firebase_auth/firebase_auth.dart';

import '../../../utils/either.dart';
import '../credentials/adapters/user_auth_credential_adapter.dart';
import '../credentials/user_auth_credential.dart';
import '../exceptions/auth_exceptions.dart';
import '../i_auth_service.dart';

/// A service class that handles authentication operations using Firebase.
class FirebaseAuthService implements IAuthService {
  final FirebaseAuth _auth;

  /// Constructs an instance of [FirebaseAuthService] with the provided [FirebaseAuth] instance.
  ///
  /// - Parameter auth: An instance of [FirebaseAuth] used to perform authentication operations.
  const FirebaseAuthService(this._auth);

  /// Signs up a new user with the given email and password.
  ///
  /// - Parameters:
  ///   - email: The email address of the new user.
  ///   - password: The password for the new user.
  /// - Returns: A [UserCredential] containing the newly created user.
  /// - Throws: [SignUpAuthException] if an error occurs during the sign-up process.
  @override
  AsyncResult<bool> signUpWithEmail(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return right(true);
    } on FirebaseAuthException catch (error, stackTrace) {
      return left(
        SignUpAuthException(
          message: error.message ?? 'An error occurred while signing up.',
          stackTrace: stackTrace,
        ),
      );
    }
  }

  @override
  AsyncResult<bool> loginWithEmail(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return right(true);
    } on FirebaseAuthException catch (error, stackTrace) {
      return left(
        LogInAuthException(
          message: error.message ?? 'An error occurred while logging in.',
          stackTrace: stackTrace,
        ),
      );
    }
  }

  @override
  UserAuthCredential? getCurrentUser() {
    try {
      final firebaseUser = _auth.currentUser;

      if (firebaseUser == null) return null;

      return UserAuthCredentialAdapter.fromFirebase(firebaseUser);
    } on FirebaseAuthMultiFactorException catch (error, stackTrace) {
      throw GetCurrentUserAuthException(
        message: error.message ?? '',
        stackTrace: stackTrace,
      );
    }
  }

  /// Signs out the currently authenticated user.
  ///
  /// This method signs out the current user from Firebase Authentication.
  ///
  /// - Throws: [SignOutAuthException] if an error occurs during the sign-out process.
  @override
  AsyncResult<bool> signOut() async {
    try {
      await _auth.signOut();

      return right(true);
    } on FirebaseAuthException catch (error, stackTrace) {
      return left(
        SignOutAuthException(
          message: error.message ?? 'An error occurred while signing out.',
          stackTrace: stackTrace,
        ),
      );
    }
  }
}
