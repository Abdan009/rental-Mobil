part of 'extensions.dart';

extension FirebaseUserExtennsion on FirebaseUser {
  Users convertToUser(
          {@required String nama,
          @required DateTime tanggalLahir,
          @required String nomorHp,
          @required String alamat,
          @required String gender,
          String foto = "",
          @required String role}) =>
      Users(
          id: this.uid,
          namaLengkap: nama,
          email: this.email,
          gender: gender,
          tanggalLahir: tanggalLahir,
          nomorHp: nomorHp,
          alamat: alamat,
          foto: foto,
          role: role);
  Future<Users> fromFireStore() async => await UserServices.getUserFuture(this.uid);
}
