part of 'book_cubit.dart';

enum SortBy { author, title }

abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

class BookInitial extends BookState {}

class BookLoading extends BookState {}

class BookListLoaded extends BookState {
  final List<Book> books;
  final SortBy sortBy;

  const BookListLoaded({required this.books, required this.sortBy});

  @override
  List<Object> get props => [books, sortBy];
}

class BookDetailLoaded extends BookState {
  final Book book;

  const BookDetailLoaded({required this.book});

  @override
  List<Object> get props => [book];
}