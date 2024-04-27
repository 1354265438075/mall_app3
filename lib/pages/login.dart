import 'package:flutter/material.dart';
import 'package:unnamed_app2/pages/Home_page.dart';
import 'package:unnamed_app2/pages/register.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  bool _isPasswordValid = false;
  bool _isEmailValid = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  bool _isFormValid() {
    return _isPasswordValid && _isEmailValid;
  }

  void _validatePassword(String value) {
    // Password should contain at least one letter and one number
    setState(() {
      _isPasswordValid = value.isNotEmpty && value.contains(RegExp(r'(?=.*[a-zA-Z])(?=.*\d)'));
    });
  }

  void _validateEmail(String value) {
    // Email should be in correct format with "@"
    setState(() {
      _isEmailValid = value.isNotEmpty && value.contains('@gmail.com');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login_image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20),
              child: Text(
                "Welcome Back,",
                style: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Discover Limitless Choices",
                style: TextStyle(
                  color: Colors.grey[350],
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 40,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 5,),
                child: Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).brightness==Brightness.light?Colors.white:Colors.black54
                    ),
                    child: Theme(
                      data: ThemeData(
                        brightness: Brightness.light, // Set brightness to light
                      ),
                      child: ListView(
                        children: [
                          SizedBox(height: 70,),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: TextFormField(
                              controller: _emailController,
                              onChanged: _validateEmail,
                              decoration: InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black, // Set border color to black
                                  ),
                                ),
                                hintText: "Email",
                                suffixIcon: _isEmailValid
                                    ? Icon(
                                  Icons.check,
                                  color: Colors.green,
                                )
                                    : null,
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.black,
                                ),
                                labelText: "Email",
                                labelStyle: TextStyle(color: Theme.of(context).brightness==Brightness.dark?Colors.white:Colors.grey),
                              ),
                              cursorColor: Colors.orangeAccent,
                            ),
                          ),
                          if (!_isEmailValid)
                            Padding(
                              padding: const EdgeInsets.only(left:20),
                              child: Text(
                                "not valid...",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: TextFormField(

                              controller: _passwordController,
                              onChanged: _validatePassword,
                              obscureText: true,
                              decoration: InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: OutlineInputBorder(

                                  borderSide: BorderSide(
                                      color: Colors.black// Set border color to black
                                  ),
                                ),
                                hintText: "Password",
                                suffixIcon: _isPasswordValid
                                    ? Icon(
                                  Icons.check,
                                  color: Colors.green,
                                )
                                    : null,
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                ),
                                labelText: "Password",
                                labelStyle: TextStyle(color: Theme.of(context).brightness==Brightness.dark?Colors.white:Colors.grey),
                              ),
                              cursorColor: Colors.orangeAccent,
                            ),
                          ),
                          if (!_isPasswordValid)
                            Padding(
                              padding: const EdgeInsets.only(left:20),
                              child: Text(
                                "not valid...",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25, top: 10, bottom: 40),
                            child: Text(
                              "forgot password?",
                              style: TextStyle(color: Colors.orange),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20),
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                minWidth: double.infinity,
                                height: 40,
                                onPressed: () {
                                  if (_isEmailValid && _isPasswordValid) {

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Home()),
                                    );
                                  }
                                }
                                 ,
                                color: Colors.orangeAccent,
                                child: Text(
                                  "LOGIN",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 40,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't Have An Account? ",
                                style: TextStyle(color: Theme.of(context).brightness==Brightness.light?Colors.grey:Colors.white),
                              ),
                              TextButton(


                                     onPressed: (){
                                       Navigator.push(context,  MaterialPageRoute(builder: (context) => Register()));
                                     },

                                child: Text(
                                  "Register Now",
                                  style: TextStyle(color: Colors.orange),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}