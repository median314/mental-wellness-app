import 'package:flutter/material.dart';
import 'package:flutter_application_test/views/pages/auth/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  Map<String, String> loginData = {
    "email": '',
    "password": ''
  };

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 20.0),
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
              InkWell(
                onTap: () {
                  print(loginData);
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(child: Text('Login', style: TextStyle(fontWeight: FontWeight.w500),)),
                ),
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
    );
  }
}