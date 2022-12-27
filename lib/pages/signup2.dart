import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prometeo23/api/fetchUser.dart';
import 'package:prometeo23/constants.dart';
import 'package:prometeo23/pages/bottom_navigation_pages/home_page.dart';
import 'package:prometeo23/widgets/app_bar.dart';
import 'package:prometeo23/widgets/nav_drawer.dart';
import 'package:prometeo23/widgets/register_button.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp2 extends StatefulWidget {
  String firstName;
  String lastName;
  String email;
  String password;

  SignUp2({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
  });

  @override
  State<SignUp2> createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _referral_code,
      _contact,
      _gender = "Gender",
      _current_year = "Select Year",
      _college,
      _state = "Select State";
  bool? _accomodation = false;
  bool? _ambassador = false;
  bool isProcessing = false;

  var gender_items = [
    "Gender",
    "Male",
    "Female",
  ];
  var year_items = [
    "Select Year",
    "1",
    "2",
    "3",
    "4",
  ];

  var state_items = [
    'Select State',
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal",
    "Andaman and Nicobar Islands",
    "Chandigarh",
    "Dadra and Nagar Haveli",
    "Daman and Diu",
    "Delhi",
    "Lakshadweep",
    "Puducherry"
  ];

  register() async {
    setState(() {
      isProcessing = true;
    });
    if (_formKey != null &&
        _formKey.currentState != null &&
        _formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Map<String, dynamic> requestPayload = {
        "password": widget.password,
        "email": widget.email,
        "first_name": widget.firstName,
        "last_name": widget.lastName,
        "gender": _gender,
        "contact": _contact,
        "current_year": _current_year,
        "college": _college,
        "city": _state,
        "referral_code": _referral_code ?? "",
        "ca_count": 0,
        "accomodation": _accomodation! ? true : false,
        "ambassador": _ambassador! ? true : false
      };
      var url = Uri.parse('https://apiv.prometeo.in/api/signup/');

      var response = await http.post(
        url,
        body: jsonEncode(requestPayload),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      var body = jsonDecode(response.body);

      if (response.statusCode == 201) {
        setUser(widget.email);
        setState(() {
          isProcessing = false;
        });
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('SUCCESS'),
              content: Container(
                height: 75,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Registration Successful',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Registration ID: ${body['registration_id']}'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Text(
                    'OK',
                  ),
                ),
              ],
            );
          },
        );
      } else {
        setState(() {
          isProcessing = false;
        });
        showError("Internal Server Error");
      }
    }
  }

  showError(String errormessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ERROR'),
          content: Text(errormessage),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(0, 0, 0, 0),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
      drawer: NavDrawer(),
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Container(
          padding: universalPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CustomAppBar(),
              const SizedBox(
                height: 20,
              ),
              Text(
                "User Details",
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: TextFormField(
                        validator: (input) {
                          if (input != null && input.isEmpty)
                            return "Enter College";
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "College Name",
                          prefixIcon: Icon(Icons.school),
                        ),
                        onSaved: (input) => _college = input!,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: (input) {
                          if (input != null &&
                              input.isEmpty &&
                              input.length >= 10) return "Enter Phone number";
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Phone Number",
                          prefixIcon: Icon(Icons.call),
                        ),
                        onSaved: (input) => _contact = input!,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: size.width * 0.9,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            20,
                          ),
                        ),
                      ),
                      child: DropdownButtonFormField(
                        validator: (input) {
                          if (input != null &&
                              input.isEmpty &&
                              input == 'Gender') return "Select Gender";
                        },
                        // Initial Value
                        value: _gender,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: gender_items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            _gender = newValue!;
                          });
                        },
                        isExpanded: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.person),
                        ),
                        hint: Text(
                          "Select Gender",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        alignment: Alignment.centerRight,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: size.width * 0.9,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            20,
                          ),
                        ),
                      ),
                      child: DropdownButtonFormField(
                        validator: (input) {
                          if (input != null &&
                              input.isEmpty &&
                              input == 'Select Year') return "Enter Year";
                        },
                        // Initial Value
                        value: _current_year,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: year_items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            _current_year = newValue!;
                          });
                        },
                        isExpanded: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.numbers),
                        ),
                        hint: Text(
                          "Select Year",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        alignment: Alignment.centerRight,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: size.width * 0.9,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            20,
                          ),
                        ),
                      ),
                      child: DropdownButtonFormField(
                        validator: (input) {
                          if (input != null &&
                              input.isEmpty &&
                              input == 'Select State') return "Enter State";
                        },
                        // Initial Value
                        value: _state,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: state_items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            _state = newValue!;
                          });
                        },
                        isExpanded: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.place),
                        ),
                        hint: Text(
                          "Select State",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        alignment: Alignment.centerRight,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: TextFormField(
                        validator: (input) {},
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Referral Code",
                          prefixIcon: Icon(Icons.group),
                        ),
                        onSaved: (input) => _referral_code = input!,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 10), //SizedBox
                        /** Checkbox Widget **/
                        Checkbox(
                          fillColor: MaterialStateProperty.all(
                            Colors.white,
                          ),
                          value: _ambassador,
                          onChanged: (bool? value) {
                            setState(() {
                              _ambassador = value!;
                            });
                          },
                        ), //Checkbox
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: size.width * 0.75,
                          child: Text(
                            'I want to signup for CA Program',
                            style: GoogleFonts.poppins(
                              fontSize: 12.0,
                              color: Colors.white,
                            ),
                            softWrap: true,
                          ),
                        ), //Text
                      ], //<Widget>[]
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 10), //SizedBox
                        /** Checkbox Widget **/
                        Checkbox(
                          fillColor: MaterialStateProperty.all(
                            Colors.white,
                          ),
                          value: _accomodation,
                          onChanged: (bool? value) {
                            setState(() {
                              _accomodation = value!;
                            });
                          },
                        ), //Checkbox
                        SizedBox(
                          width: 10,
                        ), //SizedBox
                        Container(
                          width: size.width * 0.75,
                          child: Text(
                            'I would like to avail accommodation at IIT Jodhpur campus and agree to abide by the guidelines of the same.',
                            style: GoogleFonts.poppins(
                              fontSize: 12.0,
                              color: Colors.white,
                            ),
                            softWrap: true,
                          ),
                        ), //Text
                      ], //<Widget>[]
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              // Spacer(),
              Container(
                height: size.height * 0.07,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  // color: Color(0xff096B65),
                  color: Color(0xff003959),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextButton(
                  onPressed: register,
                  child: Center(
                    child: isProcessing
                        ? CircularProgressIndicator()
                        : Text(
                            "Register",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
