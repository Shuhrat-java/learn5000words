class Word {
  final String value;

  final String type;

  Word(this.value, this.type) {
    if (value.isEmpty || type.isEmpty) {
      throw ArgumentError("Word or it's type can not be empty. ",
          "Received: {$value}, {$type}");
    }
  }
}
