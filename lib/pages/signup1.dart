import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prometeo23/constants.dart';
import 'package:prometeo23/pages/signup2.dart';
import 'package:prometeo23/widgets/app_bar.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:prometeo23/widgets/bottom_navigation_bar.dart';
import 'package:prometeo23/widgets/nav_drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUp1 extends StatefulWidget {
  const SignUp1({super.key});

  @override
  State<SignUp1> createState() => _SignUp1State();
}

class _SignUp1State extends State<SignUp1> with TickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _email, _firstName, _lastName, _password, _confirmPassword;
  late FlutterGifController controller1;

  next() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_password != _confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: bgColor,
            content: Text(
              'Passwords do not match',
              style: GoogleFonts.poppins(fontSize: 18, color: Colors.white),
            ),
          ),
        );
        return;
      } else {
        Map<String, dynamic> requestPayload = {"email": _email};
        var url = Uri.parse('https://apiv.prometeo.in/api/usercheck/');

        var response = await http.post(
          url,
          body: jsonEncode(requestPayload),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
        );

        var body = jsonDecode(response.body);

        if (response.statusCode == 200) {
          if (body['status code'] == 200 && body['success'] == "True") {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: bgColor,
                content: Text(
                  'Email already exists',
                  style: GoogleFonts.poppins(fontSize: 18, color: Colors.white),
                ),
              ),
            );
            return;
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUp2(
                  firstName: _firstName!,
                  lastName: _lastName!,
                  email: _email!,
                  password: _password!,
                ),
              ),
            );
          }
        }
      }
    }
  }

  @override
  void initState() {
    controller1 = FlutterGifController(
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: NavDrawer(),
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Container(
          padding: universalPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Signup",
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              Container(
                height: size.height * 0.2,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/prometeo_logo_23.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: const BorderRadius.all(Radius.circular(15))),
                      child: TextFormField(
                        validator: (input) {
                          if (input != null && input.isEmpty) {
                            return "Enter Name";
                          return null;
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "First Name",
                          prefixIcon: Icon(Icons.person_add),
                        ),
                        onSaved: (input) => _firstName = input!,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: const BorderRadius.all(Radius.circular(15))),
                      child: TextFormField(
                        validator: (input) {
                          if (input != null && input.isEmpty) {
                            return "Enter Name";
                          return null;
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Last Name",
                          prefixIcon: Icon(Icons.person),
                        ),
                        onSaved: (input) => _lastName = input!,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: const BorderRadius.all(Radius.circular(15))),
                      child: TextFormField(
                        validator: (input) {
                          if (input != null && input.isEmpty) {
                            return "Enter Email";
                          return null;
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email",
                          prefixIcon: Icon(Icons.email),
                        ),
                        onSaved: (input) => _email = input!,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: const BorderRadius.all(Radius.circular(15))),
                      child: TextFormField(
                        validator: (input) {
                          if (input != null && input.isEmpty) {
                            return "Enter Password";
                          return null;
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                          prefixIcon: Icon(Icons.lock),
                        ),
                        obscureText: true,
                        onSaved: (input) => _password = input!,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: const BorderRadius.all(Radius.circular(15))),
                      child: TextFormField(
                        validator: (input) {
                          if (input != null && input.isEmpty) {
                            return "Enter Password";
                          return null;
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Confirm Password",
                          prefixIcon: Icon(Icons.lock_person),
                        ),
                        obscureText: true,
                        onSaved: (input) => _confirmPassword = input!,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: size.height * 0.07,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  // color: Color(0xff096B65),
                  color: const Color(0xff003959),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextButton(
                  onPressed: next,
                  child: const Text(
                    "Next",
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
      bottomNavigationBar: BottomNavigation(currentIndex: -1),
    );
  }
}
