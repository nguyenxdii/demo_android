import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../models/song.dart';

class PlayerScreen extends StatefulWidget {
  final List<Song> songs;
  final int initialIndex;

  const PlayerScreen({
    super.key,
    required this.songs,
    required this.initialIndex,
  });

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late AudioPlayer _player;
  late int _currentIndex;

  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _player = AudioPlayer();

    _initAudioPlayer();
  }

  Future<void> _initAudioPlayer() async {
    // 1. Lắng nghe vị trí hiện tại
    _player.positionStream.listen((p) {
      if (mounted) setState(() => _position = p);
    });

    // 2. Lắng nghe tổng thời lượng
    _player.durationStream.listen((d) {
      if (mounted) setState(() => _duration = d ?? Duration.zero);
    });

    // 3. Lắng nghe trạng thái để tự động chuyển bài khi hết
    _player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        _onNext();
      }
    });

    // 4. Bắt đầu tải và phát nhạc
    await _loadSong();
  }

  Future<void> _loadSong() async {
    try {
      // just_audio cần đường dẫn đầy đủ từ thư mục gốc
      final path = 'assets/audio/${widget.songs[_currentIndex].audioPath}';
      await _player.setAsset(path);
      _player.play(); // Tự động phát khi tải xong
    } catch (e) {
      debugPrint("Lỗi tải nhạc: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Không tìm thấy file: ${widget.songs[_currentIndex].audioPath}",
          ),
        ),
      );
    }
  }

  void _onNext() {
    setState(() {
      if (_currentIndex < widget.songs.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0; // Vòng lại bài đầu
      }
    });
    _loadSong();
  }

  void _onPrevious() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
      } else {
        _currentIndex = widget.songs.length - 1;
      }
    });
    _loadSong();
  }

  void _onPlayPause() {
    if (_player.playing) {
      _player.pause();
    } else {
      _player.play();
    }
  }

  void _onSeek(double value) {
    _player.seek(Duration(seconds: value.toInt()));
  }

  @override
  void dispose() {
    _player.dispose(); // Cực kỳ quan trọng để giải phóng tài nguyên
    super.dispose();
  }

  String _formatDuration(Duration d) {
    final min = d.inMinutes.toString().padLeft(2, '0');
    final sec = (d.inSeconds % 60).toString().padLeft(2, '0');
    return '$min:$sec';
  }

  @override
  Widget build(BuildContext context) {
    final currentSong = widget.songs[_currentIndex];

    return Scaffold(
      backgroundColor: Colors.black, // Nền tối cho sang trọng
      appBar: AppBar(
        title: const Text("Đang Phát"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // 1. Ảnh bìa
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.indigoAccent.withOpacity(0.6),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage(currentSong.coverImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          // 2. Thông tin bài hát
          Text(
            currentSong.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            currentSong.artist,
            style: const TextStyle(color: Colors.white54, fontSize: 18),
          ),

          const SizedBox(height: 30),

          // 3. Thanh trượt thời gian
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Slider(
                  min: 0,
                  max: _duration.inSeconds.toDouble(),
                  value: _position.inSeconds.toDouble().clamp(
                    0,
                    _duration.inSeconds.toDouble(),
                  ),
                  activeColor: Colors.indigoAccent,
                  inactiveColor: Colors.grey[800],
                  onChanged: _onSeek,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _formatDuration(_position),
                        style: const TextStyle(color: Colors.white70),
                      ),
                      Text(
                        _formatDuration(_duration),
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // 4. Các nút điều khiển
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.skip_previous_rounded,
                  size: 45,
                  color: Colors.white,
                ),
                onPressed: _onPrevious,
              ),
              const SizedBox(width: 20),

              // Nút Play/Pause lớn ở giữa
              StreamBuilder<bool>(
                stream: _player.playingStream,
                builder: (context, snapshot) {
                  final playing = snapshot.data ?? false;
                  return Container(
                    decoration: const BoxDecoration(
                      color: Colors.indigoAccent,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      iconSize: 50,
                      icon: Icon(
                        playing
                            ? Icons.pause_rounded
                            : Icons.play_arrow_rounded,
                      ),
                      color: Colors.white,
                      onPressed: _onPlayPause,
                    ),
                  );
                },
              ),

              const SizedBox(width: 20),
              IconButton(
                icon: const Icon(
                  Icons.skip_next_rounded,
                  size: 45,
                  color: Colors.white,
                ),
                onPressed: _onNext,
              ),
            ],
          ),

          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
