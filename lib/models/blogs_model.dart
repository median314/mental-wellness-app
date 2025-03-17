// abstract class BlogsModel {
//   late final String id;
//   late final String? title;
//   late final DateTime? createdAt;
//   late final String? imageUrl;
//   late final String? content;
//   late final String? readMinutes;

//   Blog({
//     required id,
//     required title,
//     required createdAt,
//     required content,
//     required readMinutes
//   });

//   // Create a Blog from JSON data
//   factory Blog.fromJson(Map<String, dynamic> json) {
//     return Blog(
//       id: json['id'],
//       title: json['title'],
//       content: json['content'],
//     );
//   }
// }