import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:wijungle/Core/ColorPallete.dart';
import 'package:wijungle/Core/ScreenSize.dart';
import 'package:wijungle/Network/CheckInUser.dart';
import 'package:wijungle/Presentation/Screens/AlertScreen.dart';
import 'package:wijungle/Presentation/Widgets/custom_btn.dart';
import 'package:wijungle/Presentation/Widgets/custom_iconbtn.dart';
import 'package:wijungle/Presentation/Widgets/custom_textfeild.dart';
import 'package:window_manager/window_manager.dart';

class Userlogin extends StatefulWidget {
  const Userlogin({super.key});

  @override
  State<Userlogin> createState() => _UserloginState();
}

class _UserloginState extends State<Userlogin> {
  //check terms and conditins button value
  bool _termschecked = false;
  //userloginform formkey
  final _formkey = GlobalKey<FormState>();
  //passvisibility
  bool passvisible = true;
  //user name and password variables
  String name = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Scaffold(
      backgroundColor: Colorpallete.ScaffoldBg,
      body: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: ScreenSize.width * 0.02),
            child: SizedBox(
              height: ScreenSize.height,
              width: ScreenSize.width / 1.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: ScreenSize.height * 0.15,
                    width: ScreenSize.width * 0.15,
                    margin: const EdgeInsets.only(left: 30),
                    child: Image.asset("assets/images/1 2.png"),
                  ),
                  SizedBox(
                    height: ScreenSize.height * 0.05,
                  ),
                  SizedBox(
                    height: ScreenSize.height * 0.6,
                    width: ScreenSize.width * 0.6,
                    child: Image.asset("assets/images/Free.png"),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: ScreenSize.width * 0.432,
            height: ScreenSize.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomIconbtn(
                      icon: const Icon(Icons.minimize),
                      onPressed: () {
                        windowManager.minimize();
                      },
                    ),
                    SizedBox(
                      width: ScreenSize.width * 0.01,
                    ),
                    CustomIconbtn(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        windowManager.close();
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: ScreenSize.height * 0.15,
                ),
                //User login forms starts here
                Container(
                  height: ScreenSize.height * 0.6,
                  width: ScreenSize.width * 0.5,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 25,
                          spreadRadius: 1,
                          color: Color.fromARGB(99, 206, 206, 206),
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35)),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Let's Secure Your PC",
                          style: TextStyle(
                              color: Colorpallete.darkblue,
                              fontSize: ScreenSize.width * 0.025,
                              fontWeight: FontWeight.bold),
                        ),
                        //custom textfeilds
                        CustomTextfeild(
                            hint: "Username",
                            validator: ValidationBuilder()
                                .minLength(2)
                                .maxLength(45)
                                .build(),
                            onChanged: (val) {
                              setState(() {
                                name = val.toString().toLowerCase().trim();
                              });
                            },
                            height: ScreenSize.height * 0.09,
                            width: ScreenSize.width * 0.35),
                        CustomTextfeild(
                            hint: "Password",
                            obscureText: passvisible,
                            validator: ValidationBuilder()
                                .minLength(5)
                                .maxLength(20)
                                .build(),
                            onChanged: (val) {
                              setState(() {
                                password = val.toString().toLowerCase().trim();
                              });
                            },
                            sufix: IconButton(
                              icon: Icon(passvisible
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  passvisible = !passvisible;
                                });
                              },
                            ),
                            height: ScreenSize.height * 0.09,
                            width: ScreenSize.width * 0.35),
                        //custom textfeilds
                        SizedBox(
                          height: ScreenSize.height * 0.055,
                          width: ScreenSize.width * 0.35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Transform.scale(
                                scale: ScreenSize.width * 0.0008,
                                child: Checkbox(
                                  value: _termschecked,
                                  onChanged: (val) {
                                    setState(() {
                                      _termschecked = val!;
                                    });
                                  },
                                  activeColor: Colorpallete.darkblue,
                                ),
                              ), //check terms and conditins button value
                              SizedBox(
                                width: ScreenSize.width * 0.01,
                              ),
                              RichText(
                                  text: TextSpan(
                                      style: TextStyle(
                                          color: Colorpallete.darkblue,
                                          fontSize: ScreenSize.width * 0.012,
                                          fontWeight: FontWeight.w500),
                                      children: [
                                    const TextSpan(
                                        text: "By continuing, you agree to "),
                                    TextSpan(
                                        text: "Terms & Conditions ",
                                        style: TextStyle(
                                            color: Colorpallete.lighterblue)),
                                    const TextSpan(text: "and"),
                                    TextSpan(
                                        text: "\nPrivacy Policy .",
                                        style: TextStyle(
                                            color: Colorpallete.lighterblue)),
                                  ]))
                            ],
                          ),
                        ),
                        CustomBtn(
                          height: ScreenSize.height * 0.06,
                          width: ScreenSize.width * 0.35,
                          text: "Log In",
                          onPressed: () async {
                            //checking form validations
                            final validations =
                                _formkey.currentState!.validate();
                            //if validation are true and also the terms and conditios are checked
                            if ((validations == true) &&
                                (_termschecked == true)) {
                              Alertscreen().loader(context);
                              await Checkinuser()
                                  .userloginstatus(context, name, password);
                            } else {
                              Alertscreen().showdialogbox(
                                  context,
                                  "Terms!",
                                  "Accept Terms And Conditions",
                                  Icons.import_contacts);
                            }
                          },
                          bgcolor: Colorpallete.darkblue,
                        ) //login btn
                      ],
                    ),
                  ),
                ) //User login forms ends here
              ],
            ),
          )
        ],
      ),
    );
  }
}
