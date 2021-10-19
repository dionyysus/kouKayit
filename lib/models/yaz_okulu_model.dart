import 'package:cloud_firestore/cloud_firestore.dart';

class YazOkuluBasvuruModel {
  String? id;
  String? ogrenciAd;
  String? ogrenciTc;
  String? ogrenciDogumtarih;
  String? ogrenciEmail;
  String? ogrenciGsm;
  String? ogrenciAdres;
  String? danismanAd;
  String? basvurulanUniversite;
  String? yazOkuluBaslamaBitisTarihi;
  String? kalinanDersinAdiKodu;
  String? alinacakDersinAdiKodu;
  String? bolumBaskaniAdi;
  String? basvuruDurumu;

  YazOkuluBasvuruModel(
      {this.id,
      this.ogrenciAd,
      this.ogrenciTc,
      this.ogrenciDogumtarih,
      this.ogrenciEmail,
      this.ogrenciGsm,
      this.ogrenciAdres,
      this.danismanAd,
      this.basvurulanUniversite,
      this.yazOkuluBaslamaBitisTarihi,
      this.kalinanDersinAdiKodu,
      this.alinacakDersinAdiKodu,
      this.bolumBaskaniAdi,
      this.basvuruDurumu});

  factory YazOkuluBasvuruModel.fromSnapshot(DocumentSnapshot snapshot) {
    return YazOkuluBasvuruModel(
        id: snapshot.id,
        ogrenciAd: snapshot["ogrenciAd"],
        ogrenciTc: snapshot["ogrenciTc"],
        ogrenciDogumtarih: snapshot["ogrenci"],
        ogrenciEmail: snapshot["ogrenciEmail"],
        ogrenciGsm: snapshot["ogrenciGsm"],
        ogrenciAdres: snapshot["ogrenciAdres"],
        danismanAd: snapshot["danismanAd"],
        basvurulanUniversite: snapshot["basvurulanUniversite"],
        yazOkuluBaslamaBitisTarihi: snapshot["yazOkuluBaslamaBitisTarihi"],
        kalinanDersinAdiKodu: snapshot["kalinanDersinAdiKodu"],
        alinacakDersinAdiKodu: snapshot["alinacakDersinAdiKodu"],
        bolumBaskaniAdi: snapshot["bolumBaskaniAdi"],
        basvuruDurumu: snapshot["basvuruDurumu"]);
  }
}
