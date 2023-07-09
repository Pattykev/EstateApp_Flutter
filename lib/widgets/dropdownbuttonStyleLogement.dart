import 'package:flutter/material.dart';

class DropDownButtonStyle extends StatefulWidget {
  const DropDownButtonStyle({super.key});

  @override
  State<DropDownButtonStyle> createState() => _DropDownButtonStyle();
}

final List<String> list = ['  Logement privé', '   Logement collectif'];
String textStyleLogement = '   Style de logement';

class _DropDownButtonStyle extends State<DropDownButtonStyle> {
  static String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: DropdownButton<String>(
        value: dropdownValue,
        isExpanded: true,
        icon: const Icon(Icons.keyboard_arrow_down),
        dropdownColor: Color.fromARGB(255, 160, 217, 245),
        elevation: 16,
        hint: Text(
          textStyleLogement,
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
        style: const TextStyle(color: Colors.black),
        underline: Container(
          height: 1,
          color: Color.fromARGB(255, 160, 217, 245),
          width: 2,
        ),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(),
            ),
          );
        }).toList(),
      ),
      // const String test = dropdownValue;
    );
  }

  // static String test = dropdownValue;
}

class DataDropDownButtonStyle {
  static String? getValue = _DropDownButtonStyle.dropdownValue;
}
