part of 'services.dart';

class MobilServices {
  final String idMobil;
  MobilServices({this.idMobil});

  static CollectionReference _mobilCollection =
      Firestore.instance.collection('mobil');

  static Future<void> updateMobil(Mobil mobil) async {
    await _mobilCollection.document(mobil.id).setData({
      'type': mobil.type,
      'brand': mobil.brand,
      'jenis': mobil.jenis,
      'harga': mobil.harga,
      'jumlah': mobil.jumlah,
      'fotoMobil': mobil.fotoMobil
    });
  }
  Mobil _getMobil(DocumentSnapshot document){
    return Mobil(
            id: document.documentID,
            type: document.data['type'],
            brand: document.data['brand'],
            harga: document.data['harga'],
            jenis: document.data['jenis'],
            jumlah: document.data['jumlah'],
            fotoMobil: document.data['fotoMobil']);
  }

  List<Mobil> _getMobils(QuerySnapshot snapshot) {
    return snapshot.documents
        .map((document) => Mobil(
            id: document.documentID,
            type: document.data['type'],
            brand: document.data['brand'],
            harga: document.data['harga'],
            jenis: document.data['jenis'],
            jumlah: document.data['jumlah'],
            fotoMobil: document.data['fotoMobil']
            
            )
            
            )
        .toList();
  }

  Stream<List<Mobil>> get mobil{
    return _mobilCollection.snapshots().map(_getMobils);
  }
  Stream<Mobil> get mobil1{
    return _mobilCollection.document(idMobil).snapshots().map(_getMobil);
  }

  static Future<void> deleteMobil(String idMobil){
    return _mobilCollection.document(idMobil).delete();
  }
}
