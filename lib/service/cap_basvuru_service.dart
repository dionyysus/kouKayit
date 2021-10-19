import 'package:basvurukayit/models/cap_basvuru_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CapBasvuruService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<CapBasvuruModel> basvuruOlustur(
      ogrenciAd,
      ogrenciTc,
      ogrenciDogumtarih,
      ogrenciEmail,
      ogrenciGsm,
      ogrenciAdres,
      ogrenciFakulte,
      ogrenciBolum,
      ogretimTuru,
      ogrenciYariyil,
      ogrenciDisiplin,
      ogrenciNotOrt,
      ogrenciNumarasi,
      basvurulanFakulte,
      basvurulanBolum,
      basvurulanOgretimTuru,
      basvurulanSinif,
      basvuruDurumu) async {
    var ref = _firestore.collection("cap_basvuru");
    basvuruDurumu = "onay bekliyor";
    var documentRef = await ref.add({
      'ogrenciAd': ogrenciAd,
      'ogrenciTc': ogrenciTc,
      'ogrenciDogumtarih': ogrenciDogumtarih,
      'ogrenciEmail': ogrenciEmail,
      'ogrenciGsm': ogrenciGsm,
      'ogrenciAdres': ogrenciAdres,
      'ogrenciFakulte': ogrenciFakulte,
      'ogrenciBolum': ogrenciBolum,
      'ogretimTuru': ogretimTuru,
      'ogrenciYariyil': ogrenciYariyil,
      'ogrenciDisiplin': ogrenciDisiplin,
      'ogrenciNotOrt': ogrenciNotOrt,
      'ogrenciNumarasi': ogrenciNumarasi,
      'basvurulanFakulte': basvurulanFakulte,
      'basvurulanBolum': basvurulanBolum,
      'bavurulanOgretimTuru': basvurulanOgretimTuru,
      'basvurulanSinif': basvurulanSinif,
      'basvuruDurumu': basvuruDurumu
    });
    return CapBasvuruModel(
        id: documentRef.id,
        ogrenciAd: ogrenciAd,
        ogrenciDogumtarih: ogrenciDogumtarih,
        ogrenciEmail: ogrenciEmail,
        ogrenciGsm: ogrenciGsm,
        ogrenciAdres: ogrenciAdres,
        ogrenciBolum: ogrenciBolum,
        ogretimTuru: ogretimTuru,
        ogrenciYariyil: ogrenciYariyil,
        ogrenciDisiplin: ogrenciDisiplin,
        ogrenciNotOrt: ogrenciNotOrt,
        ogrenciNumarasi: ogrenciNumarasi,
        basvurulanFakulte: basvurulanFakulte,
        basvurulanBolum: basvurulanBolum,
        basvurulanOgretimTuru: basvurulanOgretimTuru,
        basvuruDurumu: basvuruDurumu);
  }

  Stream<QuerySnapshot> basvurulariGetir() {
    var ref = _firestore.collection("cap_basvuru").snapshots();
    return ref;
  }
}
