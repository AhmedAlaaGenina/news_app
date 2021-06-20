import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/data/local/cash_helper.dart';
import 'package:news_app/data/remote/dio_helper.dart';
import 'package:news_app/screens/business/business_screen.dart';
import 'package:news_app/screens/science/science_screen.dart';
import 'package:news_app/screens/search/search_screen.dart';
import 'package:news_app/screens/settings/settings_screen.dart';
import 'package:news_app/screens/sports/sports_screen.dart';
import 'package:news_app/shared/enums/dark_mode.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  bool isDark = false;

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    // SettingsScreen(),
  ];

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: "Business"),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sports"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
    // BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
  ];

  void changeBottomNavBarIndex(int index) {
    currentIndex = index;
    if (index == 1) {
      getSports();
    }
    if (index == 2) {
      getScience();
    }
    emit(NewsBottomNavBarState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());

    if (business.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '6eecb2cdc77b48f588b00745de886cb0',
      }).then((value) {
        business = value.data['articles'];
        // print(business[0]['title']);
        emit(NewsGetBusinessSuccessState());
      }).catchError(
        (onError) {
          print(onError.toString());
          emit(NewsGetBusinessErrorState(onError.toString()));
        },
      );
    } else {
      emit(NewsGetBusinessSuccessState());
    }
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsGetSportsLoadingState());
    if (sports.isEmpty) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '6eecb2cdc77b48f588b00745de886cb0',
      }).then((value) {
        sports = value.data['articles'];
        // print(business[0]['title']);
        emit(NewsGetSportsSuccessState());
      }).catchError(
        (onError) {
          print(onError.toString());
          emit(NewsGetSportsErrorState(onError.toString()));
        },
      );
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceLoadingState());
    if (science.isEmpty) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '6eecb2cdc77b48f588b00745de886cb0',
      }).then((value) {
        science = value.data['articles'];
        // print(business[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError(
        (onError) {
          print(onError.toString());
          emit(NewsGetScienceErrorState(onError.toString()));
        },
      );
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(url: 'v2/everything', query: {
      'q': '$value',
      'sortBy': 'publishedAt',
      'apiKey': '6eecb2cdc77b48f588b00745de886cb0',
    }).then((value) {
      search = value.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError(
      (onError) {
        print(onError.toString());
        emit(NewsGetSearchErrorState(onError.toString()));
      },
    );
  }

  void changeAppModeTheme({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(NewsChangeModeState());
    } else {
      isDark = !isDark;
      CashHelper.setBoolData(
        key: darkMode.isDarkMode.toString(),
        value: isDark,
      ).then((value) => emit(NewsChangeModeState()));
    }
  }
}
