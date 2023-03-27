import 'package:flutter/material.dart';
import '../config/palette.dart';

class LoginSignUpScreen extends StatefulWidget {
  const LoginSignUpScreen({Key? key}) : super(key: key);

  @override
  State<LoginSignUpScreen> createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  bool isSignupScreen = false; // isSignupScreen 변수 선언

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette
            .backgroundColor, // background color로 palette의 backgroundColor 설정
        body: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0, //top, left, right 모두 0으로 설정
                child: Container(
                  height: 300, //height 300으로 설정
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/background.png'), //background.png 넣기
                        fit: BoxFit.fill),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 90, left: 20), //padding top 90, left 20
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, //왼쪽 정렬
                      children: [
                        RichText(
                            text: TextSpan(
                                text: 'Welcome ',
                                style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontSize: 25,
                                    color: Colors
                                        .white //letter spacing 1.0, font size 25, color white
                                    ),
                                children: [
                              TextSpan(
                                  text: isSignupScreen ? 'to EOS chat' : 'back',
                                  style: TextStyle(
                                      fontWeight: FontWeight
                                          .bold //letter spacing 1.0, font size 25, color white, bold
                                      ))
                            ])),
                        SizedBox(
                          height: 5.0, //height 5.0으로 글 사이 간격 주기
                        ),
                        Text(
                          isSignupScreen
                              ? 'Signup to continue'
                              : 'Signin to continue',
                          style: TextStyle(
                            letterSpacing: 1.0,
                            color: Colors.white, //spacing 1.0, color white
                          ),
                        )
                      ],
                    ),
                  ),
                )),
            AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeIn,
                top: 150, //top 150
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                  height: isSignupScreen ? 280.0 : 250.0,
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width -
                      40, //height 280.0, padding 모두 20, width 핸드폰 가로 길이 -40
                  margin:
                      EdgeInsets.symmetric(horizontal: 20), //margin 가로로 양쪽 20
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                          15), //color white, border radius 15
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius:
                              5, //color black, 투명도 0.3, blur radius 15, spread radius 5
                        )
                      ]),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceAround, //mainAxisAlignment.spaceAround
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                'LOGIN',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight:
                                      FontWeight.bold, //font size 16, bold
                                  color: isSignupScreen
                                      ? Palette.textColor1
                                      : Palette
                                          .activeColor, //isSignupScreen이 false면 palette의 activeColor, true면 palette의 textColor1
                                ),
                              ),
                              //isSignupScreen이 false일 때만 밑줄이 생기도록
                              !isSignupScreen
                                  ? Container(
                                      margin: EdgeInsets.only(top: 3),
                                      height: 2,
                                      width: 55,
                                      color: Colors
                                          .green, //margin top만 3, height 2, width 55, color green
                                    )
                                  : SizedBox.shrink(),
                            ],
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                isSignupScreen = true;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  'SIGNUP',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight:
                                        FontWeight.bold, //font size 16, bold
                                    color: isSignupScreen
                                        ? Palette.activeColor
                                        : Palette
                                            .textColor1, //isSignupScreen이 true면 palete의 activeColor, false면 palette의 textColor1
                                  ),
                                ),
                                //isSignupScreen이 true일 때만 밑줄이 생기도록
                                isSignupScreen
                                    ? Container(
                                        margin: EdgeInsets.only(top: 3),
                                        height: 2,
                                        width: 55,
                                        color: Colors
                                            .green, //margin top만 3, height 2, width 55, color green
                                      )
                                    : SizedBox.shrink(),
                              ],
                            ))
                      ],
                    ),
                    if (isSignupScreen)
                      Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Form(
                            child: Column(children: [
                              TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.account_circle,
                                    color: Palette.iconColor,
                                  ), //prefix icon 원하는 icon 입력, color는 palette의 iconColor
                                  hintText: 'User name',
                                  hintStyle: TextStyle(
                                    color: Palette.iconColor,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Palette
                                            .textColor1), //borderside 색은 palette의 textColor1
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            35)), //border radius는 모두 35
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Palette
                                            .textColor1), //borderside 색은 palette의 textColor1
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            35)), //border radius는 모두 35
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                  decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Palette.iconColor,
                                ),
                                hintText: 'email',
                                hintStyle: TextStyle(
                                  color: Palette.iconColor,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Palette
                                          .textColor1), //borderside 색은 palette의 textColor1
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          35)), //border radius는 모두 35
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Palette
                                          .textColor1), //borderside 색은 palette의 textColor1
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          35)), //border radius는 모두 35
                                ),
                              )),
                              SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                  decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Palette.iconColor,
                                ),
                                hintText: 'password',
                                hintStyle: TextStyle(
                                  color: Palette.iconColor,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Palette
                                          .textColor1), //borderside 색은 palette의 textColor1
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          35)), //border radius는 모두 35
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Palette
                                          .textColor1), //borderside 색은 palette의 textColor1
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          35)), //border radius는 모두 35
                                ),
                              ))
                            ]),
                          )),
                    if (!isSignupScreen)
                      Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Form(
                              child: Column(children: [
                            TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Palette.iconColor,
                                ), //prefix icon 원하는 icon 입력, color는 palette의 iconColor
                                hintText: 'email',
                                hintStyle: TextStyle(
                                  color: Palette.iconColor,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Palette
                                          .textColor1), //borderside 색은 palette의 textColor1
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          35)), //border radius는 모두 35
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Palette
                                          .textColor1), //borderside 색은 palette의 textColor1
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          35)), //border radius는 모두 35
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                                decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Palette.iconColor,
                              ),
                              hintText: 'password',
                              hintStyle: TextStyle(
                                color: Palette.iconColor,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Palette
                                        .textColor1), //borderside 색은 palette의 textColor1
                                borderRadius: BorderRadius.all(
                                    Radius.circular(35)), //border radius는 모두 35
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Palette
                                        .textColor1), //borderside 색은 palette의 textColor1
                                borderRadius: BorderRadius.all(
                                    Radius.circular(35)), //border radius는 모두 35
                              ),
                            ))
                          ]))),
                  ]),
                )),
            Positioned(
                top: isSignupScreen ? 400 : 360,
                right: 0,
                left: 0,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.lightGreen, Colors.green],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: Offset(0, 1))
                          ]),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )),
            Positioned(
              top: MediaQuery.of(context).size.height - 125,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Text(isSignupScreen ? 'or Signup with' : 'or Signin with'),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: Size(155, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: Palette.googleColor,
                    ),
                    icon: Icon(Icons.add),
                    label: Text('google'),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
