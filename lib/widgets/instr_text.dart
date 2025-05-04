import 'package:flutter/material.dart';

class InstrText extends StatelessWidget {
  final String step;
  final String instr;

  const InstrText({
    super.key,
    required this.step,
    required this.instr
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(38),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(26),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),

      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(131, 58, 180, 1),
                  Color.fromRGBO(193, 53, 132, 1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Text(
              step,
              style: TextStyle(
                fontFamily: 'Ubuntu',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                decoration: TextDecoration.none,
              ),
            ),
          ),

          SizedBox(width: media.width * 0.043),

          Expanded(
            child: Text(
              instr,
              style: TextStyle(
                fontFamily: 'Ubuntu',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
