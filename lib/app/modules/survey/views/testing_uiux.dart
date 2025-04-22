import 'package:flutter/material.dart';

class UnderlinedTextButtons extends StatefulWidget {
  const UnderlinedTextButtons({super.key});

  @override
  State<UnderlinedTextButtons> createState() => _UnderlinedTextButtonsState();
}

class _UnderlinedTextButtonsState extends State<UnderlinedTextButtons> {
  int _selectedIndex = 0;
  final List<String> _buttonLabels = ['New Task', 'Process', 'Upload', 'Finish'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _buttonLabels.asMap().entries.map((entry) {
        final int index = entry.key;
        final String label = entry.value;
        final bool isActive = _selectedIndex == index;

        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = index;
              //print('Button "$label" pressed');
            });
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.blueGrey[800], // Adjust color as needed
                ),
              ),
              if (isActive) // Show underline only for the active button
                Container(
                  height: 2,
                  width: label.length * 8.0, // Adjust width based on text length
                  color: Colors.blueAccent, // Underline color
                  margin: const EdgeInsets.only(top: 2),
                ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
