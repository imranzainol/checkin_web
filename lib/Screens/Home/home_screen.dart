import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Components/app_bar.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomeScreen extends StatefulWidget {

  final String value; 

  const HomeScreen({Key key,this.value}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState+
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  
  String qrData = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width  of our screen
    return Scaffold(
      body: Container(
        height: size.height,
        // it will take full width
        width: size.width,
        decoration: BoxDecoration(
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            CustomAppBar(),
            // It will cover 1/3 of free spaces
              Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Column(
                  children: [

                  Text(
                    "Location: "+ widget.value,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                    ),
                  ),

                  QrImage(
              //place where the QR Image will be shown
                      data: qrData,
                      size: 650.0,
                    ),

              Padding(
              padding: EdgeInsets.all(32),
              child: FlatButton(
                padding: EdgeInsets.all(32),
                onPressed: () async {
                  var docRef = await FirebaseFirestore.instance.collection("groups")
                      .where("groupName",isEqualTo:widget.value).get();
                  docRef.docs.forEach((result) {
                    print(result.id); 
                    setState(() {
                    qrData = result.id;
                    });
                  });

                },
                child: Text(
                  "          Generate QR          ",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.blue, width: 3.0),
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            )
                  ],
                ),
              ),
            ),
            
            // it will cover 2/3 of free spaces
          ],
        ),
      ),
    );
  }
}
