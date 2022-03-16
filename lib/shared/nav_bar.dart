import 'package:flutter/material.dart';
import 'package:the_movie/screens/wapper.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    void _showSignInPanel() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ElevatedButton(
                    child: const Text('Đăng xuất'),
                    onPressed: () => Wrapper(isSigIn: false),
                  )
                ],
              ),
            ),
          );
        },
      );
    }

    return AppBar(
      backgroundColor: const Color.fromARGB(255, 2, 40, 69),
      elevation: 0,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const ImageIcon(AssetImage('assets/menu.png')),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
      title: Image.asset(
        'assets/logo.png',
        fit: BoxFit.cover,
        height: 43,
      ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: const Image(
            image: AssetImage('assets/person.png'),
            color: Colors.white,
            height: 24,
          ),
          onPressed: _showSignInPanel,
        ),
        IconButton(
          icon: const Icon(
            Icons.search,
            color: Color.fromARGB(255, 1, 180, 228),
          ),
          onPressed: () {},
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
