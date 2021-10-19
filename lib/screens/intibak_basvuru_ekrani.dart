import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntibakBasvuru extends StatefulWidget {
  const IntibakBasvuru({Key? key}) : super(key: key);

  @override
  _IntibakBasvuruState createState() => _IntibakBasvuruState();
}

class _IntibakBasvuruState extends State<IntibakBasvuru> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(
       child: SingleChildScrollView(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Container(
               padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
               child: Text(
                 'KOCAELİ ÜNİVERSİTESİ'+ '.....' +    'FAKÜLTESİ DEKANLIĞINA',
                 style: TextStyle(
                   fontSize: 18.0,
                   color: Colors.black,
                 ),
               ),
             ),
             SizedBox(height: 10,),
             Padding(padding:const EdgeInsets.only(right: 250),child: Text('KİMLİK BİLGİLERİ',style: TextStyle(fontWeight: FontWeight.bold))),
             Padding(
               padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
               child: TextFormField(
                 decoration: InputDecoration(
                     border: OutlineInputBorder(),
                     labelText: 'Adı-Soyadı'),
               ),
             ),
             Padding(
               padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
               child: TextFormField(
                 decoration: InputDecoration(
                     border: OutlineInputBorder(),
                     labelText: 'Öğrenci No'),
               ),
             ),
             Padding(
               padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
               child: TextFormField(
                 decoration: InputDecoration(
                     border: OutlineInputBorder(),
                     labelText: 'Bölümü'),
               ),
             ),
             Padding(
               padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
               child: TextFormField(
                 decoration: InputDecoration(
                     border: OutlineInputBorder(),
                     labelText: 'GSM'),
               ),
             ),
             Padding(
               padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
               child: TextFormField(
                 decoration: InputDecoration(
                     border: OutlineInputBorder(),
                     labelText: 'E-mail'),
               ),
             ),

             Card(
               margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
               child: Padding(
                 padding: EdgeInsets.all(12),
                 child: Column(
                   children: [
                     Text(
                         'Daha önce …………………… Üniversitesi……………………… Fakültesi / Meslek Yüksek Okulu……………………………………..Bölümünde / Programında aldığım ve aşağıda belirttiğim ders / derslerden muaf olmak istiyorum.\nGereğinin yapılmasını arz ederim.'),

                     SizedBox(
                       height: 12,
                     ),
                     Text(
                       ' Tarih : ../.../...                                           Ad-Soyad İmza',
                     ),
                     SizedBox(
                       height: 15,
                     )
                   ],
                 ),
               ),
             ),
             SizedBox(height: 10,),
             Text('Daha önce aldığım dersin',style: TextStyle(fontWeight: FontWeight.bold),),
             SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               child: DataTable(
                 columnSpacing: 80.0,
                 columns: const <DataColumn>[
                   DataColumn(
                     label: Text(
                       ' Ders Adı        ',
                       style: TextStyle(fontWeight: FontWeight.bold),
                     ),
                   ),
                   DataColumn(
                     label: Text(
                       'T                 ',
                       style: TextStyle(fontWeight: FontWeight.bold),
                     ),
                   ),
                   DataColumn(
                     label: Text(
                       'U/L                           ',
                       style: TextStyle(fontWeight: FontWeight.bold),
                     ),
                   ),

                   DataColumn(
                     label: Text(
                       'K                           ',
                       style: TextStyle(fontWeight: FontWeight.bold),
                     ),
                   ),
                   DataColumn(
                     label: Text(
                       'AKTS                          ',
                       style: TextStyle(fontWeight: FontWeight.bold),
                     ),
                   ),


                 ],
                 rows: const <DataRow>[
                   DataRow(
                     cells: <DataCell>[
                       DataCell(Text('Öğrenci Danışmanı     '),showEditIcon: true),
                       DataCell(Text('BBBBBBBBB    '),showEditIcon: true),
                       DataCell(Text('          '),showEditIcon: true),
                       DataCell(Text('          '),showEditIcon: true),
                       DataCell(Text('          '),showEditIcon: true),

                     ],
                   ),
                   DataRow(
                     cells: <DataCell>[
                       DataCell(Text('Bölüm Başkanı'),showEditIcon: true),
                       DataCell(Text('B'),showEditIcon: true),
                       DataCell(Text('           '),showEditIcon: true),
                       DataCell(Text('           '),showEditIcon: true),
                       DataCell(Text('           '),showEditIcon: true),

                     ],
                   ),



                 ],
               ),
             ),

           ],
         ),
       ),
     ),
    );
  }
}
