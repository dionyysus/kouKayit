import 'package:basvurukayit/models/cap_basvuru_model.dart';
import 'package:basvurukayit/models/ders_intibaki_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DersIntibakService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<DersIntibakiModel> basvuruOlustur(
      ogrenciAd,
      ogrenciTc,
      ogrenciEmail,
      ogrenciGsm,
      ogrenciFakulte,
      ogrenciBolum,
      ogrenciNumarasi,
      dersAdi,
      ogrenciDanisman,
      bolumBaskani,
      basvuruDurumu) async {
    var ref = _firestore.collection("ders_intibaki_basvuru");
    basvuruDurumu = "onay bekliyor";
    var documentRef = await ref.add({
      'ogrenciAd': ogrenciAd,
      'ogrenciTc': ogrenciTc,
      'ogrenciEmail': ogrenciEmail,
      'ogrenciGsm': ogrenciGsm,
      'ogrenciFakulte': ogrenciFakulte,
      'ogrenciNumarasi': ogrenciNumarasi,
      'dersAdi': dersAdi,
      'ogrenciDanisman': ogrenciDanisman,
      'bolumBaskani': bolumBaskani,
      'basvuruDurumu': basvuruDurumu
    });
    return DersIntibakiModel(
        id: documentRef.id,
        ogrenciAd: ogrenciAd,
        ogrenciEmail: ogrenciEmail,
        ogrenciGsm: ogrenciGsm,
        ogrenciFakulte: ogrenciFakulte,
        ogrenciBolum: ogrenciBolum,
        ogrenciNumarasi: ogrenciNumarasi,
        dersAdi: dersAdi,
        ogrenciDanisman: ogrenciDanisman,
        bolumBaskan: bolumBaskani,
        basvuruDurumu: basvuruDurumu);
  }

  Stream<QuerySnapshot> basvurulariGetir() {
    var ref = _firestore.collection("ders_intibaki_basvuru").snapshots();
    return ref;
  }
}
