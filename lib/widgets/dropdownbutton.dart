import 'package:flutter/material.dart';

class DropDownButton extends StatefulWidget {
  const DropDownButton({super.key});

  @override
  State<DropDownButton> createState() => _DropDownButton();
}

final List<String> list = [
  '  Appartement',
  '  Duplex',
  '  Maison',
  '  Studio',
  '  Triplex'
];
String textTypeLogement = '   Type de logement';

class _DropDownButton extends State<DropDownButton> {
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
          textTypeLogement,
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

class DataDropDownButton {
  static String? getValue = _DropDownButton.dropdownValue;
}
