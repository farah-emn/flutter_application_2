import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:traveling/ui/shared/colors.dart';
import 'package:traveling/ui/shared/custom_widgets/custom_textfiled.dart';
import 'package:traveling/ui/shared/utils.dart';
import 'package:traveling/ui/views/traveller_side_views/home_screen.dart';
import '../../shared/custom_widgets/custom_button.dart';

bool is3 = false;

class BookingSummaryView extends StatefulWidget {
  BookingSummaryView({super.key});

  @override
  State<BookingSummaryView> createState() => _BookingSummaryViewState();
}

class _BookingSummaryViewState extends State<BookingSummaryView> {
  int _activeStepIndex = 0;
  int _nextStep = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Step> StepsList() {
      return <Step>[
        Step(
          title: Text('Booking\nSummery'),
          content: step1(context),
          state: _activeStepIndex > 0 ? StepState.complete : StepState.disabled,
          isActive: _activeStepIndex >= 0,
        ),
        Step(
          title: Text('Guest\nDetails'),
          content: step2(context),
          state: _activeStepIndex > 1 ? StepState.complete : StepState.disabled,
          isActive: _activeStepIndex >= 1,
        ),
        Step(
            title: Text('Payment'),
            content: step3(context),
            state: StepState.disabled,
            isActive: _activeStepIndex >= 2),
      ];
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Container(
            color: AppColors.LightBlueColor,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    left: 15,
                  ),
                  alignment: Alignment.centerRight,
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColors.backgroundgrayColor,
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.mainColorBlue,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 60,
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/image/png/background1.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Booking Summary',
                          style: TextStyle(
                              fontSize: screenWidth(20),
                              fontWeight: FontWeight.w700,
                              color: AppColors.backgroundgrayColor),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 100,
                  ),
                  child: Theme(
                    data: ThemeData(
                        colorScheme: ColorScheme.light(
                      primary: AppColors.mainColorBlue,
                    )),
                    child: Stepper(
                      elevation: 0,
                      steps: StepsList(),
                      type: StepperType.horizontal,
                      currentStep: _activeStepIndex,
                      onStepContinue: () {
                        if (_nextStep <= 4) {
                          _activeStepIndex += 1;
                          _nextStep += 1;
                        }
                        if (_nextStep == 4) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        20.0), // Set your desired border radius
                                  ),
                                  backgroundColor: Colors.white,
                                  child: Container(
                                    width: screenWidth(1),
                                    height: screenHeight(2.4),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              start: screenWidth(1.5),
                                              top: screenHeight(70)),
                                          child: Image.asset(
                                            'assets/image/png/cancel_icon.png',
                                          ),
                                        ),
                                        SizedBox(
                                          height: screenHeight(60),
                                        ),
                                        Image.asset(
                                            'assets/image/png/success_icon.png',
                                            alignment: Alignment.bottomLeft,
                                            width: screenWidth(4)),
                                        SizedBox(
                                          height: screenHeight(80),
                                        ),
                                        Text(
                                          'SUCCESS!',
                                          style: TextStyle(
                                              color: AppColors.mainColorBlue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: screenWidth(16)),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Your flight has been\n\ booked successfully.',
                                              style: TextStyle(
                                                  fontSize: screenWidth(24),
                                                  color: Color.fromARGB(
                                                      255, 112, 110, 110)),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 50,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.to(Home());
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 15,
                                              right: 15,
                                              bottom: 15,
                                            ),
                                            child: CustomButton(
                                                text: 'Confirm',
                                                textColor: AppColors
                                                    .backgroundgrayColor,
                                                widthPercent: 1.35,
                                                heightPercent: 20),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        }
                        // setState() {}
                      },
                      onStepCancel: () {
                        if (_activeStepIndex == 0) {
                          return;
                        }
                        _activeStepIndex -= 1;
                        _nextStep -= 1;
                        // setState(){}
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

Widget step1(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Stack(
    children: [
      Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: Stack(
              children: [
                Container(
                  width: size.width,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/image/png/hotel1.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 160,
                    top: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Deluxe Room- 2 Twin Beds',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Image(
                            width: 18,
                            height: 18,
                            image: AssetImage(
                                'assets/image/png/location_icon.png'),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'King Fahd Rd',
                            style: TextStyle(color: AppColors.TextgrayColor),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Image(
                            width: 18,
                            height: 18,
                            image: AssetImage(
                                'assets/image/png/location_icon.png'),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '4 Stars',
                            style: TextStyle(color: AppColors.TextgrayColor),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Image(
                            width: 17,
                            height: 18,
                            image: AssetImage(
                                'assets/image/png/user pink image.png'),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '4 Stars',
                            style: TextStyle(color: AppColors.TextgrayColor),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              // left: 15,
              // right: 15,
              bottom: 15,
              top: 20,
            ),
            child: Stack(
              children: [
                Container(
                  width: size.width,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Number of nights',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            '1 night',
                            style: TextStyle(
                              color: AppColors.mainColorBlue,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Check in',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            '07 Jan, 2024',
                            style: TextStyle(
                              color: AppColors.mainColorBlue,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Check out',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 15),
                          ),
                          Text(
                            '08 Jan, 2024',
                            style: TextStyle(
                              color: AppColors.mainColorBlue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 15,
              // left: 15,
              // right: 15,
            ),
            child: Stack(
              children: [
                Container(
                  width: size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cancellation policy',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 15,
              // left: 15,
              // right: 15,
            ),
            child: Stack(
              children: [
                Container(
                  width: size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Service fee & tax',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}

Widget step2(BuildContext context) {
  return (Container(
    child: Column(
      children: [
        Container(
            width: screenWidth(1.1),
            height: screenWidth(3),
            decoration: BoxDecoration(
                color: AppColors.babyblueColor,
                borderRadius: BorderRadiusDirectional.circular(25)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Use your passport or GCC National ID to \nquickly and securely auto-fill traveller\n details',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(96, 96, 96, 1),
                      fontSize: screenWidth(25)),
                  textAlign: TextAlign.center,
                ),
                Container(
                  width: screenWidth(1.3),
                  height: screenWidth(10),
                  decoration: BoxDecoration(
                      color: AppColors.backgroundgrayColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: EdgeInsetsDirectional.all(10),
                    child: Center(
                      child: Text(
                        'Scan ID to add traveller',
                        style: TextStyle(
                            color: AppColors.mainColorBlue,
                            fontSize: screenWidth(25)),
                      ),
                    ),
                  ),
                ),
              ],
            )),
        Padding(
          padding: EdgeInsetsDirectional.only(
              top: screenWidth(20), end: screenWidth(2)),
          child: Text(
            ' Traveller details ',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: screenWidth(22),
            ),
          ),
        ),
        SizedBox(
          height: screenWidth(30),
        ),
        CustomTextField(
          prefIcon: Icons.person_2,
          colorIcon: const Color.fromARGB(255, 255, 181, 215),
          hintText: 'First name',
        ),
        SizedBox(
          height: screenWidth(30),
        ),
        CustomTextField(
          prefIcon: Icons.person_2,
          colorIcon: const Color.fromARGB(255, 255, 181, 215),
          hintText: 'Last name',
        ),
        SizedBox(
          height: screenWidth(30),
        ),
        CustomTextField(
          prefIcon: Icons.email,
          colorIcon: const Color.fromARGB(255, 175, 153, 255),
          hintText: 'Email',
        ),
        SizedBox(
          height: screenWidth(30),
        ),
        CustomTextField(
          prefIcon: Icons.phone,
          colorIcon: Color.fromARGB(255, 198, 237, 195),
          hintText: 'Mobile Number',
        ),
        SizedBox(height: screenHeight(12)),
        Container(
          alignment: Alignment.bottomLeft,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsetsDirectional.only(
                start: screenWidth(30), top: screenHeight(86)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: screenHeight(40),
                    ),
                    Text(
                      'Total to be paid:',
                      style: TextStyle(
                        fontSize: screenWidth(25),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '2231',
                      style: TextStyle(
                          fontSize: screenWidth(18),
                          color: AppColors.mainColorBlue),
                    ),
                    Text(
                      'SAR',
                      style: TextStyle(
                        fontSize: screenWidth(26),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: screenHeight(80),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  ));
}

Widget step3(BuildContext contex) {
  is3 = true;
  return (Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        const CustomTextField(
          prefIcon: Icons.credit_card_rounded,
          colorIcon: AppColors.IconPurpleColor,
          hintText: 'First name',
        ),
        SizedBox(
          height: 20,
        ),
        const CustomTextField(
          prefIcon: Icons.date_range,
          colorIcon: Color.fromARGB(255, 198, 237, 195),
          hintText: 'Card expiration date',
        ),
        SizedBox(
          height: 20,
        ),
        const CustomTextField(
          prefIcon: Icons.person,
          colorIcon: AppColors.IconBlueColor,
          hintText: 'Name of card holder',
          suffIcon: Icons.keyboard_arrow_down,
        ),
        Container(
            alignment: Alignment.bottomLeft,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                  start: screenWidth(30), top: screenHeight(86)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Total to be paid:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        '2231',
                        style: TextStyle(
                          fontSize: screenWidth(18),
                          color: AppColors.mainColorBlue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'SAR',
                        style: TextStyle(
                          fontSize: screenWidth(26),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: screenHeight(80),
                  )
                ],
              ),
            )),
      ],
    ),
  ));
}
