import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/google_maps_widget.dart';
import 'provider/app_bloc.dart';
import 'widgets/menu.dart';
import 'provider/shared_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SharedState(),
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBloc.providers, // Setting up Bloc providers for the entire app.
      child: MaterialApp(
        title: 'GPS Changer', // The title of the application.
        theme: ThemeData(
          primarySwatch: Colors.blue, // Applying a blue color theme.
        ),
        debugShowCheckedModeBanner: false, // Disabling the debug banner.
        home: Scaffold(
          appBar: AppBar(
            title: const Text('GPS Changer'), // Title in the AppBar.
            actions: const [
              Menu(), // Custom menu in the AppBar.
            ],
          ),
          body: const GoogleMapsWidget(), // The main content displaying the Google Map.
        ),
      ),
    );
  }

  @override
  void dispose() {
    AppBloc.dispose(); // Disposing of Bloc resources when the app is closed.
    super.dispose();
  }
}