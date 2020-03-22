import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}
class Item {
  const Item(this.name,this.icon);
  final String name;
  final Icon icon;
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<String> _locations = ['GENRAL', 'BC', 'OBC', 'SC','ST']; // Option 2
  String _selectedLocation;
  int selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

// Changes the selected value on 'onChanged' click on each radio button
  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: new SafeArea(
            top: false,
            bottom: false,
            child: new Form(
                key: _formKey,
                autovalidate: true,
                child: new ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(60.0, 110.0, 0.0, 0.0),
                      child: Text('Sign-Up',
                        style: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    new TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.person_outline),
                        hintText: 'Enter Your Roll No./Employee ID',
                        labelText: 'USERNAME',
                      ),
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                    ),
                    new TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.person),
                        hintText: 'Enter Your First and Last name',
                        labelText: 'Full Name'
                      ),
                    ),
                    new TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.calendar_today),
                        hintText: 'Enter your date of birth',
                        labelText: 'Dob',
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 0.0, 0.0),
                      child: Text('Gender',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text('Male'),
                        Radio(
                          value: 1,
                          groupValue: selectedRadio,
                          activeColor: Colors.green,
                          onChanged: (val) {
                            print("Radio $val");
                            setSelectedRadio(val);
                          },
                        ),
                        new Text('Female'),
                        Radio(
                          value: 2,
                          groupValue: selectedRadio,
                          activeColor: Colors.blue,
                          onChanged: (val) {
                            print("Radio $val");
                            setSelectedRadio(val);
                          },
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 0.0, 0.0),
                      child: Text('Category',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    new Center(
                      child:  DropdownButton(
                        hint: Text('Please choose a Category'), // Not necessary for Option 1
                        value: _selectedLocation,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedLocation = newValue;
                          });
                        },
                        items: _locations.map((location) {
                          return DropdownMenuItem(
                            child: new Text(location),
                            value: location,
                          );
                        }).toList(),
                      ),
                    ),
                    new TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.phone),
                        hintText: 'Enter a phone number',
                        labelText: 'Phone',
                      ),
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                    ),
                    new TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.email),
                        hintText: 'Enter a email address',
                        labelText: 'Email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    new TextFormField(
                      decoration: const InputDecoration(
                          icon: const Icon(Icons.person),
                          hintText: 'Enter Your Religion eg. Hindu/Muslim',
                          labelText: 'Religion'
                      ),
                    ),
                    new TextFormField(
                      decoration: const InputDecoration(
                          icon: const Icon(Icons.group),
                          hintText: 'Enter Your Blood Group',
                          labelText: 'Blood Group'
                      ),
                    ),
                    new TextFormField(
                      decoration: const InputDecoration(
                          icon: const Icon(Icons.add_location),
                          hintText: 'Enter Your Complete Address',
                          labelText: 'Address'
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.green,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {},
                          child: Center(
                            child: Text(
                              'SUBMIT',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  SizedBox(height: 20.0),
                  Container(
                    height: 40.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child:
                        Center(
                          child: Text('Go Back',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat')),
                        ),
                      ),
                    ),
                  ),
          ],
        )))
    );
  }
}
