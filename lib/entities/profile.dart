class Profile {
  const Profile({
    required this.url,
    required this.nickname,
    required this.statusMessage,
  });

  final String url;
  final String nickname;
  final String statusMessage;

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      url: json['url'] as String,
      nickname: json['nickname'] as String,
      statusMessage: json['statusMessage'] as String,
    );
  }
}
