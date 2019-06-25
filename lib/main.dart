import 'package:flutter/material.dart';
import 'package:instagram_app/AddBoxPage.dart';
import 'package:instagram_app/HomePage.dart';
import 'package:instagram_app/LikePage.dart';
import 'package:instagram_app/ProfilePage.dart';
import 'package:instagram_app/SearchPage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfffafafa),
        leading: //IconButton(icon: Icon(FontAwesomeIcons.camera,color: Color(0xff252525)), onPressed: null),
        Image.asset('assets/images/camera.png',color: Color(0xff252525),),
        actions: <Widget>[
          Image.asset('assets/images/Igtv.png',width: 40.0,color: Color(0xff252525),),
          //IconButton(icon: Icon(FontAwesomeIcons.inbox,color: Color(0xff252525,),), onPressed: null)
          Padding(padding: const EdgeInsets.fromLTRB(15.0,0.0,10.0,0.0),
            child: Image.asset('assets/images/direct.png',width: 30.0,color: Color(0xff252525),),)
        ],
        title: new Image.asset('assets/images/instalogo.png',width: 100.0,height: 100.0,),
      ),
      bottomNavigationBar: new Material(
        child: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.home),
            ),
            new Tab(
              icon: new Icon(Icons.search),
            ),
            new Tab(
              icon: new Icon(Icons.add_box),
            ),
            new Tab(
              icon: new Icon(Icons.favorite_border),
            ),
            new Tab(
              icon: new Icon(Icons.person_outline),
            ),
          ],
        ),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new HomePage(),
          new SearchPage(),
          new AddBoxPage(),
          new LikePage(),
          new ProfilePage(),
        ],
      ),
    );
  }
}
