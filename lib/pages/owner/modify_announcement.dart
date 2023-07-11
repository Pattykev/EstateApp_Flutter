import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_application_1/helper/helper_function.dart';
import 'package:flutter_application_1/pages/auth/login_page.dart';
import 'package:flutter_application_1/pages/home/home_page.dart';
import 'package:flutter_application_1/pages/home/home_pageP.dart';
import 'package:flutter_application_1/service/auth_service.dart';
import 'package:flutter_application_1/widgets/dropdownbutton.dart';
import 'package:flutter_application_1/widgets/uploadimage.dart';
import 'package:flutter_application_1/widgets/widgets.dart';
import 'package:flutter_application_1/widgets/dropdownbutton.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../../widgets/dropdownbutton.dart';
import '../../widgets/dropdownbuttonStyleLogement.dart';
import '../details/components/carousel_images.dart';
import '../details/components/custom_app_bar.dart';

class ModifyAnnouncement extends StatefulWidget {
  const ModifyAnnouncement({Key? key}) : super(key: key);

  @override
  State<ModifyAnnouncement> createState() => _ModifyAnnouncementState();
}

class _ModifyAnnouncementState extends State<ModifyAnnouncement> {
  bool _isLoading = false;
  final formKey = GlobalKey<FormState>();
  String prixLoyer = "";
  String prixCaution = "";
  String surface = "";
  String description = "";
  String distanceRoute = "";
  List<String> localisation = ["", ""];
  String? role = "";
//String linkImage=UploadImage.pickUploadProfilePic();
  bool isOwner = false;

  void toggleChoice() {
    setState(() {
      isOwner = !isOwner;
    });
  }

  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor))
          : SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
                child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        //CarouselImages(widget.house.moreImagesUrl),
                        CarouselImages([
                          'images/house1.jpeg',
                          'images/indoor1.jpg',
                          'images/indoor2.jpg',
                          'images/indoor3.jpg',
                          'images/indoor4.jpg',
                          'images/indoor5.jpg',
                        ]),
                        CustomAppBar(),

                        const SizedBox(height: 2),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(
                              labelText: "Surface du logement",
                              prefixIcon: Icon(
                                Icons.space_dashboard_outlined,
                                color: Color.fromARGB(255, 40, 178, 247),
                              )),
                          onChanged: (val) {
                            setState(() {
                              surface = val;
                            });
                          },
                          validator: (val) {
                            if (val!.isNotEmpty) {
                              return null;
                            } else {
                              return "La surface doit être renseigner";
                            }
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(
                              labelText: "Prix Loyer",
                              prefixIcon: Icon(
                                Icons.monetization_on_outlined,
                                color: Color.fromARGB(255, 40, 178, 247),
                              )),
                          onChanged: (val) {
                            setState(() {
                              prixLoyer = val;
                            });
                          },

                          // check tha validation
                          validator: (val) {
                            return RegExp(r"[0-9]*").hasMatch(val!)
                                ? null
                                : "Veuillez entrer un montant valide";
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(
                              labelText: "Distance par rapport à la route",
                              prefixIcon: Icon(
                                Icons.add_road_outlined,
                                color: Color.fromARGB(255, 40, 178, 247),
                              )),
                          onChanged: (val) {
                            setState(() {
                              distanceRoute = val;
                            });
                          },

                          // check tha validation
                          validator: (val) {
                            return RegExp(r"[0-9]*").hasMatch(val!)
                                ? null
                                : "Veuillez entrer une distance valide";
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(
                              labelText: "Prix Loyer",
                              prefixIcon: Icon(
                                Icons.monetization_on_outlined,
                                color: Color.fromARGB(255, 40, 178, 247),
                              )),
                          onChanged: (val) {
                            setState(() {
                              prixLoyer = val;
                            });
                          },

                          // check tha validation
                          validator: (val) {
                            return RegExp(r"[0-9]*").hasMatch(val!)
                                ? null
                                : "Veuillez entrer un montant";
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          obscureText: false,
                          maxLines: 5,
                          decoration: textInputDecoration.copyWith(
                              labelText: "Description",
                              prefixIcon: Icon(
                                Icons.mode_edit_outline_outlined,
                                color: Color.fromARGB(255, 40, 178, 247),
                              )),
                          validator: (val) {
                            if (val!.length < 20) {
                              return "La description doit avoir au moins 20 caractères";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (val) {
                            setState(() {
                              description = val;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        // drop down button
                        //DropDownButton(),
                        //const SizedBox(height: 20),

                        //les champs cachés à afficher

                        InkWell(
                          onTap: () {
                            //Navigator.push(
                            // context,
                            //MaterialPageRoute(
                            //builder: (_) => ScheduleScreen(),
                            // ),
                            //);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(vertical: 18),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 40, 178, 247),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Localisation",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 40, 178, 247),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            child: const Text(
                              "Modifier",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            onPressed: () {
                              //register();
                            },
                          ),
                        ),
                      ],
                    )),
              ),
            ),
    );
  }
/*
  register() async {
    role = DataDropDownButton.getValue;
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .registerUserWithEmailandPassword(
              fullName, surname, email, phone, password, role)
          .then((value) async {
        if (value == true) {
          // saving the shared preference state
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email);
          await HelperFunctions.saveUserNameSF(fullName);
          if (role == '   Visiteur') {
            nextScreenReplace(context, const HomePage());
          } else {
            nextScreenReplace(context, const HomePageP());
          }
        } else {
          showSnackbar(context, Colors.red, value);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
    }
    */
}
