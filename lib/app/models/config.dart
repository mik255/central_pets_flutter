
class Config{
  Config({required this.keepConnected});
  bool keepConnected = false;

  copyWith({bool? keepConnected}){
    return Config(
      keepConnected: keepConnected ?? this.keepConnected,
    );
  }

}