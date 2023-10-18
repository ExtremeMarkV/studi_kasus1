import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final biodata = <String,String>{};
  
  MyApp({super.key}){
    biodata['name'] = 'Oghma';
    biodata['email'] = 'dwarfmachine@gmail.com';
    biodata['phone'] = '+6282242770202';
    biodata['image'] = 'oghma.jpg';
    biodata['hobby'] = 'Pahlawan Anonymus';
    biodata['alamat'] = 'didalam Meja Makan';
    biodata['desk'] = """Oghma is a giant mecha robot. 2.1m tall and weighs 527kg. A gnome inventor created by renovating an invaders armor. Nobody except the inventor and the invader would know exactly what basic materials have been used. it can attack with a giant sword, and it can equip up to 6 missiles in the magazine behind its head. It can also create a vibration field and convey pressure on specific targeted areas by vibrating its body.""";



  }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Biodata',
      home: Scaffold(
        appBar: AppBar(title: const Text("Aplikasi Biodata")),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              teksContainer(Colors.black,biodata['name'] ?? ''),
              Image(image: AssetImage('assets/${biodata["image"] ?? ''}')),
              SizedBox(height: 10),
              Row(
                children: [
                  btnElevated(Icons.alternate_email, Colors.green,"mailto:${biodata['email']}"),
                  btnElevated(Icons.mark_email_unread_rounded, Colors.blueAccent,"https://wa.me/${biodata['phone']}"),
                  btnElevated(Icons.phone, Colors.deepPurple,"tel:${biodata['phone']}")
                ],
              ),
              SizedBox(height: 10),
              teksAtribut("Hobby", biodata['hobby'] ?? ''),
              teksAtribut("Alamat", biodata['alamat'] ?? ''),
              SizedBox(height: 10),
              teksContainer(Colors.black38,"Deskripsi"),
              SizedBox(height: 10),
              Text(biodata['desk'] ?? '', style: TextStyle(fontSize: 16),
              textAlign: TextAlign.left,)
            ],
          ),

        ),
      )
    );
  }

  Container teksContainer(Color bgcolor, String teks) {
    return Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(color: bgcolor),
              child: Text(teks,style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white), 
                ),
            );
  }

  Row teksAtribut(String judul, String teks) {
    return Row(
              children: [
                Container(
                  width: 100,
                  child: Text("- $judul",style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20
                  )),
                ),
                Text(":", style: TextStyle(fontSize: 18)),
                Text(teks,style: TextStyle(fontSize: 18),)
              ],
            );
  }

  Expanded btnElevated(IconData icon,var color, String uri) {
    return Expanded(
                child :ElevatedButton(
                  onPressed: () {
                    launch(uri);
                  }, 
                child: Icon(icon),
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white) ),
                ),
              );
  }

  void launch(String uri) async{
    if(!await launchUrl(Uri.parse(uri))){
        throw Exception("tidak dapat memanggil: $uri");
    }
  }
}
