class Experience {
  final String fromYear;
  final String? toYear;
  final String title;
  final String company;
  final String location;
  final bool kCombinedExperience;
  final List<String> description;

  Experience(
      {required this.fromYear,
        this.toYear,
        required this.title,
        required this.company,
        required this.location,
        required this.description,
        this.kCombinedExperience = false});
}
