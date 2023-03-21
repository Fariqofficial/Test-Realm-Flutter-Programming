// ignore_for_file: prefer_const_constructors_in_immutables

part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class GetNewsByQuery extends NewsEvent {
  final String query;

  GetNewsByQuery(this.query);

  @override
  List<Object> get props => [query];
}
