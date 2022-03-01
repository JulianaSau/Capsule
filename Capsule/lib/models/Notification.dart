class NotificationModel {
  final String avatarUrl;
  final String name;
  final String datetime;
  final String message;

  NotificationModel(
      {required this.avatarUrl,
      required this.name,
      required this.datetime,
      required this.message});

  static final List<NotificationModel> dummyData = [
    NotificationModel(
      avatarUrl:
          "https://res.cloudinary.com/trillestbrunette/image/upload/v1642779268/cld-sample.jpg",
      name: "Laurent",
      datetime: "20:18",
      message: "How about meeting tomorrow?",
    ),
    NotificationModel(
      avatarUrl:
          "https://res.cloudinary.com/trillestbrunette/image/upload/v1642779268/cld-sample.jpg",
      name: "Tracy",
      datetime: "19:22",
      message: "I love that idea, it's great!",
    ),
    NotificationModel(
      avatarUrl:
          "https://res.cloudinary.com/trillestbrunette/image/upload/v1642779268/cld-sample.jpg",
      name: "Claire",
      datetime: "14:34",
      message: "I wasn't aware of that. Let me check",
    ),
    NotificationModel(
      avatarUrl:
          "https://res.cloudinary.com/trillestbrunette/image/upload/v1642779268/cld-sample.jpg",
      name: "Joe",
      datetime: "11:05",
      message: "Flutter just release 1.0 officially. Should I go for it?",
    ),
    NotificationModel(
      avatarUrl:
          "https://res.cloudinary.com/trillestbrunette/image/upload/v1642779268/cld-sample.jpg",
      name: "Mark",
      datetime: "09:46",
      message: "It totally makes sense to get some extra day-off.",
    ),
    NotificationModel(
      avatarUrl:
          "https://res.cloudinary.com/trillestbrunette/image/upload/v1642779268/cld-sample.jpg",
      name: "Williams",
      datetime: "08:15",
      message: "It has been re-scheduled to next Saturday 7.30pm",
    ),
  ];
}
