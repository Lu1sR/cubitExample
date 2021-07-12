import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_example/dashboard/widgets/cover_design.dart';
import 'package:loading_animation_example/dashboard/widgets/grid_cards.dart';
import 'package:loading_animation_example/dashboard/widgets/status_bar.dart';
import 'package:loading_animation_example/side_menu/bloc/sidemenu_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MainDashboard extends StatelessWidget with SidemenuState {
  final Function onMenuTap;

  const MainDashboard({Key key, this.onMenuTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              child: buildCoverImage(MediaQuery.of(context).size),
            ),
            Positioned(
              top: 40,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: onMenuTap,
                  child: Icon(
                    MdiIcons.menu,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        "Instrucción de ",
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.w600)),
                      ),
                      Text(
                        "Embarques",
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: StatusBar(),
                ),
                GridDashboard(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
