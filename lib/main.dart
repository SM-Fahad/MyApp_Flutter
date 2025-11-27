import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_app/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Practice1(),
      home: MySTF(),
    );
  }
}

class Practice1 extends StatelessWidget {
  const Practice1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: MyAppBar(title: "NavBar"),
      appBar: AppBar(
        title: Text("Nav Bar"),
        titleSpacing: 50,
        toolbarHeight: 50,
        toolbarOpacity: 1,
        elevation: 5,
        // backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            onPressed: () {
              print("Search Button Clicked");
            },
            icon: Icon(Icons.accessible),
          ),
          IconButton(
            onPressed: () {
              Fluttertoast.showToast(
                msg: "Hello Fahad",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                backgroundColor: Colors.black,
                textColor: Colors.white,
              );
            },
            icon: Icon(Icons.dangerous_sharp),
          ),
          SizedBox(width: 10),
          IconButton(
            onPressed: () {
              Fluttertoast.showToast(
                msg: "Hello! Search button clicked.",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 16.0,
              );
              //Navigator.pushNamed(context, '/p1');
              //print('Search button clicked.');
            },
            icon: Icon(Icons.search),
          ),

          IconButton(
            onPressed: () {
              Fluttertoast.showToast(
                msg: "Hello! Finish button clicked.",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 16.0,
              );
              //Navigator.pushNamed(context, '/p2');
              //print('Close button clicked.');
            },
            icon: Icon(Icons.dangerous_sharp),
          ),

          IconButton(
            onPressed: () {
              Fluttertoast.showToast(
                msg: "Hello! Settings button clicked.",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 16.0,
              );
              //Navigator.pushNamed(context, '/p3');
              //print('Settings button clicked.');
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: const Color.fromARGB(255, 150, 200, 235),
          child: Center(
            child: Text(
              "Fahad",
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      drawer: CustomDrawer(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.account_balance)),
            IconButton(onPressed: () {}, icon: Icon(Icons.card_travel)),
            IconButton(onPressed: () {}, icon: Icon(Icons.check)),
            IconButton(onPressed: () {}, icon: Icon(Icons.mail_rounded)),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.panorama_fish_eye_outlined),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 10,
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
      ),
    );
  }
}

// class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String title;
//   const MyAppBar({super.key, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              "My Drawer 😎",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            subtitle: Text("Go Home"),
            title: Text("Home"),
            trailing: Icon(Icons.ac_unit_rounded),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text("Cart"),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(Icons.info),
            title: Text("About"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Mr. Fahad"),
            accountEmail: Text("fahad@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.amber,
              child: ClipOval(
                child: Image.asset(
                  'assets/stb.png',
                  width: 80.0,
                  height: 80.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            subtitle: Text("Go Home"),
            title: Text("Home"),
            trailing: Icon(Icons.ac_unit_rounded),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text("Cart"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text("About"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class MySTF extends StatefulWidget {
  const MySTF({super.key});

  @override
  State<MySTF> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MySTF> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: home(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,

        onTap: (index) {
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
        ],
      ),
    );
  }
}
