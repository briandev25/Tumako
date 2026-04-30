import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:tumako/screens/auth/register.dart';
import '../../widgets/form_wrapper.dart';
import 'package:email_validator/email_validator.dart';
import './widgets/ordivider.dart';
import '../../widgets/logo_container.dart';
import './widgets/socialauth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";
  bool _obscureText = true;

  final passwordRegex = RegExp(
    r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*(),.?":{}|<>]).{6,}$',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        top: true,
        bottom: false,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              BoxLogo(),
              SizedBox(height: 20),
              FormWrapper(
                form: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 15),
                    Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "Email Address",
                                hintText: "john.doe@example.com",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                fillColor: Colors.grey[100],
                                filled: true,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your email address";
                                }
                                if (!EmailValidator.validate(value)) {
                                  return "Please enter a valid email address";
                                }
                                return null;
                              },
                              onSaved: (value) => _email = value!,
                            ),

                            SizedBox(height: 15),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "Password",

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                fillColor: Colors.grey[100],
                                filled: true,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                  icon: Icon(
                                    _obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                              ),
                              obscureText: _obscureText,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your password";
                                }
                                if (!passwordRegex.hasMatch(value)) {
                                  return "Password must be at least 6 chars, include uppercase, number & special character";
                                }
                                return null;
                              },
                              onSaved: (value) => _password = value!,
                            ),

                            SizedBox(height: 25),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Processing Data..."),
                                      ),
                                    );
                                  }
                                },

                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Theme.of(
                                    context,
                                  ).primaryColor,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                    vertical: 15.0,
                                  ),
                                ),
                                child: Text("Sign In"),
                              ),
                            ),
                            SizedBox(height: 45),
                            OrDivider(),
                            SizedBox(height: 25),
                            SocialAuthButtons(),
                            SizedBox(height: 25),
                            RichText(
                              text: TextSpan(
                                text: "Dont have an account?",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 19,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Sign Up",
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 19,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const Register(),
                                          ),
                                        );
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ],
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
    );
  }
}
