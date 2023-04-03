class Compose {
  const Compose({
    required this.main,
    required this.machines,
    this.notes,
  });

  final Map<String, bool> main;

  final Map<String, bool> machines;

  final String? notes;

  String buildPrompt() {
    String prompt = """I want to act you as a FabLab Helper.
        I'll provide you with the following information:
        the machines that I will need for my idea, software or 
        prototype, and any other notes that I want to add.
        I need you to provide me with any detailed and helpful
        information that you can give me. The project that I will 
        build is a """;

    main.forEach((key, value) {
      if (value) {
        prompt += '$key ';
      }
    });

    prompt += 'using ';

    machines.forEach((key, value) {
      if (value) {
        prompt += '$key, ';
      }
    });

    if (notes != null) {
      prompt += 'and I want to add the following notes: $notes';
    }

    prompt += """Find helpul information for me or similar projects 
        that I can take inspiration from. Thank you""";

    return prompt;
  }
}
