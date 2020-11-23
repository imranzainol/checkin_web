import 'package:flutter/material.dart';
import 'Screens/Home/home_screen.dart';
import 'constant.dart';
import 'groupdatabase.dart';

class SignUp extends StatefulWidget {

  final Function onLogInSelected;

  SignUp({@required this.onLogInSelected});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _leaderController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    
    return Padding(
      padding: EdgeInsets.all(size.height > 770 ? 64 : size.height > 670 ? 32 : 16),
      child: Center(
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            height: size.height * (size.height > 770 ? 0.7 : size.height > 670 ? 0.8 : 0.9),
            width: 500,
            color: Colors.white,
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(
                        "Register Check In",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[700],
                        ),
                      ),

                      SizedBox(
                        height: 8,
                      ),

                      Container(
                        width: 30,
                        child: Divider(
                          color: kPrimaryColor,
                          thickness: 2,
                        ),
                      ),

                      SizedBox(
                        height: 32,
                      ),

                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Location',
                          labelText: 'Location',
                          suffixIcon: Icon(
                            Icons.home,
                          ),
                        ),
                        controller:_locationController,
                      ),

                      SizedBox(
                        height: 32,
                      ),

                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Creator Name',
                          labelText: 'Creator Name',
                          suffixIcon: Icon(
                            Icons.person,
                          ),
                        ),
                        controller:_leaderController,
                      ),

                      SizedBox(
                        height: 32,
                      ),

                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Contact Number',
                          labelText: 'Contact Number',
                          suffixIcon: Icon(
                            Icons.phone,
                          ),
                        ),
                        controller:_phoneNoController,
                      ),

                      SizedBox(
                        height: 64,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20,right: 20,top: 50),
                        child:RaisedButton(
                            onPressed: () {

                              groupSetup(_locationController.text,_leaderController.text,_phoneNoController.text);
                              Navigator.pushReplacement(context, MaterialPageRoute(
                                  builder: (BuildContext context) => HomeScreen(value: _locationController.text)));
                            },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          color: Color(0xFF039BE5),
                          child: Text("      Register Check In      ",
                          style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,fontSize: 20),),
                        padding: EdgeInsets.all(10),
                      )
                      ),
                      SizedBox(
                        height: 32,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          SizedBox(
                            width: 8,
                          ),

                          GestureDetector(
                            onTap: () {
                              widget.onLogInSelected();
                            },
                            child: Row(
                              children: [

                                SizedBox(
                                  width: 8,
                                ),

                                Icon(
                                  Icons.arrow_forward,
                                  color: kPrimaryColor,
                                ),
                                
                              ],
                            ),
                          ),

                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}