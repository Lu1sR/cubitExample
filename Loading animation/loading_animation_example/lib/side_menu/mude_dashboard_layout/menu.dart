import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_example/side_menu/bloc/sidemenu_bloc.dart';
import 'package:loading_animation_example/utils/color_gradients.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Menu extends StatelessWidget {
  final Animation<Offset> slideAnimation;
  final Animation<double> menuAnimation;
  final int selectedIndex;
  final Function onMenuItemClicked;

  const Menu(
      {Key key,
      this.slideAnimation,
      this.menuAnimation,
      this.selectedIndex,
      @required this.onMenuItemClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: purpleGradient,
      ),
      child: SlideTransition(
        position: slideAnimation,
        child: ScaleTransition(
          scale: menuAnimation,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Icon(
                        Icons.library_books,
                        color:
                            selectedIndex == 0 ? Colors.white : Colors.white24,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<SidemenuBloc>(context)
                              .add(NavigationEvents.DashboardClickedEvent);
                          onMenuItemClicked();
                        },
                        child: Text(
                          "Dashboard",
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: selectedIndex == 0
                                  ? Colors.white
                                  : Colors.white24,
                              fontSize: 20,
                              fontWeight: selectedIndex == 0
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Icon(
                        MdiIcons.account,
                        color:
                            selectedIndex == 1 ? Colors.white : Colors.white24,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<SidemenuBloc>(context)
                              .add(NavigationEvents.MessagesClickedEvent);
                          onMenuItemClicked();
                        },
                        child: Text(
                          "Profile",
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: selectedIndex == 1
                                  ? Colors.white
                                  : Colors.white24,
                              fontSize: 20,
                              fontWeight: selectedIndex == 1
                                  ? FontWeight.w900
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Icon(
                        MdiIcons.laptop,
                        color:
                            selectedIndex == 2 ? Colors.white : Colors.white24,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<SidemenuBloc>(context)
                              .add(NavigationEvents.UtilityClickedEvent);
                          onMenuItemClicked();
                        },
                        child: Text(
                          "Tech",
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: selectedIndex == 2
                                  ? Colors.white
                                  : Colors.white24,
                              fontSize: 20,
                              fontWeight: selectedIndex == 2
                                  ? FontWeight.w900
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
