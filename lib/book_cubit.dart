import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'book.dart';

part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(BookInitial());

  List<Book> _allBooks = [];
  SortBy _lastSortBy = SortBy.author;

  void init() {
    emit(BookLoading());
    _allBooks = _getBooks();
    sortBooks(_lastSortBy);
  }

  void sortBooks(SortBy sortBy) {
    emit(BookLoading());
    _lastSortBy = sortBy;

    List<Book> sortedList = List.from(_allBooks);

    if (sortBy == SortBy.author) {
      sortedList.sort((a, b) => a.author.compareTo(b.author));
    } else {
      sortedList.sort((a, b) => a.title.compareTo(b.title));
    }

    emit(BookListLoaded(books: sortedList, sortBy: sortBy));
  }

  void showBookDetails(Book book) {
    emit(BookDetailLoaded(book: book));
  }

  void showBookList() {
    sortBooks(_lastSortBy);
  }

  List<Book> _getBooks() {
    return const [
      Book(
        title: "Dune",
        author: "Frank Herbert",
        imageUrl: "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1555447414l/44767458.jpg",
        description: "Placeholder description 1",
      ),
      Book(
        title: "The Hobbit",
        author: "J.R.R. Tolkien",
        imageUrl: "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1546071216l/5907.jpg",
        description: "Placeholder description 2",
      ),
      Book(
        title: "1984",
        author: "George Orwell",
        imageUrl: "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1532714506l/40961427.jpg",
        description: "Placeholder description 3",
      ),
    ];
  }
}
