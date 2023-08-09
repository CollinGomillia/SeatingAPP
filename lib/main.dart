import 'package:flutter/material.dart';
import 'package:seatingapp/colorschemes/colorschemes.dart';
import 'package:seatingapp/pages/home/internal/background_list.dart';
import 'package:flutter/material.dart';
import 'package:seatingapp/colorschemes/colorschemes.dart';
import 'package:seatingapp/pages/home/internal/background_list.dart';
import 'package:seatingapp/pages/home/internal/custom_bar.dart';
import 'package:seatingapp/pages/home/internal/list_view.dart';
import 'package:seatingapp/pages/booking/internal/checkout_screen.dart';
import 'package:seatingapp/pages/booking/internal/thank_you_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reservato',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "Open-Sans",
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: 'Flutter Demo Home Page'),
        '/checkout': (context) => CheckoutScreen(),
        '/thank_you': (context) => ThankYouScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Scroll controllers for background and restaurant list view
  late ScrollController backgroundScrollController;
  late ScrollController restaurantScrollController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Stack(
        fit: StackFit.loose,
        alignment: Alignment.bottomCenter,
        children: [
          // Background of home screen
          BackgroundListView(backgroundScrollController),

          // Restaurant detail List view
          RestaurantListView(restaurantScrollController, restaurantItemWidth),

          // Appbar
          CustomAppBar(),
        ],
      ),
      // Floating action button to navigate to the checkout screen
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/checkout');
        },
        child: Icon(Icons.payment),
      ),
    );
  }

  // Get the screen size
  Size get size => MediaQuery.of(context).size;

  // Calculate the width of each restaurant item to center the list view
  double get restaurantItemWidth => size.width / 2 + 50;

  @override
  void initState() {
    super.initState();
    // Initialize the scroll controllers
    backgroundScrollController = ScrollController();
    restaurantScrollController = ScrollController();
    // Connecting Background list and Restaurant list
    // When the restaurant list is scrolled, it will jump to the corresponding position in the background list
    restaurantScrollController.addListener(() {
      backgroundScrollController.jumpTo(
        restaurantScrollController.offset * (size.width / restaurantItemWidth),
      );
    });
  }

  @override
  void dispose() {
    // Dispose the scroll controllers to avoid memory leaks
    backgroundScrollController.dispose();
    restaurantScrollController.dispose();
    super.dispose();
  }
}

