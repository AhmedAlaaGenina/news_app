import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/news_cubit.dart';
import 'package:news_app/screens/search/search_screen.dart';
import 'package:news_app/shared/function/function.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("News App"),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(
                    context,
                    SearchScreen(),
                  );
                },
                icon: Icon(
                  Icons.search,
                  // color: Colors.deepOrange,
                ),
              ),
              IconButton(
                onPressed: () {
                  cubit.changeAppModeTheme();
                },
                icon: Icon(
                  Icons.brightness_4_outlined,
                  // color: Colors.deepOrange,
                ),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItems,
            onTap: cubit.changeBottomNavBarIndex,
            currentIndex: cubit.currentIndex,
          ),
        );
      },
    );
  }
}
