import 'package:flutter/material.dart';
import 'package:prometeo23/pages/bottom_navigation_pages/home_page.dart';
import 'package:prometeo23/widgets/bottom_navigation_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PreRegistration extends StatefulWidget {
  const PreRegistration({super.key});

  @override
  State<PreRegistration> createState() => _PreRegistrationState();
}

class _PreRegistrationState extends State<PreRegistration> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _email,
      _name,
      _college,
      _contact,
      _year = 'Select-Year',
      _state = 'Select-State';

  var year_items = [
    'Select-Year',
    'first-year',
    'second-year',
    'third-year',
    'fourth-year',
  ];

  var state_items = [
    'Select-State',
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
    if (_formKey != null &&
        _formKey.currentState != null &&
        _formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Map<String, dynamic> requestPayload = {
        "email": _email,
        "name": _name,
        "college": _college,
        "contact": _contact,
        "year": _year,
        "state": _state
      };

      var url = Uri.parse('https://apiv.prometeo.in/api/preregistration/');
      var response = await http.post(
        url,
        body: jsonEncode(requestPayload),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      var body = jsonDecode(response.body);
      if (response.statusCode == 201) {
        print("here");
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('SUCCESS'),
              // content: Text(body['message']),
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
        backgroundColor: Colors.transparent,
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
      backgroundColor: Color(0xff110F16),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          // height: size.height,
          padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: size.height * 0.2,
              top: size.height * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "PreRegistration",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: TextFormField(
                            validator: (input) {
                              if (input != null && input.isEmpty)
                                return "Enter Name";
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Name",
                              prefixIcon: Icon(Icons.person_add),
                            ),
                            onSaved: (input) => _name = input!,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: TextFormField(
                            validator: (input) {
                              if (input != null && input.isEmpty)
                                return "Enter Email";
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email",
                              prefixIcon: Icon(Icons.email),
                            ),
                            onSaved: (input) => _email = input!,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: TextFormField(
                            validator: (input) {
                              if (input != null && input.isEmpty)
                                return "Enter Phone number";
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: TextFormField(
                            validator: (input) {
                              if (input != null && input.isEmpty)
                                return "Enter College Name";
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "College",
                              prefixIcon: Icon(Icons.school),
                            ),
                            obscureText: false,
                            onSaved: (input) => _college = input!,
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
                            // Initial Value
                            value: _year,

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
                                _year = newValue!;
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
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Container(
                height: size.height * 0.07,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  color: Color(0xff575B5e),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextButton(
                  onPressed: register,
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: 3,
      ),
    );
  }
}
