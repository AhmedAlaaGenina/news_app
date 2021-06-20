import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/news_cubit.dart';
import 'package:news_app/cubit/news_cubit.dart';
import 'package:news_app/shared/widgets/widgets.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: BuildTextFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  onChange: (value) {
                    cubit.getSearch(value);
                  },
                  validate: (value) {
                    if (value!.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                  label: 'Search',
                  prefix: Icons.search,
                ),
              ),
              Expanded(
                child: ArticleBuilder(
                  list: cubit.search,
                  isSearch: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
