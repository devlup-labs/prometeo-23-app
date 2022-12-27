import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prometeo23/api/fetchUser.dart';
import 'package:prometeo23/constants.dart';
import 'package:prometeo23/pages/bottom_navigation_pages/home_page.dart';
import 'package:prometeo23/pages/signup2.dart';
import 'package:prometeo23/widgets/app_bar.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:prometeo23/widgets/bottom_navigation_bar.dart';
import 'package:prometeo23/widgets/nav_drawer.dart';
import 'package:prometeo23/widgets/register_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isProcessing = false;
  String? _email, _password;
  late FlutterGifController controller1;

  login() async {
    if (_formKey != null &&
        _formKey.currentState != null &&
        _formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        isProcessing = true;
      });
      Map<String, dynamic> requestPayload = {
        "email": _email,
        "password": _password
      };

      var url = Uri.parse('https://apiv.prometeo.in/api/login/');

      var response = await http.post(
        url,
        body: jsonEncode(requestPayload),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      var body = jsonDecode(response.body);

      if (response.statusCode == 200) {
        setUser(_email!);
        setState(() {
          isProcessing = false;
        });
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('SUCCESS'),
              content: Text('Login Successful!'),
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
        showError("Email or Password is incorrect!");
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
  void initState() {
    controller1 = FlutterGifController(
      vsync: this,
    );
    super.initState();
  }

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: NavDrawer(),
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Container(
          // padding: universalPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(
                  20,
                ),
                height: size.height * 0.4,
                decoration: BoxDecoration(
                  color: Color(0xff2C6C7A).withOpacity(.12),
                  // color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(750),
                    bottomRight: Radius.circular(750),
                  ),
                ),
                child: Column(
                  children: [
                    CustomAppBar(
                      isHomePage: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        height: size.height * 0.2,
                        // width: size.width / 2,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/prometeo.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: universalPadding,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              // color: Color(0xff061417),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: TextFormField(
                              validator: (input) {
                                if (input != null && input.isEmpty)
                                  return "Enter Password";
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                prefixIcon: Icon(Icons.lock),
                              ),
                              obscureText: true,
                              onSaved: (input) => _password = input!,
                            ),
                          ),
                          SizedBox(
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
                        color: Color(0xff003959),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextButton(
                        onPressed: login,
                        child: Center(
                          child: isProcessing
                              ? CircularProgressIndicator()
                              : Text(
                                  "Login",
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(currentIndex: -1),
    );
  }
}
