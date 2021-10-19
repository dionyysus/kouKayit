class FakulteModel {
  String? uid;
  String? fakulteAd;
  List<BolumModel>? bolumlerListesi;
  FakulteModel({this.uid,this.fakulteAd,this.bolumlerListesi});

  factory FakulteModel.fromMap(map){
    return FakulteModel(
      uid: map['uid'],
      fakulteAd: map['fakulteAd'],
      bolumlerListesi: map['bolumler']
    );
  }

}

class BolumModel  {
   String? bolumAd;

   BolumModel({this.bolumAd});




}