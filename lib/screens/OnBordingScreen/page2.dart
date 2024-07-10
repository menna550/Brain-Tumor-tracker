import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class page2 extends StatelessWidget {
  const page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
                height: MediaQuery.of(context).size.height * (230 / 800),
                width: MediaQuery.of(context).size.width * (292 / 360),
                child: Image.asset("assets/Wifi.png")),
            SizedBox(
              height: 20,
            ),
            Text("Connect to the \ninternet  to recieve \nthe result",style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF3D1C65)),)
          ],
        ),
    );
  }
}
