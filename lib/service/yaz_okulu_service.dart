import 'package:basvurukayit/models/yaz_okulu_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class YazOkuluBasvuruService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<YazOkuluBasvuruModel> basvuruOlustur(
      ogrenciAd,
      ogrenciTc,
      ogrenciDogumtarih,
      ogrenciEmail,
      ogrenciGsm,
      ogrenciAdres,
      danismanAd,
      basvurulanUniversite,
      yazOkuluBaslamaBitisTarihi,
      kalinanDersinAdiKodu,
      alinacakDersinAdiKodu,
      bolumBaskaniAdi,
      basvuruDurumu) async {
    var ref = _firestore.collection("yaz_okul_basvuru");
    basvuruDurumu = "onay bekliyor";
    var documentRef = await ref.add({
      'ogrenciAd': ogrenciAd,
      'ogrenciTc': ogrenciTc,
      'ogrenciDogumtarih': ogrenciDogumtarih,
      'ogrenciEmail': ogrenciEmail,
      'ogrenciGsm': ogrenciGsm,
      'ogrenciAdres': ogrenciAdres,
      'danismanAd': danismanAd,
      'basvurulanUniversite': basvurulanUniversite,
      'yazOkuluBaslamaBitisTarihi': yazOkuluBaslamaBitisTarihi,
      'kalinanDersinAdiKodu': kalinanDersinAdiKodu,
      'alinacakDersinAdiKodu': alinacakDersinAdiKodu,
      'bolumBaskaniAdi': bolumBaskaniAdi,
      'basvuruDurumu': basvuruDurumu
    });
    return YazOkuluBasvuruModel(
        id: documentRef.id,
        ogrenciAd: ogrenciAd,
        ogrenciTc: ogrenciTc,
        ogrenciDogumtarih: ogrenciDogumtarih,
        ogrenciEmail: ogrenciEmail,
        ogrenciGsm: ogrenciGsm,
        ogrenciAdres: ogrenciAdres,
        danismanAd: danismanAd,
        basvurulanUniversite: basvurulanUniversite,
        yazOkuluBaslamaBitisTarihi: yazOkuluBaslamaBitisTarihi,
        kalinanDersinAdiKodu: kalinanDersinAdiKodu,
        alinacakDersinAdiKodu: alinacakDersinAdiKodu,
        bolumBaskaniAdi: bolumBaskaniAdi,
        basvuruDurumu: basvuruDurumu);
  }

  Stream<QuerySnapshot> basvurulariGetir() {
    var ref = _firestore.collection("yaz_okul_basvuru").snapshots();
    return ref;
  }
}
