
class ChatModel {
  final String avatarUrl;
  final String name;
  final String datetime;
  final String message;

  ChatModel({this.avatarUrl, this.name, this.datetime, this.message});

  static final List<ChatModel> dummyData = [
    ChatModel(
      avatarUrl:
          "https://yt3.ggpht.com/a/AATXAJzmYgjAFevozmRp6rVDkT767DBGpc3kop_C7A=s288-c-k-c0xffffffff-no-rj-mo",
      name: "Communiqué concernant youtube pour les francophones".toUpperCase(),
      datetime: "2018-12-19 20:18",
      message: "How about meeting tomorrow?",
    ),
    ChatModel(
      avatarUrl:
          "https://yt3.ggpht.com/a/AATXAJzmYgjAFevozmRp6rVDkT767DBGpc3kop_C7A=s288-c-k-c0xffffffff-no-rj-mo",
      name: "Prière du réseau easter 12/.4/2020 (4:00)".toUpperCase(),
      datetime: "2018-12-19 19:22",
      message: "I love that idea, it's great!",
    ),
    ChatModel(
      avatarUrl: "https://p9.storage.canalblog.com/96/34/1660541/125180306.jpg",
      name: "Kanguka de Mardi le 14/04/2020 (4:00)",
      datetime: "2020-04-14 04:00",
      message: "I wasn't aware of that. Let me check",
    ),
    ChatModel(
      avatarUrl:
          "https://yt3.ggpht.com/a/AATXAJzmYgjAFevozmRp6rVDkT767DBGpc3kop_C7A=s288-c-k-c0xffffffff-no-rj-mo",
      name: "Joe",
      datetime: "2018-12-19 11:05",
      message: "Flutter just release 1.0 officially. Should I go for it?",
    ),
    ChatModel(
      avatarUrl: "https://p9.storage.canalblog.com/96/34/1660541/125180306.jpg",
      name: "Mark",
      datetime: "2018-12-19 09:46",
      message: "It totally makes sense to get some extra day-off.",
    ),
    ChatModel(
      avatarUrl:
          "https://yt3.ggpht.com/a/AATXAJzmYgjAFevozmRp6rVDkT767DBGpc3kop_C7A=s288-c-k-c0xffffffff-no-rj-mo",
      name: "Williams",
      datetime: "2018-12-19 08:15",
      message: "It has been re-scheduled to next Saturday 7.30pm",
    ),
  ];
}
