import 'package:flutter/material.dart';
import 'package:my_first_app/app_dashboard.dart';
import 'package:my_first_app/signup_screen.dart';
import 'app_button.dart';
import 'textField.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF191720),
      body: Padding(
          padding:
              const EdgeInsets.only(top: 70, left: 27, bottom: 59, right: 27),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Let's sign you in",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins'),
              ),
              const SizedBox(height: 14),
              const Text(
                "Welcome back\nyou've been missed !",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins'),
              ),
              const SizedBox(height: 47),

              // ------------ Email Address TextField --------------- //
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: const Color(0xFF1E1C24),
                    borderRadius: BorderRadius.circular(20),
                    border:
                        Border.all(color: const Color(0xFF5D5D67), width: 1)),
                child: const TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                  decoration: InputDecoration(
                      hintText: "Enter your email address",
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Colors.white,
                      ),
                      hintStyle: TextStyle(
                          color: Color(0xFF8F8F9E),
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Poppins'),
                      border: InputBorder.none),
                ),
              ),


              // -------------- Password TextField --------------
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: const Color(0xFF1E1C24),
                    borderRadius: BorderRadius.circular(20),
                    border:
                        Border.all(color: const Color(0xFF5D5D67), width: 1)),
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: obscureText,
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                  decoration: InputDecoration(
                      hintText: "Enter your password",
                      suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          child: obscureText
                              ? const Icon(
                                  Icons.visibility_off,
                                  color: Colors.white,
                                )
                              : const Icon(
                                  Icons.visibility,
                                  color: Colors.white,
                                )),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      hintStyle: const TextStyle(
                          color: Color(0xFF8F8F9E),
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Poppins'),
                      border: InputBorder.none),
                ),
              ),


              //const Spacer(),
              const SizedBox(
                height: 180,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => SignUp()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Don't have an account ? ",
                      style: TextStyle(
                        color: Color(0xFF8F8F9E),
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 11),
              //AppButton(label: "Sign In", onPressed: onSignInPress),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => Dashboard()));
                },
                child: const AppButton(
                  label: "Sign In",
                  toastMessage: "SignIn Successfully!",
                ),
              )
            ],
          )),
    );
  }

  void onSignInPress() {}
}
