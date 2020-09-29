part of 'services.dart';

class TransaksiServices {
  final String idKonsumen;
  final String idTransaksi;

  TransaksiServices({this.idTransaksi, this.idKonsumen});

  static CollectionReference _transaksiCollection =
      Firestore.instance.collection("transaksi");
  static CollectionReference _konsumenCollection =
      Firestore.instance.collection("users");
  static CollectionReference _mobilCollection =
      Firestore.instance.collection("mobil");

  static Future<void> updateTransaksi(Transaksi transaksi) {
    return _transaksiCollection.document(transaksi.id).setData({
      'idMobil': transaksi.idMobil,
      'idKonsumen': transaksi.idKonsumen,
      'totalHarga': transaksi.totalHarga,
      'lamaSewa': transaksi.lamaSewa,
      'waktuTransaksi': transaksi.waktuTransaksi.millisecondsSinceEpoch,
      'waktuSewa': transaksi.waktuSewa.millisecondsSinceEpoch,
      'waktuLamaSewa': transaksi.waktuLamaSewa.millisecondsSinceEpoch,
      'statusPembayaran': transaksi.statusPembayaran,
      'buktiPembayaran': transaksi.buktiPembayaran,
      'statusSewa': transaksi.statusSewa
    });
  }

  // List<Transaksi> _getTransaksi(QuerySnapshot snapshot) {
  //   List<Transaksi> listTransaksi = [];
  //   var documents = snapshot.documents
  //       .where((element) => element.data['idKonsumen'] == idKonsumen);

  //   for (var document in documents) {
  //     //Future<Users konsumen = UserServices.getUserFuture(document.data['idKonsumen']);
  //     listTransaksi.add(Transaksi(
  //         id: document.documentID,
  //         idMobil: document.data['idMobil'],
  //         idKonsumen: document.data['idKonsumen'],
  //         // mobil: mobil,
  //         // konsumen: konsumen,
  //         totalHarga: document.data['totalHarga'],
  //         lamaSewa: document.data['lamaSewa'],
  //         waktuTransaksi: DateTime.fromMillisecondsSinceEpoch(
  //             document.data['waktuTransaksi']),
  //         waktuSewa:
  //             DateTime.fromMillisecondsSinceEpoch(document.data['waktuSewa']),
  //         waktuLamaSewa: DateTime.fromMillisecondsSinceEpoch(
  //             document.data['waktuLamaSewa']),
  //         statusPembayaran: document.data['statusPembayaran'],
  //         buktiPembayaran: document.data['buktiPembayaran'],
  //         statusSewa: document.data['statusSewa']));
  //   }
  //   return listTransaksi;
  // }

  // Stream<List<Transaksi>> get transaksi {
  //   return _transaksiCollection.snapshots().map(_getTransaksi);
  // }

  Stream<List<Transaksi>> getDataTransaksi() async* {
    var listTransaksiStream = _transaksiCollection.snapshots();
    await for (var transaksiSnapshot in listTransaksiStream) {
      var listTransaksi = List<Transaksi>();

      var transaksiSelect;
      if (idKonsumen != null) {
        transaksiSelect = transaksiSnapshot.documents
            .where((element) => element.data['idKonsumen'] == idKonsumen)
            .toList();

      }else if(idTransaksi!=null){
        transaksiSelect =transaksiSnapshot.documents
            .where((element) => element.documentID == idTransaksi).toList();
      }
      else{
        transaksiSelect = transaksiSnapshot.documents;
      }
      for (var transaksiDoc in transaksiSelect) {
        var konsumenSnapshot = await _konsumenCollection
            .document(transaksiDoc.data['idKonsumen'])
            .get();
        var mobilSnapshot =
            await _mobilCollection.document(transaksiDoc.data['idMobil']).get();
        var transaksi = Transaksi(
            id: transaksiDoc.documentID,
            idMobil: transaksiDoc.data['idMobil'],
            idKonsumen: transaksiDoc.data['idKonsumen'],
            mobil: Mobil(
                id: mobilSnapshot.documentID,
                type: mobilSnapshot.data['type'],
                brand: mobilSnapshot.data['brand'],
                harga: mobilSnapshot.data['harga'],
                jenis: mobilSnapshot.data['jenis'],
                jumlah: mobilSnapshot.data['jumlah'],
                fotoMobil: mobilSnapshot.data['fotoMobil']),
            konsumen: Users(
                id: konsumenSnapshot.documentID,
                namaLengkap: konsumenSnapshot.data['namaLengkap'],
                email: konsumenSnapshot.data['email'],
                tanggalLahir: DateTime.fromMillisecondsSinceEpoch(
                    konsumenSnapshot.data['tanggalLahir']),
                nomorHp: konsumenSnapshot.data['nomorHp'],
                alamat: konsumenSnapshot.data['alamat'],
                foto: konsumenSnapshot.data['foto'],
                role: konsumenSnapshot.data['role'],
                gender: konsumenSnapshot.data['gender'] ?? ""),
            totalHarga: transaksiDoc.data['totalHarga'],
            lamaSewa: transaksiDoc.data['lamaSewa'],
            waktuTransaksi: DateTime.fromMillisecondsSinceEpoch(
                transaksiDoc.data['waktuTransaksi']),
            waktuSewa: DateTime.fromMillisecondsSinceEpoch(
                transaksiDoc.data['waktuSewa']),
            waktuLamaSewa: DateTime.fromMillisecondsSinceEpoch(
                transaksiDoc.data['waktuLamaSewa']),
            statusPembayaran: transaksiDoc.data['statusPembayaran'],
            buktiPembayaran: transaksiDoc.data['buktiPembayaran'],
            statusSewa: transaksiDoc.data['statusSewa']);
        listTransaksi.add(transaksi);
      }
      print(listTransaksi.length);
      yield listTransaksi;
    }
  }
}
