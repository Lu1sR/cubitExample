import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_example/side_menu/bloc/sidemenu_bloc.dart';

class MessagesPage extends StatelessWidget with SidemenuState {
  final Function onMenuTap;

  const MessagesPage({Key key, this.onMenuTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                child: Icon(Icons.menu, color: Colors.black54),
                onTap: onMenuTap,
              ),
              Text(
                "Profile",
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 24,
                        fontWeight: FontWeight.w600)),
              ),
              Icon(Icons.settings, color: Colors.black54),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Software Engineer",
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                        color: Colors.indigo[900],
                        fontSize: 22,
                        fontWeight: FontWeight.w600)),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/profile.jpg'),
                  backgroundColor: Colors.amber,
                  radius: 80,
                ),
              ),
              Text(
                "Luis Rodríguez ",
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                        color: Colors.indigo[900],
                        fontSize: 22,
                        fontWeight: FontWeight.w600)),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(left: 50, right: 50, top: 16),
                child: Column(
                  children: [
                    itemRow('luishrt1997@gmail.com', Icons.mail_outline),
                    Divider(
                      color: Colors.indigo[100],
                      height: 0.5,
                    ),
                    itemRow('Ecuador-Guayaquil', Icons.pin_drop_outlined),
                    Divider(
                      color: Colors.indigo[100],
                      height: 0.5,
                    ),
                    itemRow('something', Icons.portrait),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Padding itemRow(String text, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.black54),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    color: Colors.indigo[900],
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}
