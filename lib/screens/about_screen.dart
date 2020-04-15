import 'package:flutter/material.dart';
import 'package:kanguka/widgets/appBar.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('A propos'),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        children: <Widget>[
          Text(
              "Réveillez-vous en priant et en louant le Seigneur tous les jours!",
              style: TextStyle(fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Image.asset("assets/images/chris_ndikumana.jpg"),
          ),
          Text(
              "An application broadcasting programs to spiritually awaken Christians to allow the Holy Spirit to do God's will."),
          SizedBox(
            height: 8.0,
          ),
          Center(
            child: Text("Chris Ndikumana"),
          ),
          SizedBox(
            height: 8.0,
          ),
          Center(
            child: Text("Contact"),
          ),
          SizedBox(
            height: 8.0,
          ),
          Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  dense: true,
                  leading: Image.asset("assets/images/whatsapp.png"),
                  title: Text('WhatsApp +257 76 80 13 27'),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              Card(
                child: ListTile(
                  dense: true,
                  leading: Image.asset("assets/images/facebook.png"),
                  title: Text('Facebook Chris-Ndikumana'),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              Card(
                child: ListTile(
                  dense: true,
                  leading: Image.asset("assets/images/youtube.png"),
                  title: Text('Youtube Chris-Ndikumana'),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              Card(
                child: ListTile(
                  dense: true,
                  leading: Image.asset("assets/images/gmail.png"),
                  title: Text('chrisndikumana357@gmail.com'),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Faire un don",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/images/world.png",
                    width: 18,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text("Tous les pays: PayPal (via Creekside)"),
                ],
              ),
              Divider(),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.only()),
                  hintText: 'Montant',
                ),
                style: TextStyle(height: .2),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 16.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.attach_money,
                        color: Colors.green,
                      ),
                      Text('Faire un don'),
                      Spacer(),
                      Image.asset('assets/images/paypal.png', width: 28),
                      SizedBox(width: 8.0,),
                      Image.asset('assets/images/visa_card.png', width: 28),
                      SizedBox(width: 8.0,),
                      Image.asset('assets/images/master_card.png', width: 28),
                      SizedBox(width: 8.0,),
                      Image.asset('assets/images/american_express.png',
                          width: 28),
                      Spacer(),
                      Icon(Icons.arrow_forward, color: Colors.grey,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({Key key}) : super(key: key);

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String dropdownValue = 'One';

  List<String> spinnerItems = ['One', 'Two', 'Three', 'Four', 'Five'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: <Widget>[
          DropdownButton<String>(
            value: dropdownValue,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.red, fontSize: 18),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String data) {
              setState(() {
                dropdownValue = data;
              });
            },
            items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Text('Selected Item = ' + '$dropdownValue',
              style: TextStyle(fontSize: 22, color: Colors.black)),
        ]),
      ),
    );
  }
}
