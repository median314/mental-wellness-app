import 'package:flutter/material.dart';
import 'package:flutter_application_test/data/notifiers.dart';
import 'package:flutter_application_test/views/pages/auth/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  String confirmedEmail = "app@test.com";
  String confirmedPassword = "123";

  Map<String, String> loginData = {
    "email": '',
    "password": ''
  };

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
                    decoration: InputDecoration(
                      hintText: "Your Email",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10.0)
                    ),
                    onChanged: (value) {
                      loginData["email"] = value;
                    },
                    onTapOutside: (e) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                  ),
                  Text("Password", style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Your Password",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10.0)
                    ),
                    onChanged: (value) {
                      setState(() {
                        loginData["password"] = value;
                      });
                    },
                    onTapOutside: (e) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                  ),
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
                            onLoginPressed(loginStatus);
                          }, 
                          child: Text("Login"))
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