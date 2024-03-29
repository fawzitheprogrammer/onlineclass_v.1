import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onlineclass/admin_screen/admin_stage_screen.dart';
import 'package:onlineclass/admin_screen/admin_users_list.dart';
import 'package:onlineclass/constants/constants.dart';
import 'package:onlineclass/utlities/colors.dart';

import '../utlities/drawer.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    drawer: const Drawers(),
      backgroundColor: colorBack1,
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        backgroundColor: colorBack1,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (ctx, constraints) => SizedBox(
            child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: [
                  AdminButtonCard(
                    title: 'Videos',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) =>
                              const AdminStageScreen(),
                        ),
                      );
                    },
                    height: constraints.maxHeight * 0.2,
                    paddingHorizontal: constraints.maxWidth * 0.03,
                    paddingVertical: constraints.maxHeight * 0.03,
                    icon: Icons.video_library_rounded,
                    iconAndTextDiv: constraints.maxHeight * 0.02,
                    iconSize: constraints.maxHeight * 0.1,
                  ),
                  AdminButtonCard(
                    title: 'Add Student',
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (ctx)=>const AdminUsersList()));
                    },
                    height: constraints.maxHeight * 0.2,
                    paddingHorizontal: constraints.maxWidth * 0.03,
                    paddingVertical: constraints.maxHeight * 0.03,
                    icon: FontAwesomeIcons.userGraduate,
                    iconAndTextDiv: constraints.maxHeight * 0.03,
                    iconSize: constraints.maxHeight * 0.1,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

class AdminButtonCard extends StatelessWidget {
  const AdminButtonCard({
    Key? key,
    required this.title,
    required this.onTap,
    required this.height,
    required this.paddingHorizontal,
    required this.paddingVertical,
    required this.icon,
    required this.iconAndTextDiv,
    required this.iconSize,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;
  final double height;
  final double paddingHorizontal;
  final double paddingVertical;
  final IconData icon;
  final double iconAndTextDiv;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal,
        vertical: paddingVertical,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: iconSize < 40 ? 40 : iconSize,
                color: cyan,
              ),
              SizedBox(height: iconAndTextDiv),
              FittedBox(
                child: Text(
                  title,
                  style: kAdminSub,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: darkBlue.withOpacity(0.7),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
