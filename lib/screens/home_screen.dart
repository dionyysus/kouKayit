import 'package:basvurukayit/screens/login_ekrani.dart';
import 'package:basvurukayit/screens/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(children: <Widget>[
        SizedBox(
          height: 60.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/logo.png'),
              height: 150.0,
              width: 120.0,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Text(
                'Kocaeli Üniversitesi Başvuru Kayıt Sistemi',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.green,
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            ElevatedButton(
              child: Text('Sisteme Kayıt Ol'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                padding: (EdgeInsets.fromLTRB(10, 10, 10, 10)),
                textStyle: TextStyle(
                  fontSize: 20,
                ),
                shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              child: Text('Sisteme Giriş Yap'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginEkrani()));
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding: (EdgeInsets.fromLTRB(10, 10, 10, 10)),
                  textStyle: TextStyle(
                    fontSize: 20,
                  ),
                  shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
              ),
            )
          ],
        ),
      ]),
    );
  }
}
