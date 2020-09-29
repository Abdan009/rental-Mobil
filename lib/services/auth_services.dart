part of 'services.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static Future<SignInSignOutResult> signUp(
      String email,
      String password,
      String nama,
      DateTime tanggalLahir,
      String nomorHp,
      String alamat,
      String gender,
      String foto,
      String role) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Users user = result.user.convertToUser(
          nama: nama,
          tanggalLahir: tanggalLahir,
          nomorHp: nomorHp,
          alamat: alamat,
          gender: gender,
          foto: foto,
          role: role);
      UserServices.updateUser(user);
      return SignInSignOutResult(user: user);
    } catch (e) {
      return SignInSignOutResult(message: e.toString().split(',')[1].trim());
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {}
  }

  static Stream<FirebaseUser> get userStream => _auth.onAuthStateChanged;

  static Future<SignInSignOutResult>signIn(String email, String password) async{
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);

      Users user = await result.user.fromFireStore();

      return SignInSignOutResult(user: user);
      
    } catch (e) {
      return SignInSignOutResult(message: e.toString().split(',')[1].trim());
    }
  }
}
class ResetPassword{
  final String message;

  ResetPassword({this.message});
}


class SignInSignOutResult {
  final Users user;
  final String message;

  SignInSignOutResult({this.user, this.message});
}
