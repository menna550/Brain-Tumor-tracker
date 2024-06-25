import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class page1 extends StatelessWidget {
  const page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Container(
              height: MediaQuery.of(context).size.height * (266 / 800),
              width: MediaQuery.of(context).size.width * (223 / 360),
              child: Image.asset('assets/artificial intelligence.png')),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * (44 / 360),
              ),
              Text(
                "Never mind!",
                style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF385A64)),
              ),
              Container(
                  height: MediaQuery.of(context).size.height * (21 / 800),
                  width: MediaQuery.of(context).size.width * (21 / 360),
                  child:Image.asset("assets/hello 1.png")),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * (44 / 360),
              ),
              Text(
                "It’s Soo Easy to use",
                style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF385A64)),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * (43 / 360),
              ),
              Text(
                "Just select the photo and wait to\n receive the result in Gmail",
                style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF385A64)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
