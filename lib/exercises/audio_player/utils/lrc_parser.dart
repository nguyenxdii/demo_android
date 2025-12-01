import '../models/lyric_line.dart';

class LrcParser {
  /// Parse LRC file content and return list of lyric lines
  static List<LyricLine> parse(String lrcContent) {
    final List<LyricLine> lyrics = [];

    // Split by lines
    final lines = lrcContent.split('\n');

    for (final line in lines) {
      final trimmedLine = line.trim();
      if (trimmedLine.isEmpty) continue;

      // Match pattern [mm:ss.xx] or [mm:ss]
      final regex = RegExp(r'\[(\d{2}):(\d{2})\.?(\d{2})?\](.*)');
      final match = regex.firstMatch(trimmedLine);

      if (match != null) {
        try {
          final minutes = int.parse(match.group(1)!);
          final seconds = int.parse(match.group(2)!);
          final centiseconds = match.group(3) != null
              ? int.parse(match.group(3)!)
              : 0;

          final text = match.group(4)!.trim();

          // Calculate duration
          final duration = Duration(
            minutes: minutes,
            seconds: seconds,
            milliseconds: centiseconds * 10,
          );

          lyrics.add(LyricLine(timestamp: duration, text: text));
        } catch (e) {
          // Skip malformed lines
          continue;
        }
      }
    }

    // Sort by timestamp
    lyrics.sort((a, b) => a.timestamp.compareTo(b.timestamp));

    return lyrics;
  }
}
