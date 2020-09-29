part of 'models.dart';

class Mobil extends Equatable {
  final String id;
  final String type;
  final String brand;
  final String jenis;
  final String harga;
  final int jumlah;
  final String fotoMobil;
  Mobil(
      {this.id,
      @required this.type,
      @required this.brand,
      @required this.harga,
      @required this.jenis,
      @required this.jumlah,
      @required this.fotoMobil});
  @override
  List<Object> get props => [id, type, brand, jenis, harga, jumlah, fotoMobil];

  Mobil copyWith({
    String type,
    String brand,
    String jenis,
    String harga,
    int jumlah,
    String fotoMobil,
  }) {
    return Mobil(
      id: this.id,
        type: type?? this.type,
        brand: brand ?? this.brand,
        harga: harga ?? this.harga,
        jenis: jenis ?? this.jenis,
        jumlah: jumlah ?? this.jumlah,
        fotoMobil: fotoMobil?? this.fotoMobil
        );
  }
}
