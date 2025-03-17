import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test/api/firebase_api.dart';
import 'package:flutter_application_test/models/user_model.dart';
import 'package:flutter_application_test/providers/user_providers.dart';
import 'package:flutter_application_test/views/pages/auth/login_page.dart';
import 'package:flutter_application_test/views/pages/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  Map<String, dynamic> data = {};
  bool _isLoading = false;

  final _emailInput = TextEditingController();
  final _passwordInput = TextEditingController();
  final _nameInput = TextEditingController();
  final _phoneInput = TextEditingController();

  @override
  void dispose() {
    _emailInput.dispose();
    _passwordInput.dispose();
    _nameInput.dispose();
    _phoneInput.dispose();

    super.dispose();
  }

  String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.contains("+62")) {
      return phoneNumber.replaceFirst("+62", "0");
    }
    return phoneNumber;
  }

  Future<void> signupUser() async {
    FirebaseApi firebaseApi = FirebaseApi();

    final name = _nameInput.text;
    final email = _emailInput.text;
    final password = _passwordInput.text;
    final phoneNumber = formatPhoneNumber(_phoneInput.text);

    setState(() {
      _isLoading = true;
    });

    try {
      UserCredential? userCredential = await firebaseApi.signupUser(email, password, name, phoneNumber);

      if(userCredential != null) {
        await firebaseApi.setDataToFirebase(userCredential.user?.uid, "users", {
          "name": name,
          "email": email,
          "phoneNumber": phoneNumber,
          "isPersonalized": false,
        });

        final userModel = UserModel(
          id: userCredential.user!.uid,
          name: name,
          email: email,
          // You can add phoneNumber and other fields to your UserModel if needed
        );

        final userId = userCredential.user?.uid;

        if(userId != null) {
          print("Woi masuk");
          ref.read(userNotifierProvider.notifier).updateUser(userModel);
        }
        
        print("Signup Success");
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(builder: (context) => HomePage())
        );
      } else {
        print("Signup Failed");
      }
    } catch (e) {
      print("Error signup user: $e");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Signup", 
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,  
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Image.asset("assets/images/capy_login.png", width: 200),
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name", style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      TextField(
                        controller: _nameInput,
                        style: TextStyle(
                          fontSize: 14
                        ),
                        decoration: InputDecoration(
                          hintText: "Your Name",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(10.0)
                        ),
                        onTapOutside: (e) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                      ),
                      Text("Email", style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      TextField(
                        controller: _emailInput,
                        style: TextStyle(
                          fontSize: 14
                        ),
                        decoration: InputDecoration(
                          hintText: "Your Email",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(10.0)
                        ),
                        onTapOutside: (e) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                      ),
                      Text("Password", style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      TextField(
                        controller: _passwordInput,
                        style: TextStyle(
                          fontSize: 14
                        ),
                        decoration: InputDecoration(
                          hintText: "Your Password",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(10.0)
                        ),
                        onTapOutside: (e) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                      ),
                      Text("Phone Number", style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      TextField(
                        controller: _phoneInput,
                        style: TextStyle(
                          fontSize: 14
                        ),
                        decoration: InputDecoration(
                          hintText: "Your Phone Number",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(10.0)
                        ),
                        onTapOutside: (e) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            signupUser();
                            print('Hello');
                          }, 
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                            )
                          ),
                          child: _isLoading ? Text("Loading...") : Text("Signup")
                        ),
                      )
                  ]),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 3,
                      children: [
                        Text('Already have an account?', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey.shade700),),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(context, 
                            MaterialPageRoute(
                              builder: (context) {
                                return LoginPage();
                              }
                              )
                            );
                          },
                          child: Text(
                            'Login here', 
                            style: TextStyle(
                              fontWeight: FontWeight.w600, 
                              fontSize: 13,
                              color: Colors.grey.shade700),
                              )
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}