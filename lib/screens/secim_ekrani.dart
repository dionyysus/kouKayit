import 'package:basvurukayit/models/user_model.dart';
import 'package:basvurukayit/screens/basvuru_goruntuleme/yatay_gecis_goruntuleme.dart';
import 'package:basvurukayit/screens/intibak_basvuru_ekrani.dart';
import 'package:basvurukayit/screens/login_ekrani.dart';
import 'package:basvurukayit/screens/yatay_gecis_basvuru_ekrani.dart';
import 'package:basvurukayit/screens/yaz_okulu_basvuru_ekrani.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecimEkrani extends StatefulWidget {
  const SecimEkrani({Key? key}) : super(key: key);

  @override
  _SecimEkraniState createState() => _SecimEkraniState();
}

class _SecimEkraniState extends State<SecimEkrani> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("${loggedInUser.userName}"),
              accountEmail: Text("${loggedInUser.email}"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage("${loggedInUser.resimUrl}"),
              ),
            ),

            ListTile(
              title: Text('Anasayfa'),
              leading: Icon(
                Icons.home,
              ),
              onTap: () {},
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text('Yatay Geçiş Başvuru Formu'),
              leading: Icon(
                Icons.home,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => YatayGecisBasvuru()));
              },
            ),
            ListTile(
              title: Text('DGS başvuru formu'),
              leading: Icon(
                Icons.home,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => YatayGecisBasvuru()));
              },
            ),
            ListTile(
              title: Text('Yaz okulu dilekçesi'),
              leading: Icon(
                Icons.home,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => YazOkuluBasvuru()));
              },
            ),
            ListTile(
              title: Text('İntibak başvuru dilekçesi'),
              leading: Icon(
                Icons.home,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => IntibakBasvuru()));
              },
            ),
            ListTile(
              title: Text('Çap başvurusu'),
              leading: Icon(
                Icons.home,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => YatayGecisBasvuru()));
              },
            ),
            Divider(
              color: Colors.black,
            ),
            ExpansionTile(
              leading: Icon(
                Icons.save
              ),
              title: Text("Kayıtlı Başvurularım"),
              children: [
                ListTile(
                  title: Text('Yatay Geçiş Başvurularım'),
                  leading: Icon(
                    Icons.home,
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>YatayGecisGoruntuleme()));
                  },
                ),
                ListTile(
                  title: Text('İntibak Başvurularım'),
                  leading: Icon(
                    Icons.home,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('ÇAP Başvurularım'),
                  leading: Icon(
                    Icons.home,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Yaz Okulu Başvurularım'),
                  leading: Icon(
                    Icons.home,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('DGS Başvurularım'),
                  leading: Icon(
                    Icons.home,
                  ),
                  onTap: () {},
                ),
              ],
            ),
            Divider(color: Colors.black,),
            ListTile(
              title: Text('Çıkış Yap'),
              leading: Icon(
                Icons.logout,
              ),
              onTap: () {
                cikisYap(context);
              },
            )
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 150,
                child:
                    Image.asset("assets/images/logo.png", fit: BoxFit.contain),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Giriş Bilgileri",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text("  Kullanıcı Ad-Soyad : ${loggedInUser.userName}",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
              Text("Kullanıcı E-mail :  ${loggedInUser.email}",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
              Text("Kullanıcı GSM     : ${loggedInUser.gsm}",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
              Text("Kayıtlı olunan Üniversite    : ${loggedInUser.universite}",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
              Text("Kayıtlı olunan fakülte/myo    : ${loggedInUser.fakulte}",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
              Text("Kayıtlı olunan bölüm/program    : ${loggedInUser.bolum}",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 15,
              ),
              ActionChip(
                  label: Text("Çıkış Yap"),
                  onPressed: () {
                    cikisYap(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> cikisYap(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginEkrani()));
  }
}
