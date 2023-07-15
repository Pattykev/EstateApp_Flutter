import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_application_1/helper/helper_function.dart';
import 'package:flutter_application_1/pages/auth/login_page.dart';
import 'package:flutter_application_1/pages/home/home_page.dart';
import 'package:flutter_application_1/pages/home/home_pageP.dart';
import 'package:flutter_application_1/pages/owner/rootP.dart';
import 'package:flutter_application_1/pages/visitor/root.dart';
import 'package:flutter_application_1/service/auth_service.dart';
import 'package:flutter_application_1/widgets/dropdownbutton.dart';
import 'package:flutter_application_1/widgets/uploadimage.dart';
import 'package:flutter_application_1/widgets/widgets.dart';
import 'package:flutter_application_1/widgets/dropdownbutton.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../service/database_service.dart';
import '../../widgets/dropdownbutton.dart';
import '../../widgets/dropdownbuttonStyleLogement.dart';
import '../../widgets/location_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isLoading = false;
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String fullName = "";
  String surname = "";
  String phone = "";
  String? role = "";
  String styleLog = "";
  String typeLog = "";
  String lat = "4.55";
  String long = "3.10";
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
                        const Text(
                          "Estate App",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                            "Créez votre compte et explorez les logements disponibles ",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400)),
                        const SizedBox(height: 5),
                        Image.asset("assets/logo1.png"),
                        const SizedBox(height: 5),
                        UploadImage(),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(
                              labelText: "Nom",
                              prefixIcon: Icon(
                                Icons.person,
                                color: Color.fromARGB(255, 40, 178, 247),
                              )),
                          onChanged: (val) {
                            setState(() {
                              fullName = val;
                            });
                          },
                          validator: (val) {
                            if (val!.isNotEmpty) {
                              return null;
                            } else {
                              return "Le nom doit être renseigner";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(
                              labelText: "Prénom",
                              prefixIcon: Icon(
                                Icons.person,
                                color: Color.fromARGB(255, 40, 178, 247),
                              )),
                          onChanged: (val) {
                            setState(() {
                              surname = val;
                            });
                          },
                          validator: (val) {
                            if (val!.isNotEmpty) {
                              return null;
                            } else {
                              return "Le prénom doit être renseigner";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(
                              labelText: "Email",
                              prefixIcon: Icon(
                                Icons.email,
                                color: Color.fromARGB(255, 40, 178, 247),
                              )),
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          },

                          // check tha validation
                          validator: (val) {
                            return RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(val!)
                                ? null
                                : "Veuillez entrer une adresse mail valide";
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(
                              labelText: "Téléphone",
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Color.fromARGB(255, 40, 178, 247),
                              )),
                          onChanged: (val) {
                            setState(() {
                              phone = val;
                            });
                          },

                          // check tha validation
                          validator: (val) {
                            return RegExp(r"^6[0-9]{8}").hasMatch(val!)
                                ? null
                                : "Veuillez entrer un numéro de téléphone valide";
                          },
                        ),
                        const SizedBox(height: 15),

                        TextFormField(
                          obscureText: true,
                          decoration: textInputDecoration.copyWith(
                              labelText: "Mot de passe",
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Color.fromARGB(255, 40, 178, 247),
                              )),
                          validator: (val) {
                            if (val!.length < 6) {
                              return "Le mot de passe doit avoir au moins 6 caractères";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (val) {
                            setState(() {
                              password = val;
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

                        isOwner
                            ? Container(
                                margin: EdgeInsets.symmetric(vertical: 15),
                                child: Column(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    LocationService()));
                                      },
                                      child: Text('Localisation',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16)),
                                      style: ElevatedButton.styleFrom(
                                          primary:
                                              Color.fromARGB(255, 40, 178, 247),
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30))),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    //Upload house images
                                    UploadImage(),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    DropDownButton(),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    DropDownButtonStyle(),
                                  ],
                                ),
                              )
                            : Container(),

                        //Switch button pour le role propriétaire
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                "Je suis propriétaire",
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                              Switch(
                                value: isOwner,
                                onChanged: (_) => {
                                  toggleChoice(),
                                },
                                trackColor: const MaterialStatePropertyAll(
                                  Colors.grey,
                                ),
                                thumbColor: const MaterialStatePropertyAll(
                                  Color.fromARGB(255, 160, 217, 245),
                                ),
                              ),
                            ],
                          ),
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
                              "S'enregistrer",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            onPressed: () {
                              register();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text.rich(TextSpan(
                          text: "Avez vous déjà un compte? ",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: "Connectez-vous maintenant!",
                                style: const TextStyle(
                                    color: Colors.black,
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    nextScreen(context, const LoginPage());
                                  }),
                          ],
                        )),
                      ],
                    )),
              ),
            ),
    );
  }

  register() async {
    role = isOwner ? "   Propriétaire" : "   Visiteur";
    typeLog = DataDropDownButton.getValue!;
    styleLog = DataDropDownButtonStyle.getValue!;

    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      await authService
          .registerUserWithEmailandPassword(fullName, surname, email, password,
              phone, role, typeLog, styleLog, lat, long)
          .then((value) async {
        if (value == true) {
          await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
              .savingHouseData(typeLog, styleLog, lat, long, email);
          // saving the shared preference state
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email);
          await HelperFunctions.saveUserNameSF(fullName);
          if (role == '   Visiteur') {
            nextScreenReplace(context, const RootApp());
          } else {
            nextScreenReplace(context, const RootAppP());
          }
        } else {
          showSnackbar(context, Colors.red, value);
          setState(() {
            _isLoading = false;
          });

          ;
        }
      });
    }
  }
}
