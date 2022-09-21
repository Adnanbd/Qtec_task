import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtec_task/Bloc/cubit/product_cubit.dart';
import 'package:qtec_task/Bloc/cubit/search_result_cubit.dart';
import 'package:qtec_task/Screens/search_product_screen.dart';
import 'package:qtec_task/Services/http_services.dart';

void main() {
  runApp( MyApp(
    httpService: HttpService(),
  ));
}

class MyApp extends StatelessWidget {

  final HttpService httpService;
  const MyApp({super.key, required this.httpService});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchResultCubit>(
          create: (context) => SearchResultCubit(
            httpService: httpService,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Qtec Task',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SearchProductScreen(),
      ),
    );
  }
}
