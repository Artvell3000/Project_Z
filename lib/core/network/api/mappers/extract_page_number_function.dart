class ExtractPageNumberFunction {
  static body(String? url) {
    if (url == null) return null;
    return _extractPageNumber(url);
  }

  static int? _extractPageNumber(String url) {
    final regex = RegExp(r'[?&]page=(\d+)');
    final match = regex.firstMatch(url);

    if (match != null && match.groupCount >= 1) {
      return int.tryParse(match.group(1)!);
    }
    return null;
  }
}
