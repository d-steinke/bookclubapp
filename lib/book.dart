import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final String title;
  final String author;
  final String imageUrl;
  final String description;

  const Book({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.description,
  });

  List<Object?> get props => [title, author, imageUrl, description];
}