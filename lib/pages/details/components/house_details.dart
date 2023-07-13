import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_application_1/model/house.dart';
import 'package:flutter_application_1/utils/color.dart';

import '../../../widgets/location_service.dart';
import '../../../widgets/widgets.dart';

class HouseDetails extends StatefulWidget {
  final house;

  HouseDetails(this.house);

  @override
  _HouseDetailsState createState() => _HouseDetailsState();
}

class _HouseDetailsState extends State<HouseDetails> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: AppColor.appPadding,
              left: AppColor.appPadding,
              right: AppColor.appPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      //'\$${widget.house.price.toStringAsFixed(3)}',
                      '100 000 Frs/mois',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(children: [
                            //widget.house.localisation,
                            WidgetSpan(
                              child: Icon(
                                Icons.pin_drop_outlined,
                                color: Colors.blue,
                                size: 20,
                              ),
                            ),
                            TextSpan(
                                text: "Etoudi, Yaoundé",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    nextScreen(
                                        context, const LocationService());
                                  }),
                          ]),
                        )
                      ],
                    ),
                  ],
                ),
                //${widget.house.time}
                Text(
                  'Il y a 30 heures',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: AppColor.appPadding, bottom: AppColor.appPadding),
            child: Text(
              'Informations sur le logement',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 130,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: AppColor.appPadding,
                    bottom: AppColor.appPadding,
                  ),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColor.primary.withOpacity(0.4),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          //widget.house.sqFeet.toString(),
                          "1 420 m²",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Surface',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: AppColor.appPadding,
                    bottom: AppColor.appPadding,
                  ),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColor.primary.withOpacity(0.4),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          //widget.house.bedRooms.toString(),
                          "4",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Chambres',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: AppColor.appPadding,
                    bottom: AppColor.appPadding,
                  ),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColor.primary.withOpacity(0.4),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          //widget.house.bathRooms.toString(),
                          "2",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Salle(s) de bains',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: AppColor.appPadding,
                    bottom: AppColor.appPadding,
                  ),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColor.primary.withOpacity(0.4),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          //widget.house.garages.toString(),
                          "1",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Cuisine(s)',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: AppColor.appPadding,
              right: AppColor.appPadding,
              bottom: AppColor.appPadding * 4,
            ),
            child: Text(
              //widget.house.description,
              'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              style: TextStyle(
                color: AppColor.black.withOpacity(0.4),
                height: 1.5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
