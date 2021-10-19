import 'package:basvurukayit/input_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _RegisterScreenState extends State<RegisterScreen> {
  late String _ad,
      _soyad,
      _gsm,
      _email,
      _kimlikNo,
      _evAdres,
      _isAdres,
      _dogumTarihi,
      _ogrenciNo,
      _universite,
      _fakulte,
      _bolum,
      _sinif;
  late DateTime _dateTime;
  TextEditingController _sifre = TextEditingController();
  TextEditingController _sifreTekrar = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _clearText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void clearForm() {
      _clearText.clear();
      setState(() {});
    }

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: CircleAvatar(
                    radius: 50.0,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Text(
                    'Yeni Kayıt Formu',
                    style: TextStyle(fontSize: 20.0, color: Colors.green),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {});
                    },
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(
                        Icons.account_circle,
                        'Ad',
                        IconButton(
                            onPressed: () {
                              clearForm;
                            },
                            icon: Icon(Icons.delete))),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Ad alanı boş bırakılamaz !";
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      _ad = value!;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(
                        Icons.account_circle,
                        'Soyad',
                        IconButton(
                            onPressed: () async {
                              setState(() {
                                clearForm();
                              });
                            },
                            icon: Icon(Icons.delete))),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Soyad alanı boş bırakılamaz !";
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      _soyad = value!;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: _dateController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        prefixIcon: IconButton(
                          onPressed: () async {
                            DateTime dateTime = DateTime.now();

                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            dateTime = (await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2200)))!;
                            final DateFormat formatter =
                                DateFormat('dd-MM-yyyy');
                            final String formatted = formatter.format(dateTime);
                            _dateController.text = formatted.toString();
                          },
                          icon: Icon(Icons.calendar_today),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide:
                              BorderSide(color: Colors.green, width: 1.5),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.5,
                          ),
                        ),
                        hintText: ('Doğum Tarihi')),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Doğum Tarihi boş bırakılamaz !";
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      _dogumTarihi = value!;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(
                        Icons.perm_identity,
                        'T.C Kimlik No',
                        IconButton(
                            onPressed: () {
                              clearForm();
                            },
                            icon: Icon(Icons.delete))),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "T.C no boş bırakılamaz !";
                      }
                      if (value!.length != 11) {
                        return "Geçerli bir T.C no giriniz !";
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      _kimlikNo = value!;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(
                        Icons.phone_iphone_sharp,
                        'İletişim Numarası',
                        IconButton(
                            onPressed: () {
                              clearForm();
                            },
                            icon: Icon(Icons.delete))),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "GSM alanı boş bırakılamaz !";
                      }
                      if (value!.length != 11) {
                        return "Lütfen geçerli bir gsm numarası girin";
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      _gsm = value!;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(
                        Icons.email,
                        "Email",
                        IconButton(
                            onPressed: () {
                              clearForm();
                            },
                            icon: Icon(Icons.delete))),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'E-mail alanı boş bırakılamaz !';
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return 'Lütfen geçerli bir e-mail adresi girin !';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      _email = value!;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(
                        Icons.house,
                        'Ev adresi',
                        IconButton(
                            onPressed: () {
                              clearForm();
                            },
                            icon: Icon(Icons.delete))),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Ev adresi boş bırakılamaz";
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      _evAdres = value!;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(
                        Icons.work,
                        'Varsa iş adresi',
                        IconButton(
                            onPressed: () {
                              setState(() {
                                clearForm();
                                print('silindi');
                              });
                            },
                            icon: Icon(Icons.delete))),
                    onSaved: (String? value) {
                      _isAdres = value!;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(
                        Icons.school,
                        'Üniversite',
                        IconButton(
                            onPressed: () {
                              clearForm();
                            },
                            icon: Icon(Icons.delete))),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Üniversite boş bırakılamaz";
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      _universite = value!;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(
                        Icons.school,
                        'Fakülte',
                        IconButton(
                            onPressed: () {
                              clearForm();
                            },
                            icon: Icon(Icons.delete))),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Fakülte boş bırakılamaz";
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      _universite = value!;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(
                        Icons.school,
                        'Bölüm',
                        IconButton(
                            onPressed: () {
                              clearForm();
                            },
                            icon: Icon(Icons.delete))),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Bölüm boş bırakılamaz";
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      _universite = value!;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(
                        Icons.school,
                        'Sınıf',
                        IconButton(
                            onPressed: () {
                              clearForm();
                            },
                            icon: Icon(Icons.delete))),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Sınıf alanı boş bırakılamaz";
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      _sinif = value!;
                    },
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: _sifre,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(
                        Icons.lock,
                        "Şifre",
                        IconButton(
                            onPressed: () {
                              clearForm();
                            },
                            icon: Icon(Icons.delete))),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Lütfen şifre girin !';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: _sifreTekrar,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(
                        Icons.lock,
                        "Şifre Tekrar",
                        IconButton(
                            onPressed: () {
                              clearForm();
                            },
                            icon: Icon(Icons.delete))),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Şireyi tekrar girin';
                      }
                      print(_sifre.text);
                      print(_sifreTekrar.text);
                      if (_sifre.text != _sifreTekrar.text) {
                        return "Şifreler eşleşmiyor !";
                      }
                      return null;
                    },
                  ),
                ),
                Wrap(children: [
                  ElevatedButton(
                    child: Text('Kayıt Ol'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print("başarılı");
                        return;
                      } else {
                        print("başarısız");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        padding: (EdgeInsets.fromLTRB(10, 10, 10, 10)),
                        textStyle: TextStyle(
                          fontSize: 20,
                        ),
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  ElevatedButton(
                    child: Text('Formu Temizle'),
                    onPressed: () {
                      _formKey.currentState!.reset();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        padding: (EdgeInsets.fromLTRB(10, 10, 10, 10)),
                        textStyle: TextStyle(
                          fontSize: 20,
                        ),
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                  ),
                ]),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
