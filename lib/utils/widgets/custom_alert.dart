import 'dart:async';

import 'package:flutter/material.dart';

class CustomAlert extends StatefulWidget {
  final String title;
  final IconData icon;
  final bool isWarning;
  final bool isError;
  final bool isSuccess;

  const CustomAlert({
    super.key,
    required this.title,
    required this.icon,
    this.isWarning = false,
    this.isError = false,
    this.isSuccess = false,
  });

  @override
  _CustomAlertState createState() => _CustomAlertState();
}

class _CustomAlertState extends State<CustomAlert> {
  bool _visible = true;

  @override
  void initState() {
    super.initState();

    // Set the timer to hide the alert after 3 seconds
    Timer(Duration(seconds: 3), () {
      setState(() {
        _visible = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _visible,
      child: Card(
        elevation: 4.0,
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        color: widget.isWarning
            ? Colors.amber
            : widget.isError
                ? Colors.red
                : widget.isSuccess
                    ? Colors.green
                    : Colors.grey[600],
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                color: Colors.white,
                size: 30.0,
              ),
              SizedBox(width: 10.0),
              Text(
                widget.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
