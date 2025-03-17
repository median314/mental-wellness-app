import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test/api/firebase_api.dart';
import 'package:flutter_application_test/data/notifiers.dart';
import 'package:flutter_application_test/providers/user_providers.dart';
import 'package:flutter_application_test/views/pages/auth/signup_page.dart';
import 'package:flutter_application_test/views/pages/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends ConsumerState<LoginPage> {
  final _emailInput = TextEditingController();
  final _passwordInput = TextEditingController();

  bool showErrorText = false;
  bool isLoading = false;

  Map<String, dynamic> data = {};

  Future<void> login() async {
    final email = _emailInput.text;
    final password = _passwordInput.text;

    setState(() {
      showErrorText = false;
      isLoading = true;
    });

    try {
      FirebaseApi firebaseApi = FirebaseApi();

      UserCredential? userCredential = await firebaseApi.loginUser(email, password);
      
      if(userCredential != null) {
        final userId = userCredential.user?.uid;

        print("data user nih bos: ${userCredential.user}");

        if(userId != null) {
          await ref.read(userNotifierProvider.notifier).loadUserData(userId);
        }
        
        print("Login Success");
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(builder: (context) => HomePage())
        );
      } else {
        setState(() {
          showErrorText = true;
        });
        print("Login Failed");
      }
    } catch (e) {
      print("Error occured: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login", 
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
                  Text("Email", style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  TextField(
                    controller: _emailInput,
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
                    decoration: InputDecoration(
                      hintText: "Your Password",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10.0)
                    ),
                    onTapOutside: (e) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                  ),
                  showErrorText ? Center(
                    child: SizedBox(
                      width: 250,
                      child: Text(
                        "Gagal Login. Pastikan email / password yang dimasukkan sudah benar", 
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w500, fontSize: 11),
                      )
                    ),
                  ) : SizedBox(),
                  ValueListenableBuilder(
                    valueListenable: isLogin,
                    builder: (context, loginStatus, child) {
                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10)
                          )
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                          onPressed: (){
                            login();
                            // onLoginPressed(loginStatus);
                          }, 
                          child: Text(
                            isLoading ? "Loading..." : "Login"
                          )
                        )
                      );
                    } 
                  ),
                  Text('Forgot password?', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14))
                ]),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 3,
                    children: [
                      Text('Don`t have an account?', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey.shade700),),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, 
                          MaterialPageRoute(
                            builder: (context) {
                              return SignupPage();
                            }
                            )
                          );
                        },
                        child: Text(
                          'Create here', 
                          style: TextStyle(
                            fontWeight: FontWeight.w600, 
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
    );
  }

  void onLoginPressed (loginState) {
    isLogin.value = !loginState;
  }
}