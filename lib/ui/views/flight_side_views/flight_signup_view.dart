// ignore_for_file: unnecessary_new

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:traveling/ui/shared/colors.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_button.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_image.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_textgray.dart';
import 'package:traveling/ui/shared/utils.dart';
import 'package:traveling/ui/views/flight_side_views/flight_home_view.dart';
import 'package:traveling/ui/views/traveller_side_views/home_view.dart';
import 'package:traveling/ui/views/traveller_side_views/signin_view.dart';
import '../../shared/custom_widgets/custom_textfield2.dart';
import '../traveller_side_views/home_screen.dart';
import 'flight_home_screen.dart';

class FlightSignUpView extends StatefulWidget {
  const FlightSignUpView({super.key});

  @override
  State<FlightSignUpView> createState() => _FlightSignUpViewState();
}

class _FlightSignUpViewState extends State<FlightSignUpView> {
  late String email;
  late String password;
  late String confermPassword;
  late String AirelineCode;
  late String CompanyName;

  late String errorText = '';
  late String errorTextEmail = '';
  late String errorTextAirlineCode = '';
  late String errorTextPassword = '';
  late String errorTextCompanyName = '';
  late String errorTextConfirmPassword = '';
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _AirelineCodeController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _CompanyNameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _AirelineCodeController.dispose();
    _CompanyNameController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    final size = MediaQuery.of(context).size;
    final DatabaseReference ref =
        FirebaseDatabase.instance.ref("Airline Company");

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.StatusBarColor,
      body: Stack(
        children: [
          const Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "T",
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w700,
                        color: AppColors.mainColorBlue),
                  ),
                  Text(
                    "ravell",
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 219, 186, 223)),
                  ),
                  Text(
                    "ing",
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 200,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/image/png/background1.png'),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 230,
                    ),
                    Text(
                      'Sign up ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width / 20),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Email',
                          style: TextStyle(
                              fontSize: 13,
                              color: AppColors.grayText,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        decoration: textFielDecoratiom.copyWith(),
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                    ),
                    (errorTextEmail.isNotEmpty)
                        ? Padding(
                            padding:
                                EdgeInsetsDirectional.only(start: 6, top: 10),
                            child: Text(
                              errorTextEmail!,
                              style: TextStyle(fontSize: 11, color: Colors.red),
                            ),
                          )
                        : SizedBox(
                            height: 20,
                          ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Company name',
                          style: TextStyle(
                              fontSize: 13,
                              color: AppColors.grayText,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _CompanyNameController,
                        decoration: textFielDecoratiom.copyWith(),
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                    ),
                    (errorTextCompanyName.isNotEmpty)
                        ? Padding(
                            padding:
                                EdgeInsetsDirectional.only(start: 6, top: 10),
                            child: Text(
                              errorTextEmail!,
                              style: TextStyle(fontSize: 11, color: Colors.red),
                            ),
                          )
                        : SizedBox(
                            height: 20,
                          ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Airline Code',
                          style: TextStyle(
                              fontSize: 13,
                              color: AppColors.grayText,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _AirelineCodeController,
                        decoration: textFielDecoratiom.copyWith(),
                        onChanged: (value) {
                          AirelineCode = value;
                        },
                      ),
                    ),
                    (errorTextAirlineCode != null)
                        ? Padding(
                            padding:
                                EdgeInsetsDirectional.only(start: 6, top: 10),
                            child: Text(
                              errorTextAirlineCode!,
                              style: TextStyle(fontSize: 11, color: Colors.red),
                            ),
                          )
                        : SizedBox(
                            height: 30,
                          ),
                    const SizedBox(
                      height: 20,
                    ),

                    const Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Password',
                          style: TextStyle(
                              fontSize: 13,
                              color: AppColors.grayText,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 30,
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: textFielDecoratiom.copyWith(),
                        controller: _passwordController,
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    (errorTextPassword != null)
                        ? Padding(
                            padding:
                                EdgeInsetsDirectional.only(start: 6, top: 10),
                            child: Text(
                              errorTextPassword!,
                              style: TextStyle(fontSize: 11, color: Colors.red),
                            ),
                          )
                        : SizedBox(
                            height: 20,
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Conferm Password',
                          style: TextStyle(
                              fontSize: 13,
                              color: AppColors.grayText,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                      child: TextFormField(
                        controller: _confirmPasswordController,
                        decoration: textFielDecoratiom.copyWith(),
                        onChanged: (value) {
                          confermPassword = value;
                        },
                      ),
                    ),
                    (errorTextConfirmPassword != null)
                        ? Padding(
                            padding:
                                EdgeInsetsDirectional.only(start: 6, top: 10),
                            child: Text(
                              errorTextConfirmPassword!,
                              style: TextStyle(fontSize: 11, color: Colors.red),
                            ),
                          )
                        : SizedBox(
                            height: 20,
                          ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      errorText,
                      style: const TextStyle(color: Colors.red),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                        onTap:
                            //() {
                            //   Get.to(
                            //     () => const FlightHome(),
                            //   );
                            // },
                            () async {
                          try {
                            // if (_emailController.value.text.isEmpty &&
                            //     _passwordController.value.text.isEmpty &&
                            //     _AirelineCodeController.value.text.isEmpty) {
                            //   setState(() {
                            //     errorText = "Please enter all fields";
                            //   });
                            // }
                            if (_emailController.value.text.isEmpty ||
                                !_emailController.value.text.isEmail) {
                              setState(() {
                                errorTextEmail = "Please enter valid email";
                              });
                            } else {
                              setState(() {
                                errorTextEmail = '';
                              });
                            }

                            if (_AirelineCodeController.value.text.isEmpty) {
                              setState(() {
                                errorTextAirlineCode =
                                    "Aireline Code can't be empty";
                              });
                            } else if (_AirelineCodeController
                                    .value.text.length >
                                2) {
                              setState(() {
                                errorTextAirlineCode =
                                    "Aireline Code can't be more than two characters";
                              });
                            } else if (_AirelineCodeController
                                    .value.text.isNum ||
                                _AirelineCodeController.value.text.contains(
                                    new RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) {
                              setState(() {
                                errorTextAirlineCode =
                                    "Please enter valid Aireline Code";
                              });
                            } else {
                              setState(() {
                                errorTextAirlineCode = '';
                              });
                            }

                            if (_passwordController.value.text.isEmpty) {
                              setState(() {
                                errorTextPassword =
                                    "Please enter a valid password";
                              });
                            } else if (_passwordController.value.text.length <
                                    7 &&
                                _passwordController.value.text.isNotEmpty) {
                              setState(() {
                                errorTextPassword =
                                    "Password can't be less than 6 charecters";
                              });
                            } else {
                              setState(() {
                                errorTextPassword = '';
                              });
                            }

                            if (_passwordController.value.text !=
                                _confirmPasswordController.value.text) {
                              setState(() {
                                errorTextConfirmPassword =
                                    "Password and verification do not match";
                              });
                            } else {
                              errorTextConfirmPassword = '';
                            }
                            if (_CompanyNameController.value.text.isEmpty) {
                              setState(() {
                                errorTextCompanyName =
                                    "Please enter a valid Company name";
                              });
                            } else {
                              errorTextCompanyName = '';
                            }
                            if (errorTextAirlineCode.isEmpty &&
                                errorTextEmail.isEmpty &&
                                errorTextPassword.isEmpty &&
                                errorTextConfirmPassword.isEmpty) {
                              try {
                                final newAirelineCompany =
                                    await _auth.createUserWithEmailAndPassword(
                                        email: email, password: password);
                                User? AirelineCompany = _auth.currentUser;
                                if (AirelineCompany != null) {
                                  Get.offAll(FlightHome());
                                  ref
                                      .child(AirelineCompany!.uid.toString())
                                      .set({
                                    'email': email,
                                    'password': password,
                                    'AirlineCode': AirelineCode,
                                    'mobile_number': '',
                                    'AirlineCompanyName': 'flynas'
                                  });
                                }
                              } catch (e) {
                                if (e is FirebaseAuthException) {
                                  switch (e.code) {
                                    case 'weak-password':
                                      setState(() {
                                        errorText = 'Password is too weak.';
                                      });
                                      break;
                                    case 'email-already-in-use':
                                      setState(() {
                                        errorText =
                                            'Email is already registered.';
                                      });

                                      break;
                                    // Add more cases as needed
                                    default:
                                    // Use the default error message
                                  }
                                }
                              }
                            }
                          } catch (e) {}
                        },
                        child: CustomButton(
                          text: 'Sign up',
                          textColor: AppColors.backgroundgrayColor,
                          heightPercent: 20,
                          widthPercent: 1,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    // const Center(
                    //   child: CustomTextGray(
                    //     mainText: 'or sign in with ',
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // const Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     CustomImage(imagename: 'facebook_icon'),
                    //     CustomImage(imagename: 'google_icon'),
                    //     CustomImage(imagename: 'twitter_icon'),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: screenHeight(20),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomTextGray(
                            mainText: 'You already have account? '),
                        InkWell(
                          onTap: () {
                            Get.offAll(const SignInView());
                          },
                          child: const Text(
                            'Sign in',
                            style: TextStyle(
                              color: AppColors.mainColorBlue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
