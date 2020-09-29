part of 'models.dart';

class Transaksi extends Equatable {
  final String id;
  final String idMobil;
  final String idKonsumen;
  final Users konsumen;
  final Mobil mobil;
  final int totalHarga;
  final int lamaSewa;
  final DateTime waktuTransaksi;
  final DateTime waktuSewa;
  final DateTime waktuLamaSewa;
  final String statusPembayaran;
  final String buktiPembayaran;
  final String statusSewa;

  Transaksi(
      {this.id,
      @required this.idMobil,
      @required this.idKonsumen,
      this.konsumen,
      this.mobil,
      @required this.totalHarga,
      @required this.lamaSewa,
      @required this.waktuTransaksi,
      @required this.waktuSewa,
      @required this.waktuLamaSewa,
      @required this.statusPembayaran,
      @required this.buktiPembayaran,
      @required this.statusSewa});
  @override
  List<Object> get props => [
        id,
        idMobil,
        idKonsumen,
        konsumen,
        mobil,
        totalHarga,
        lamaSewa,
        waktuTransaksi,
        waktuSewa,
        waktuLamaSewa,
        statusPembayaran,
        buktiPembayaran,
        statusSewa
      ];

  Transaksi copyWhite({
    String statusPembayaran,
    String buktiPembayaran,
    String statusSewa,
  }) {
    return Transaksi(
        id:this.id,
        idMobil: this.idMobil,
        idKonsumen: this.idKonsumen,
        totalHarga: this.totalHarga,
        lamaSewa: this.lamaSewa,
        mobil:this.mobil,
        konsumen:this.konsumen,
        waktuTransaksi: this.waktuTransaksi,
        waktuSewa: this.waktuSewa,
        waktuLamaSewa: this.waktuLamaSewa,
        statusPembayaran: statusPembayaran ?? this.statusPembayaran,
        buktiPembayaran: buktiPembayaran?? this.buktiPembayaran ,
        statusSewa: statusSewa?? this.statusSewa
        );
  }
}
