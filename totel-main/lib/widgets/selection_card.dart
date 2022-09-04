import 'package:flutter/material.dart';

class SelectionCard extends StatelessWidget {
  const SelectionCard(
      {Key? key,
      this.text = 'title',
      this.textColor = Colors.orange,
      this.onTap})
      : super(key: key);
  final String text;
  final Color textColor;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Text(
                text,
                style: TextStyle(color: textColor, fontSize: 22),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
