part of 'models.dart';

class Users extends Equatable {
  final String id;
  final String namaLengkap;
  final String email;
  final String gender;
  final DateTime tanggalLahir;
  final String nomorHp;
  final String alamat;
  final String foto;
  final String role; // pemilik atau konsumen

  Users(
      {@required this.id,
      @required this.namaLengkap,
      @required this.gender,
      @required this.email,
      @required this.tanggalLahir,
      @required this.nomorHp,
      @required this.alamat,
      @required this.foto,
      @required this.role});

  @override
  List<Object> get props =>
      [id, namaLengkap,gender, email, tanggalLahir, nomorHp, alamat, foto, role];

  Users copyWhite(
    {String namaLengkap,
    String email,
    DateTime tanggalLahir,
    String nomorHp,
    String alamat,
    String gender,
    String foto,}
  ) =>
      Users(
          id: this.id,
          namaLengkap: namaLengkap ?? this.namaLengkap,
          email: this.email,
          gender:gender?? this.gender,
          tanggalLahir: this.tanggalLahir,
          nomorHp: nomorHp?? this.nomorHp,
          alamat: alamat ?? this.alamat,
          foto: foto ?? this.foto,
          role: this.role);
}
