import 'package:flutter/material.dart';
import 'package:flutter_application_test/views/pages/auth/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  Map<String, String> signupData = {
    "email": "",
    "password": "",
    "phone_number": ""
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
                    signupData["email"] = value;
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
                      signupData["password"] = value;
                    });
                  },
                  onTapOutside: (e) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                ),
                Text("Phone Number", style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Your Phone Number",
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(10.0)
                  ),
                  onChanged: (value) {
                    setState(() {
                      signupData["phone_number"] = value;
                    });
                  },
                  onTapOutside: (e) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                ),
                InkWell(
                  onTap: () {
                    print(signupData);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Center(child: Text('Signup', style: TextStyle(fontWeight: FontWeight.w500),)),
                  ),
                ),
            ]),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 3,
                children: [
                  Text('Already have an account?', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey.shade700),),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context, 
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