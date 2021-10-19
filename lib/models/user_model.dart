import 'package:firebase_auth/firebase_auth.dart';

class UserModel {

  String? uid;
  String? email;
  String? userName;
  String? ogrenciNo;
  String? gsm;
  String? tcId;
  String? evAdres;
  String? isAdres;
  String? sinif;
  String? dogumTarihi;
  String? universite;
  String? fakulte;
  String? bolum;
  String? resimUrl;

  UserModel({this.uid, this.email, this.userName, this.ogrenciNo, this.gsm, this.tcId, this.evAdres, this.isAdres, this.sinif, this.dogumTarihi, this.universite, this.fakulte, this.bolum, this.resimUrl});

  // db den data çekmek için
  factory UserModel.fromMap(map){
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      userName: map['userName'],
      ogrenciNo: map['ogrenciNo'],
      gsm: map['gsm'],
      tcId: map['tcId'],
      evAdres: map['evAdres'],
      isAdres: map['isAdres'],
      sinif: map['sinif'],
      dogumTarihi: map['dogumTarihi'],
      universite: map['universite'],
      fakulte: map['fakulte'],
      bolum: map['bolum'],
      resimUrl: map['resimUrl'],
    );
  }

  // db ye veri kaydetmek için
  Map<String,dynamic> toMap(){
    return {
      'uid': uid,
      'email': email,
      'userName': userName,
      'ogrenciNo': ogrenciNo,
      'gsm': gsm,
      'tcId': tcId,
      'evAdres': evAdres,
      'isAdres': isAdres,
      'sinif': sinif,
      'dogumTarihi': dogumTarihi,
      'universite': universite,
      'fakulte': fakulte,
      'bolum': bolum,
      'resimUrl': resimUrl

    };
  }






  // alternatif map yöntemi....
/* Map<String,dynamic> toMap(UserModel user) {
    var data = Map<String, dynamic>();
    data["email"] = user.email;
    data["uid"] = user.uid;
    data["userName"] = user.userName;
    data["ogrenciNo"] = user.ogrenciNo;
    data["gsm"] = user.gsm;
    data["tcId"] = user.tcId;
    data["evAdres"] = user.evAdres;
    data["isAdres"] = user.isAdres;
    data["sinif"] = user.sinif;
    data["dogumTarihi"] = user.dogumTarihi;
    data["universite"] = user.universite;
    data["fakulte"] = user.fakulte;
    data["bolum"] = user.bolum;
    data["resimUrl"] = user.resimUrl;

    return data;
  }

 factory UserModel.fromMap(Map<String, dynamic> mapData) {
    this.email = mapData["email"];
    this.uid = mapData["uid"];
    this.userName = mapData["userName"];
    this.ogrenciNo = mapData["ogrenciNo"];
    this.gsm = mapData["gsm"];
    this.tcId = mapData["tcId"];
    this.evAdres = mapData["evAdres"];
    this.isAdres = mapData["isAdres"];
    this.sinif = mapData["sinif"];
    this.dogumTarihi = mapData["dogumTarihi"];
    this.universite = mapData["universite"];
    this.fakulte = mapData["fakulte"];
    this.bolum = mapData["bolum"];
    this.resimUrl = mapData["resimUrl"];
  }   */
}
