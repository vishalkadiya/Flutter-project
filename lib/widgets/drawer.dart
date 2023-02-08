import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  // final imageOnline =
  //     "https://upload.wikimedia.org/wikipedia/commons/b/b5/Mahant_Swami_Maharaj.jpg";

  final imageUrl = "assets/images/account_image.jpeg";
  const MyDrawer({super.key});

  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.red,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: const Text("Vishal Kadiya"),
                accountEmail: const Text("vishalkadiya5989@gmail.com"),
                // currentAccountPicture: Image.asset(imageUrl),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage(imageUrl),
                ),
                //// currentAccountPicture: Image.asset(imageOnline),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.4,
                style: TextStyle(color: Colors.white),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.4,
                style: TextStyle(color: Colors.white),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Email me",
                textScaleFactor: 1.4,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
