import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_test/models/user_model.dart';
import 'package:flutter_application_test/api/firebase_api.dart';

// Provider for Firebase Auth instance
final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

// Provider for FirebaseApi
final firebaseApiProvider = Provider<FirebaseApi>((ref) {
  return FirebaseApi();
});

// Provider for current Firebase user (Auth)
final authUserProvider = StreamProvider<User?>((ref) {
  return ref.watch(firebaseAuthProvider).authStateChanges();
});

// StateNotifier for managing the user data from Firestore
class UserNotifier extends StateNotifier<UserModel> {
  final FirebaseApi _firebaseApi;
  
  UserNotifier(this._firebaseApi) : super(UserModel.empty());
  
  // Load user data from Firestore
  Future<void> loadUserData(String userId) async {
    try {
      final documentSnapshot = await _firebaseApi.getSingleDataFromFirestore(userId, 'users');
      
      if (documentSnapshot.exists) {
        state = UserModel.fromSnapshot(documentSnapshot);
      }
    } catch (e) {
      print('Error loading user data: $e');
    }
  }
  
  // Update user data
  void updateUser(UserModel user) {
    state = user;
  }
  
  // Clear user data (logout)
  void clearUser() {
    state = UserModel.empty();
  }
}

// Provider for user data state notifier
final userNotifierProvider = StateNotifierProvider<UserNotifier, UserModel>((ref) {
  final firebaseApi = ref.watch(firebaseApiProvider);
  return UserNotifier(firebaseApi);
});

// Convenience provider to get the current user data
final userDataProvider = Provider<UserModel>((ref) {
  return ref.watch(userNotifierProvider);
});