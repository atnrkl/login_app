//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:login_app/components/indicator.dart';

// ------------------TABS--------------------
final List<Tab> tabs = <Tab>[
  Tab(text: 'Zeroth'),
  Tab(text: 'First'),
  Tab(text: 'Second'),
];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Stack(
        children: [
          Scaffold(
            drawer: Drawer(),
            body: DefaultTabController(
              length: 2,
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    title: Text(
                      'Baggage Shop',
                      style: TextStyle(
                          fontFamily: 'FugazOne',
                          fontSize: 32,
                          color: Colors.white),
                    ),
                    actions: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 3),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.person),
                        ),
                      ),
                    ],
                    expandedHeight: 200,
                    floating: false,
                    pinned: true,
                    snap: false,
                    elevation: 0,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image.asset('images/Logistics-rafiki.png'),
                    ),
                    bottom: TabBar(
                      indicator: CustomTabIndicator(),
                      onTap: (value) {},
                      tabs: [
                        Tab(
                          child: Text(
                            'Getir',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Yolla',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(_buildList(50)),
                  ),
                ],
              ),
            ),
          ),
          Align(alignment: Alignment.bottomCenter, child: BottomNavBar()),
          Align(
            heightFactor: MediaQuery.of(context).size.height,
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 80,
              width: 80,
              decoration: ShapeDecoration(
                shape: CircleBorder(),
                color: Colors.transparent,
              ),
              child: FloatingActionButton(
                  child: Text(
                    'İSTE',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                  backgroundColor: Colors.amber.shade800,
                  elevation: 0,
                  onPressed: () {}),
            ),
          )
        ],
      ),
    );
  }
}

List _buildList(int count) {
  List<Widget> listItems = List();

  for (int i = 0; i < count; i++) {
    listItems.add(
      Padding(
        padding: const EdgeInsets.all(5),
        child: Card(
          // color: Color(0xFFA3A0F2),
          child: ExpansionTile(
            maintainState: true,
            // backgroundColor: Color(0xFF35328C),
            title: Text('loremipsum'),
            children: [
              Column(
                children: [
                  Text(
                    'LOREM IPSUM',
                    style: TextStyle(fontSize: 14),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  return listItems;
}

List _buildListII(int count) {
  List<Widget> listItems = List();

  for (int i = 0; i < count; i++) {
    listItems.add(
      Padding(
        padding: const EdgeInsets.all(5),
        child: Card(
          // color: Color(0xFFA3A0F2),
          child: ExpansionTile(
            maintainState: true,
            // backgroundColor: Color(0xFF35328C),
            title: Text('loremipsum'),
            children: [
              Column(
                children: [
                  Text(
                    'LOREM IPSUM',
                    style: TextStyle(fontSize: 14),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  return listItems;
}

//-----------------------BOTTOM NAV BAR-------------------------------
class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      // backgroundColor: Colors.indigo,
      // selectedItemColor: Colors.white,
      // unselectedItemColor: Colors.white.withOpacity(.60),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      onTap: (value) {
        setState(() {
          _currentIndex = value;
        });
      },
      items: [
        BottomNavigationBarItem(
          label: 'Favorites',
          icon: Icon(Icons.favorite),
        ),
        //BottomNavigationBarItem(label: '', icon: Icon(Icons.cached)),
        BottomNavigationBarItem(
          label: 'Favorites',
          icon: Icon(Icons.library_books),
        ),
      ],
    );
  }
}

//---------------------TAB INDICATOR------------------------------

class CustomTabIndicator extends Decoration {
  @override
  _CustomPainter createBoxPainter([VoidCallback onChanged]) {
    return new _CustomPainter(this, onChanged);
  }
}

class _CustomPainter extends BoxPainter {
  final CustomTabIndicator decoration;

  _CustomPainter(this.decoration, VoidCallback onChanged)
      : assert(decoration != null),
        super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);

    //offset is the position from where the decoration should be drawn.
    //configuration.size tells us about the height and width of the tab.
    //final Rect rect = offset & configuration.size;
    final Rect rect = Offset(offset.dx, (configuration.size.height / 1.1)) &
        Size(configuration.size.width, 10);
    final Paint paint = Paint();
    paint.color = Colors.amber.shade900;
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(RRect.fromRectAndRadius(rect, Radius.circular(0)), paint);
  }
}
