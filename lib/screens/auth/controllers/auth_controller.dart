import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pasticceria/constants/constants.dart';
import 'package:pasticceria/models/user_model.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();

  //Variables
  final _auth = FirebaseAuth.instance;
  final Rxn<User?> firebaseUser = Rxn<User?>();
  final Rxn<UserModel?> firestoreUser = Rxn<UserModel?>();

  @override
  void onInit() {
    firebaseUser.value = _auth.currentUser;
    super.onInit();
  }

  //Will be load when app launches this func will be called and set the firebaseUser state
  @override
  void onReady() {
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setNewFirestoreStream);
  }

  _setNewFirestoreStream(User? firebaseUser) {
    firestoreUser.bindStream(streamFirestoreUser(firebaseUser));
  }

  Stream<UserModel?> streamFirestoreUser(User? firebaseUser) {
    return Strings.usersCollection
        .doc(firebaseUser?.uid)
        .snapshots()
        .map((event) => UserModel.fromMap(event.data()!));
  }

  /// If we are setting initial screen from here
  /// then in the main.dart => App() add CircularProgressIndicator()
  /* _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : Get.offAll(() => const Dashboard());
  } */

  Future<String?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (ex) {
      return ex.message;
    } catch (ex) {
      return ex.toString();
    }
    return null;
  }

  Future<void> logout() async => await _auth.signOut();
}
