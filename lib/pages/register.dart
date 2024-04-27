import 'package:flutter/material.dart';
import 'package:unnamed_app2/pages/login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  bool _isPasswordValid = false;
  bool _isEmailValid = false;
  bool _isFirstNameValid = false;
  bool _isLastNameValid = false;
  bool _isUsernameValid = false;
  bool _isPhonenumberValid=false;

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  bool _isFormValid() {
    return _isFirstNameValid && _isLastNameValid && _isUsernameValid && _isPasswordValid && _isEmailValid&&_isPhonenumberValid;
  }

  void _validatePassword(String value) {
    // Password should contain at least one letter and one number
    setState(() {
      _isPasswordValid = value.isNotEmpty && value.contains(RegExp(r'(?=.*[a-zA-Z])(?=.*\d)'));
    });
  }

  void _validateEmail(String value) {
    setState(() {
      _isEmailValid = value.isNotEmpty && value.contains('@gmail.com');
    });
  }
  void _validateFirstName(String value) {
    setState(() {
      _isFirstNameValid = value.isNotEmpty;
    });
  }

  void _validateLastName(String value) {
    setState(() {
      _isLastNameValid = value.isNotEmpty;
    });
  }

  void _validateUsername(String value) {
    setState(() {
      _isUsernameValid = value.isNotEmpty;
    });
  }
  void _validatePhonenumber(String value) {
    setState(() {
      _isPhonenumberValid = value.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Login(),
              ),
            ); // Navigate back to the previous page
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.orangeAccent),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(

            children: [
              Image.asset(
                "assets/images/reister.png",
                width: 100,
                height: 100,
              ),
              Text(
                "Let's Create Your Account......",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orangeAccent,
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onChanged: _validateFirstName,
                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: _isFormValid() ? Theme.of(context).colorScheme.primary : Colors.red, // Set border color to primary if form is valid, else red
                          ),
                        ),
                        hintText: "First Name",
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        labelText: "First Name",
                        labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      cursorColor: Colors.orangeAccent,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      onChanged: _validateLastName,
                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: _isFormValid() ? Theme.of(context).colorScheme.primary : Colors.red, // Set border color to primary if form is valid, else red
                          ),
                        ),
                        hintText: "Last Name",
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        labelText: "Last Name",
                        labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      cursorColor: Colors.orangeAccent,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextFormField(
                onChanged: _validateUsername,
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: _isEmailValid ? Theme.of(context).colorScheme.primary : Colors.red, // Set border color to primary if email is valid, else red
                    ),
                  ),
                  hintText: "Username",
                  prefixIcon: Icon(
                    Icons.perm_contact_cal_rounded,
                    color: Colors.grey,
                  ),
                  labelText: "Username",
                  labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.primary),
                ),
                cursorColor: Colors.orangeAccent,
              ),
              SizedBox(height: 10),
              TextFormField(
                onChanged: _validatePhonenumber,
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: _isEmailValid ? Theme.of(context).colorScheme.primary : Colors.red, // Set border color to primary if email is valid, else red
                    ),
                  ),
                  hintText: "PhoneNumber",
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Colors.grey,
                  ),
                  labelText: "PhoneNumber",
                  labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.primary),
                ),
                cursorColor: Colors.orangeAccent,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                onChanged: _validateEmail, // Validate email on each change
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: _isEmailValid ? Theme.of(context).colorScheme.primary : Colors.red, // Set border color to primary if email is valid, else red
                    ),
                  ),
                  hintText: "E-Mail",
                  suffixIcon: _isEmailValid
                      ? Icon(
                    Icons.check,
                    color: Colors.green,
                  )
                      : null,
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                  labelText: "E-Mail",
                  labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.primary),
                ),
                cursorColor: Colors.orangeAccent,
              ),
              if (!_isEmailValid)
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Text(
                    "email should contain example@gmail.com",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                onChanged: _validatePassword, // Validate password on each change
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: _isPasswordValid ? Theme.of(context).colorScheme.primary : Colors.red, // Set border color to primary if password is valid, else red
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
                    color: Colors.grey,
                  ),
                  labelText: "Password",
                  labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.primary),
                ),
                cursorColor: Colors.orangeAccent,
                obscureText: true,
              ),
              if (!_isPasswordValid)
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Text(
                    "password should contain letters and numbers...",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              SizedBox(height: 30),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minWidth: double.infinity,
                height: 40,
                onPressed: () {
                  if (_isEmailValid && _isPasswordValid&&_isFirstNameValid&&_isLastNameValid&&_isUsernameValid&&_isPhonenumberValid) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  }

                },
                color: Colors.orangeAccent,
                child: Text(
                  "Create Account",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),

    );
  }
}