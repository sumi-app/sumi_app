class AnsiColor {
  static const ansiEsc = '\x1B[';
  static const ansiDefault = '${ansiEsc}0m';

  final int? fg;
  final int? bg;

  AnsiColor.fg(this.fg) : bg = null;

  @override
  String toString() {
    if (fg != null) {
      return '${ansiEsc}38;5;${fg}m';
    } else if (bg != null) {
      return '${ansiEsc}48;5;${bg}m';
    } else {
      return '';
    }
  }

  String call(String msg) => '${this}$msg$ansiDefault';
}
