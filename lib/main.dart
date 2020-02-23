import 'package:flutter/material.dart';
import 'package:flutter_app/scenes/sceneEquipment.dart';
import 'package:flutter_app/scenes/sceneEquipmentEdit.dart';

bool startTimerGlobal = true;
bool metricGlobal = true;

//void main() => runApp(MyApp());

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => MyHomePage(),
    '/equipment': (context) => SceneEquipment(),
    '/stuff': (context) => SceneEquipmentEdit(),
  },
));

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout Autopilot',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin{

  TabController _tabController;
  ScrollController _scrollController;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
    _scrollController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  void dispose(){
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget> [
            SliverAppBar(
              title: Text('Workout Example'),
              pinned: true,
              floating: true,
              forceElevated: boxIsScrolled,
              //expandedHeight: 500.0,
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    text: "Today",
                    icon: Icon(Icons.home),
                  ),
                  Tab(
                    text: "Database",
                    icon: Icon(Icons.adb),
                  ),
                  Tab(
                    text: "Graph",
                    icon: Icon(Icons.equalizer),
                  ),
                  Tab(
                    text: "Settings",
                    icon: Icon(Icons.settings),
                  ),
                ],
                controller: _tabController,
              ),
            ),
          ];
        },

        body: TabBarView(
          children: <Widget>[
            PageToday(),
            PageDatabase(),
            PageGraph(),
            PageSettings(),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}

class PageToday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'This is going to be the main window later on',
      style: TextStyle(
        fontSize: 24,
        color: Colors.red,
      ),
    );
  }
}

class PageDatabase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'This is going to be a database later on',
      style: TextStyle(
        fontSize: 24,
        color: Colors.red,
      ),
    );
  }
}

///Might be better to replace this to history with a view inside as graph?
class PageGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'This is going to be a graph later on',
      style: TextStyle(
        fontSize: 24,
        color: Colors.red,
      ),
    );
  }
}

class PageSettings extends StatefulWidget {
  @override
  _PageSettingsState createState() => _PageSettingsState();
}

class _PageSettingsState extends State<PageSettings> {

  bool startTimer = startTimerGlobal;
  bool metric = metricGlobal;

  List<List<String>> weights = [
    ["1.25", "kg", "11"],
    ["2.5", "kg", "12"],
    ["5", "kg", "13"],
    ["10", "kg", "14"],
    ["15", "kg", "15"],
    ["20", "kg", "16"],
    ["25", "kg", "17"],
    ["50", "kg", "18"],
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        CheckboxListTile(
          title: const Text('Use metric system'), ///best would be a new screen!
          value: metric,
          onChanged: (bool val){
            metricGlobal = !metricGlobal;
            setState(() { metric = !metric; });
          },
        ),
        CheckboxListTile(
          title: const Text('Auto start timer'),
          value: startTimer,
          onChanged: (bool val){
            startTimerGlobal = !startTimerGlobal;
            setState(() { startTimer = !startTimer; });
          },
        ),
        ListTile(
          title: Text("Edit my equipment"),
          subtitle: Text("If you have other kinds of weights"),
          onTap: (){
            Navigator.pushNamed(
              context,
              '/equipment',
              arguments: weights,
            );
          },
        ),
        ListTile(
          title: Text("Export all your local data (NOT WORKING)"),
          subtitle: Text("Creates a file for your next device"),
          onTap: (){},
        ),
        ListTile(
          title: Text("Imports all your local data (NOT WORKING)"),
          subtitle: Text("Uses a file from previous device"),
          onTap: (){},
        ),
        ListTile(
          title: Text("Login with google (NOT WORKING)"),
          subtitle: Text("Syncs your data with google fit"),
          onTap: (){},
        ),
      ],
    );
  }
}
