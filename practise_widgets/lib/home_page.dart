import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      drawer: Drawer(
        child: Container(
          color: Colors.blue,
          child: ListView(
            children: [
              DrawerHeader(
                child: Padding(
                  padding: EdgeInsets.zero,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://avatars.githubusercontent.com/u/9919?s=280&v=4',
                          ),
                          radius: 40,
                        ),
                        SizedBox(width: 20),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text('sub'), Text('email@.com')],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home, color: Colors.white),
                title: Text('Home', style: TextStyle(color: Colors.white)),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.white),
                title: Text('Settings', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Navigator.pushNamed(context, '/settings');
                },
              ),
              ListTile(
                leading: Icon(Icons.headset, color: Colors.white),
                title: Text('Music', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Navigator.pushNamed(context, '/music');
                },
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          onPressed: () {
            // Navigator.pushNamed(context, '/next');
            final s = SnackBar(
              content: Text('Hello from Snackbar!'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              backgroundColor: Colors.blue,
              action: SnackBarAction(label: 'Undo', onPressed: () {}),
            );
            ScaffoldMessenger.of(context).showSnackBar(s);
          },
          child: const Text('Press Me'),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.headset), label: 'Music'),
        ],
        onTap: (index) {
          // When the Settings item (index 1) is tapped, navigate to the settings route.
          if (index == 1) {
            Navigator.pushNamed(context, '/settings');
          }
          if (index == 2) {
            Navigator.pushNamed(context, '/music');
          }
        },
      ),
    );
  }
}
