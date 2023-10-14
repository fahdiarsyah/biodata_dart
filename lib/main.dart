

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final biodata = <String, String>{};

  MainApp({super.key}){
    biodata['name'] = 'Kafka';
    biodata['email'] = 'unknown@';
    biodata['phone'] = 'Unknown Number';
    biodata['image'] = 'kafka.jpg';
    biodata['hobby'] = 'Shopping Mantel';
    biodata['addr'] = 'Stellaron Hunters';
    biodata['desc'] = '''A member of the Stellaron Hunters who is calm, collected, and beautiful. Her record on the wanted list of the Interastral Peace Corporation only lists her name and her hobby. People have always imagined her to be elegant, respectable, and in pursuit of things of beauty even in combat.''';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi Biodata",
      home: Scaffold(
        appBar: AppBar(title: const Text("Aplikasi Biodata")),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,children: [
              teksJudul(Colors.black, biodata['name'] ?? ''),
              Image(image: AssetImage('assets/${biodata["image"] ?? ''}')),
              SizedBox(height: 10,),
              Row(
                children: [
                  button(Icons.alternate_email, Colors.green[900], "mailto:${biodata['email']}"),
                  button(Icons.mark_email_unread_rounded, Colors.blueAccent, "https://wa.me/${biodata['phone']}"),
                  button(Icons.phone, Colors.deepPurple, "tel:${biodata['phone']}")
                  ],
              ),
              SizedBox(height: 10,),
              textAtribut("Hobby", biodata['hobby'] ?? ''),
              textAtribut("Faksi", biodata['addr'] ?? ''),
              SizedBox(height: 10,),
              teksJudul(Colors.black38, 'Deskripsi'),
              SizedBox(height: 10,),
              Text(
                biodata['desc'] ?? '',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
                ),
          ]),
        ),
      ),
    );
  }

  Container teksJudul(Color colorBg, String teks) {
    return Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(color: colorBg),
              child: Text(
                teks,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
                ),
            );
  }

  Row textAtribut(String judul, String isi) {
    return Row(
              children: [
                Container(
                  width: 90,
                  child: Text(" - $judul",
                   style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                Text(": ", style: TextStyle(fontSize: 18)),
                Text(isi, style: TextStyle(fontSize: 18))
                ],
            );
  }

  Expanded button(IconData icon, var color, String uri) {
    return Expanded(
                child: ElevatedButton(
                  onPressed: (){
                    launch(uri);
                  },
                  child: Icon(icon),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              );
  }

  void launch(String uri) async{
    if(!await launchUrl(Uri.parse(uri))) {
      throw Exception('Tidak dapat memanggil : $uri');
    }
  }
}
