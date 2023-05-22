import 'common.dart';

class TextDesign extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;
  final String? bold;

  const TextDesign({
    required this.text,
    required this.size,
    this.color,
    this.bold,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.ubuntu(
        fontSize: size,
        color: color,
        fontWeight: bold == "y" ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
