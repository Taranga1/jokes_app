import 'package:flutter/material.dart';
import 'package:joke_app/model/joke_model.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Jokes posts = new Jokes();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: InkWell(
        onTap: () {
          Navigator.popAndPushNamed(context, "first");
        },
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          color: Color(0xffff4621),
          child: Center(
            child: Text(
              "Next",
              style: GoogleFonts.gugi(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 60,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://us.123rf.com/450wm/yayayoy/yayayoy1808/yayayoy180800007/106275794-stock-vector-emoticon-winking-and-showing-thumb-up.jpg?ver=6"))),
          child: Column(
            children: [
              Divider(),
              FutureBuilder(
                  future: posts.getjokes(),
                  builder: (context, snapshots) {
                    if (!snapshots.hasData) {
                      return CircularProgressIndicator();
                    } else {
                      return Column(
                        children: [
                          Text(
                            snapshots.data["joke"],
                            style: GoogleFonts.gugi(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
