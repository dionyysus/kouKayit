import 'package:basvurukayit/screens/kayit_ekrani.dart';
import 'package:basvurukayit/screens/register_screen.dart';
import 'package:basvurukayit/screens/secim_ekrani.dart';
import 'package:basvurukayit/screens/yatay_gecis_basvuru_ekrani.dart';
import 'package:basvurukayit/service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginEkrani extends StatefulWidget {
  const LoginEkrani({Key? key}) : super(key: key);

  @override
  _LoginEkraniState createState() => _LoginEkraniState();
}

class _LoginEkraniState extends State<LoginEkrani> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ('E-mail alanı boş olamaz');
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Geçerli bir email adresi girin");
        }
        return null;
      },
      onSaved: (value) {
        _emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.mail,
            color: Colors.white,
          ),
          hintText: 'E-Mail',
          prefixText: ' ',
          hintStyle: TextStyle(color: Colors.white),
          focusColor: Colors.white,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          )),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
    );

    final passwordField = TextFormField(
        autofocus: false,
        controller: _passwordController,
        obscureText: true,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Şifre alanı boş bırakılamaz");
          }
          if (!regex.hasMatch(value)) {
            return ("Geçerli bir şifre girin(Min. 6 Karakter)");
          }
        },
        onSaved: (value) {
          _passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.vpn_key,
            color: Colors.white,
          ),
          hintText: 'Parola',
          prefixText: ' ',
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          focusColor: Colors.white,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          )),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          )),
        ));

    final loginButton = InkWell(
      onTap: () {
        girisYap(_emailController.text, _passwordController.text);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            //color: colorPrimaryShade,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
              child: Text(
            "Giriş yap",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          )),
        ),
      ),
    );

    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Container(
          height: size.height * .8,
          width: size.width * .85,
          decoration: BoxDecoration(
              color: Colors.green.withOpacity(.75),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.75),
                    blurRadius: 10,
                    spreadRadius: 2)
              ]),
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      height: 180,
                      child: Image.asset(
                        "assets/images/logo.png",
                        fit: BoxFit.contain,
                      )),
                  SizedBox(height: 45),
                  emailField,
                  SizedBox(
                    height: 25,
                  ),
                  passwordField,
                  SizedBox(
                    height: 35,
                  ),
                  loginButton,
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text('       Şifremi unuttum/sıfırla: '),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResetEkrani()));
                        },
                        child: Text(
                          "Sıfırla",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Sisteme kayıt olmak için:  '),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => KayitEkrani()));
                        },
                        child: Text(
                          "Kayıt Ol",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

  void girisYap(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Giriş Başarılı !"),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SecimEkrani())),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}

class ResetEkrani extends StatefulWidget {
  const ResetEkrani({Key? key}) : super(key: key);

  @override
  _ResetEkraniState createState() => _ResetEkraniState();
}

class _ResetEkraniState extends State<ResetEkrani> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final emailField = TextFormField(
      autofocus: false,
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ('E-mail alanı boş olamaz');
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Geçerli bir email adresi girin");
        }
        return null;
      },
      onSaved: (value) {
        _emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.mail,
            color: Colors.white,
          ),
          hintText: 'E-Mail',
          prefixText: ' ',
          hintStyle: TextStyle(color: Colors.white),
          focusColor: Colors.white,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          )),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
    );

    final passwordField = TextFormField(
        autofocus: false,
        controller: _passwordController,
        obscureText: true,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Şifre alanı boş bırakılamaz");
          }
          if (!regex.hasMatch(value)) {
            return ("Geçerli bir şifre girin(Min. 6 Karakter)");
          }
        },
        onSaved: (value) {
          _passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.vpn_key,
            color: Colors.white,
          ),
          hintText: 'Parola',
          prefixText: ' ',
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          focusColor: Colors.white,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          )),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          )),
        ));

    final sifreSifirlaButon = InkWell(
      onTap: () async {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: _emailController.text)
            .then((value) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginEkrani()));
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            //color: colorPrimaryShade,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
              child: Text(
            "Şifreyi sıfırla",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          )),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Şifre Sıfırlama'),
        backgroundColor: Colors.green.withOpacity(.75),
        shadowColor:Colors.grey.withOpacity(.75),
      ),
      body: Center(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              color: Colors.green.withOpacity(.75),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.75),
                    blurRadius: 10,
                    spreadRadius: 2)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 25,
              ),
              emailField,
              SizedBox(
                height: 15,
              ),
              sifreSifirlaButon,
            ],
          ),
        ),
      ),
    );
  }
}
