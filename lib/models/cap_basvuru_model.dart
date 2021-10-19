import 'package:cloud_firestore/cloud_firestore.dart';

class CapBasvuruModel {
  String? id;
  String? ogrenciAd;
  String? ogrenciTc;
  String? ogrenciDogumtarih;
  String? ogrenciEmail;
  String? ogrenciGsm;
  String? ogrenciAdres;
  String? ogrenciFakulte;
  String? ogrenciBolum;
  String? ogretimTuru;
  String? ogrenciYariyil;
  String? ogrenciDisiplin;
  String? ogrenciNotOrt;
  String? ogrenciNumarasi;
  String? basvurulanFakulte;
  String? basvurulanBolum;
  String? basvurulanOgretimTuru;
  String? basvurulanSinif;
  String? basvuruDurumu;

  CapBasvuruModel(
      {this.id,
      this.ogrenciAd,
      this.ogrenciTc,
      this.ogrenciDogumtarih,
      this.ogrenciEmail,
      this.ogrenciGsm,
      this.ogrenciAdres,
      this.ogrenciFakulte,
      this.ogrenciBolum,
      this.ogrenciYariyil,
      this.ogretimTuru,
      this.ogrenciDisiplin,
      this.ogrenciNotOrt,
      this.ogrenciNumarasi,
      this.basvurulanFakulte,
      this.basvurulanBolum,
      this.basvurulanSinif,
      this.basvurulanOgretimTuru,
      this.basvuruDurumu});

  factory CapBasvuruModel.fromSnapshot(DocumentSnapshot snapshot) {
    return CapBasvuruModel(
        id: snapshot.id,
        ogrenciAd: snapshot["ogrenciAd"],
        ogrenciTc: snapshot["ogrenciTc"],
        ogrenciDogumtarih: snapshot["ogrenci"],
        ogrenciEmail: snapshot["ogrenciEmail"],
        ogrenciGsm: snapshot["ogrenciGsm"],
        ogrenciAdres: snapshot["ogrenciAdres"],
        ogrenciFakulte: snapshot["ogrenciFakulte"],
        ogrenciBolum: snapshot["ogrenciBolum"],
        ogrenciYariyil: snapshot["ogrenciYariyil"],
        ogretimTuru: snapshot["ogretimTuru"],
        ogrenciDisiplin: snapshot["ogrenciDisiplin"],
        ogrenciNotOrt: snapshot["ogrenciNotOrt"],
        ogrenciNumarasi: snapshot["ogrenciNumarasi"],
        basvurulanFakulte: snapshot["basvurulanFakulte"],
        basvurulanBolum: snapshot["basvurulanBolum"],
        basvurulanSinif: snapshot["basvurulanSinif"],
        basvurulanOgretimTuru: snapshot["basvurulanOgretimTuru"],
        basvuruDurumu: snapshot["basvuruDurumu"]);
  }
}
