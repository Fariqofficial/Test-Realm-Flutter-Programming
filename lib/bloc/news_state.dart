// ignore_for_file: prefer_const_constructors_in_immutables

part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsFailure extends NewsState {
  final String errorMsg;

  NewsFailure(this.errorMsg);

  @override
  List<Object> get props => [errorMsg];
}

class NewsSuccess extends NewsState {
  final List<ArticleModel> articles;

  NewsSuccess(this.articles);

  @override
  List<Object> get props => [articles];
}
