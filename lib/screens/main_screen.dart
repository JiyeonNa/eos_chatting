import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../config/palette.dart';
import 'chat_screen.dart';

class LoginSignUpScreen extends StatefulWidget {
  const LoginSignUpScreen({Key? key}) : super(key: key);

  @override
  State<LoginSignUpScreen> createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  final _authentication = FirebaseAuth.instance;

  // Default : Signup
  bool isSignupScreen = true;

  String userName = "";
  String userEmail = "";
  String userPassword = "";

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* background */
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/background.png")),
                ),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 90, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /* Welcome message */
                      RichText(
                          text: TextSpan(
                        style: const TextStyle(
                            letterSpacing: 1.0,
                            fontSize: 25,
                            color: Colors.white),
                        children: [
                          const TextSpan(text: "Welcome "),
                          TextSpan(
                              text: isSignupScreen ? "to EOS chat!" : "back",
                              style: const TextStyle(
                                  letterSpacing: 1.0,
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ],
                      )),
                      const SizedBox(
                        height: 5.0,
                      ),
                      /* Signup or Signin message */
                      Text(
                        isSignupScreen
                            ? "Signup to continue"
                            : "Signin to continue",
                        style: const TextStyle(
                            letterSpacing: 1.0, color: Colors.white),
                      ),
                    ],
                  ),
                )),
          ),
          AnimatedPositioned(
            top: 170,
            height: isSignupScreen ? 300.0 : 250.0,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeIn,
            child: AnimatedContainer(
              /* white box */
              height: 280.0,
              duration: const Duration(milliseconds: 500),
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5)
                  ]),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      /* LOGIN Button */
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSignupScreen = false;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              "LOGIN",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: !isSignupScreen
                                      ? Palette.activeColor
                                      : Palette.textColor1),
                            ),
                            if (!isSignupScreen)
                              Container(
                                margin: const EdgeInsets.only(top: 3),
                                height: 2,
                                width: 55,
                                color: Colors.green,
                              )
                          ],
                        ),
                      ),

                      /* SIGNUP Button */
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSignupScreen = true;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              "SIGNUP",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isSignupScreen
                                      ? Palette.activeColor
                                      : Palette.textColor1),
                            ),
                            if (isSignupScreen)
                              Container(
                                margin: const EdgeInsets.only(top: 3),
                                height: 2,
                                width: 55,
                                color: Colors.green,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  /* TextFormField */
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Form(
                      child: Column(
                        children: [
                          /* User name */
                          if (isSignupScreen) ...[
                            TextFormField(
                              decoration: const InputDecoration(
                                  /* ICON */
                                  prefixIcon: Icon(Icons.account_circle_rounded,
                                      color: Palette.iconColor),
                                  /* Text */
                                  hintText: "User name",
                                  hintStyle:
                                      TextStyle(color: Palette.iconColor),
                                  /* enabledBorder */
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Palette.textColor1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(35)),
                                  ),
                                  /* focusedBorder */
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Palette.textColor1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(35)),
                                  )),
                              controller: _nameController,
                              keyboardType: TextInputType.text,
                            ),
                            const SizedBox(height: 8),
                          ],
                          /* email */
                          TextFormField(
                            decoration: const InputDecoration(
                                /* ICON */
                                prefixIcon:
                                    Icon(Icons.email, color: Palette.iconColor),
                                /* Text */
                                hintText: "email",
                                hintStyle: TextStyle(color: Palette.iconColor),
                                /* enabledBorder */
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Palette.textColor1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35)),
                                ),
                                /* focusedBorder */
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Palette.textColor1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35)),
                                )),
                            controller: _emailController,
                            keyboardType: TextInputType.text,
                          ),
                          const SizedBox(height: 8),
                          /* password */
                          TextFormField(
                            decoration: const InputDecoration(
                                /* ICON */
                                prefixIcon:
                                    Icon(Icons.lock, color: Palette.iconColor),
                                /* Text */
                                hintText: "password",
                                hintStyle: TextStyle(color: Palette.iconColor),
                                /* enabledBorder */
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Palette.textColor1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35)),
                                ),
                                /* focusedBorder */
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Palette.textColor1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35)),
                                )),
                            controller: _passwordController,
                            obscureText: true,
                            keyboardType: TextInputType.text,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          /* Continue Button */
          AnimatedPositioned(
            top: isSignupScreen ? 425 : 375,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeIn,
            right: 0,
            left: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(15),
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: GestureDetector(
                  onTap: () async {
                    if (isSignupScreen) {
                      userName = _nameController.text;
                      userEmail = _emailController.text;
                      userPassword = _passwordController.text;

                      try {
                        final newUser = await _authentication
                            .createUserWithEmailAndPassword(
                                email: userEmail, password: userPassword);

                        // user id 저장
                        await FirebaseFirestore.instance
                            .collection('user')
                            .doc(newUser.user!.uid)
                            .set({
                          'userName': userName,
                          'email': userEmail,
                        });

                        if (newUser.user != null) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ChatScreen();
                          }));
                        }
                      } catch (e) {
                        print(e);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Please check your email and password'),
                          backgroundColor: Colors.blue,
                        ));
                      }
                    }
                    if (!isSignupScreen) {
                      userEmail = _emailController.text;
                      userPassword = _passwordController.text;

                      try {
                        final newUser =
                            await _authentication.signInWithEmailAndPassword(
                                email: userEmail, password: userPassword);
                        if (newUser.user != null) {}
                      } catch (e) {
                        print(e);
                      }
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Colors.lightGreen, Colors.green],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(0, 1))
                        ]),
                    child: const Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          /* Signup or Signin with Google */
          Positioned(
            top: MediaQuery.of(context).size.height - 125,
            right: 0,
            left: 0,
            child: Column(
              children: [
                isSignupScreen
                    ? const Text("or Signup with")
                    : const Text("or Signin with"),
                const SizedBox(height: 10),
                TextButton.icon(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        primary: Colors.white,
                        minimumSize: const Size(155, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: Palette.googleColor),
                    icon: const Icon(Icons.add),
                    label: const Text("Google"))
              ],
            ),
          )
        ],
      ),
    );
  }
}
