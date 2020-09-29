part of 'services.dart';

class UserServices {
  final String idUser;
  UserServices({this.idUser});
  static CollectionReference _userCollection =
      Firestore.instance.collection('users');

  static Future<void> updateUser(Users user) {
    return _userCollection.document(user.id).setData({
      'namaLengkap': user.namaLengkap,
      'email': user.email,
      'gender':user.gender,
      'tanggalLahir': user.tanggalLahir.millisecondsSinceEpoch,
      'nomorHp': user.nomorHp,
      'alamat': user.alamat,
      'foto': user.foto,
      'role': user.role
    });
  }

  static Future<Users> getUserFuture(String idUser) async {
    DocumentSnapshot snapshot = await _userCollection.document(idUser).get();

    return Users(
        id: idUser,
        namaLengkap: snapshot.data['namaLengkap'],
        email: snapshot.data['email'],
        tanggalLahir: DateTime.fromMillisecondsSinceEpoch(snapshot.data['tanggalLahir']),
        nomorHp: snapshot.data['nomorHp'],
        alamat: snapshot.data['alamat'],
        foto: snapshot.data['foto'],
        role: snapshot.data['role'],
        gender: snapshot.data['gender']??""
        );
  }

  Users _getUser(DocumentSnapshot snapshot) {
    return Users(
        id: snapshot.documentID,
        namaLengkap: snapshot.data['namaLengkap'],
        email: snapshot.data['email'],
        tanggalLahir: DateTime.fromMillisecondsSinceEpoch(snapshot.data['tanggalLahir']),
        nomorHp: snapshot.data['nomorHp'],
        alamat: snapshot.data['alamat'],
        foto: snapshot.data['foto'],
        role: snapshot.data['role'],
        gender: snapshot.data['gender']??""
        );
  }

   Stream<Users> get user {
    return _userCollection.document(idUser).snapshots().map(_getUser);
  }
}
