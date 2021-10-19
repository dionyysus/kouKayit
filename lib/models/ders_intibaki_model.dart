import 'package:cloud_firestore/cloud_firestore.dart';

class DersIntibakiModel {
  String? id;
  String? ogrenciAd;
  String? ogrenciNumarasi;
  String? ogrenciEmail;
  String? ogrenciGsm;
  String? ogrenciFakulte;
  String? ogrenciBolum;
  String? dersAdi;
  String? ogrenciDanisman;
  String? bolumBaskan;
  String? basvuruDurumu;

  DersIntibakiModel(
      {this.id,
      this.ogrenciAd,
      this.ogrenciNumarasi,
      this.ogrenciEmail,
      this.ogrenciGsm,
      this.ogrenciFakulte,
      this.ogrenciBolum,
      this.dersAdi,
      this.ogrenciDanisman,
      this.bolumBaskan,
      this.basvuruDurumu});

  factory DersIntibakiModel.fromSnapshot(DocumentSnapshot snapshot) {
    return DersIntibakiModel(
        id: snapshot.id,
        ogrenciAd: snapshot["ogrenciAd"],
        ogrenciNumarasi: snapshot["ogrenciNumarasi"],
        ogrenciEmail: snapshot["ogrenciEmail"],
        ogrenciGsm: snapshot["ogrenciGsm"],
        ogrenciFakulte: snapshot["ogrenciFakulte"],
        ogrenciBolum: snapshot["ogrenciBolum"],
        dersAdi: snapshot["dersAdi"],
        ogrenciDanisman: snapshot["ogrenciDanisman"],
        bolumBaskan: snapshot["bolumBaskan"],
        basvuruDurumu: snapshot["basvuruDurumu"]);
  }
}
