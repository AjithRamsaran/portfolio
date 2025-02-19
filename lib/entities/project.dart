class Project {
  final int id;
  final String name;
  final String company;
  final String description;
  final List<String> technologies;
  final int year;
  final String image;
  final bool isNetwork;

  Project({
    required this.id,
    required this.name,
    required this.description,
    required this.technologies,
    required this.year,
    required this.image,
    required this.company,
    this.isNetwork = false,
  });
}