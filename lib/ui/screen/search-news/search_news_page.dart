// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_android_programming_apps/bloc/news_bloc.dart';
import 'package:test_android_programming_apps/shared/themes.dart';
import 'package:test_android_programming_apps/ui/widgets/custom_news_item.dart';
import 'package:test_android_programming_apps/ui/widgets/custom_text_input.dart';

class SearchNewsPage extends StatefulWidget {
  const SearchNewsPage({super.key});

  @override
  State<SearchNewsPage> createState() => _SearchNewsPageState();
}

class _SearchNewsPageState extends State<SearchNewsPage> {
  final queryController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBgColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          children: [
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Search news',
                    style: blackText.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(height: 14),
                  CustomTextInput(
                    text: 'Search or type news',
                    isShowTitle: false,
                    controller: queryController,
                    onFieldSubmitted: (value) {
                      if (value.isNotEmpty) {
                        GetNewsByQuery(
                          queryController.text.trim(),
                        );
                      }
                      setState(() {});
                    },
                  ),
                  queryController.text.isEmpty ? emptyNews() : newsResult(),
                  SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget newsResult() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: BlocProvider(
          create: (context) =>
              NewsBloc()..add(GetNewsByQuery(queryController.text)),
          child: BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              if (state is NewsSuccess) {
                return Column(
                  children: state.articles.map((articles) {
                    return CustomNewsItem(articles: articles);
                  }).toList(),
                );
              }
              return Center(
                child: Container(
                  margin: EdgeInsets.only(top: 100),
                  child: CircularProgressIndicator(
                    color: darkColor,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget emptyNews() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 150),
        child: Column(
          children: [
            Text(
              'What Are You Looking For ?',
              style: darkText.copyWith(
                fontSize: 22,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/icon_dog.png',
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
