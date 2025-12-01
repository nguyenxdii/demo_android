class Song {
  final String title;
  final String artist;
  final String audioPath; // Tên file nhạc (ví dụ: song1.mp3)
  final String lyricPath;
  final String coverImage;

  Song({
    required this.title,
    required this.artist,
    required this.audioPath,
    required this.lyricPath,
    required this.coverImage,
  });

  static List<Song> getSongs() {
    return [
      Song(
        title: "Lời Yêu Em",
        artist: "Vũ.",
        audioPath: "loiyeuem.mp3", // File phải có trong assets/audio/
        lyricPath: "assets/lyrics/loiyeuem.lrc",
        coverImage: "assets/images/vu.jpg",
      ),
      Song(
        title: "Không Yêu Em Thì Yêu Ai",
        artist: "Vũ., Low G",
        audioPath: "khongyeuemthiyeuai.mp3",
        lyricPath: "assets/lyrics/khongyeuemthiyeuai.lrc",
        coverImage: "assets/images/khongyeuemthiyeuai.jpg",
      ),
      Song(
        title: "Cắt Đôi Nỗi Sầu",
        artist: "Tăng Duy Tân",
        audioPath: "song3.mp3", // Giả sử có thêm bài này
        lyricPath: "assets/lyrics/song3.lrc",
        coverImage: "assets/images/chisa.jpg",
      ),
    ];
  }
}
