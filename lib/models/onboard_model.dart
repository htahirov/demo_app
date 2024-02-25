class OnboardModel {
  const OnboardModel({
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  static const List<OnboardModel> onboardItems = [
    OnboardModel(
      image: '',
      title: 'Title one',
      description: 'Description one',
    ),
    OnboardModel(
      image: '',
      title: 'Title two',
      description: 'Description two',
    ),
    OnboardModel(
      image: '',
      title: 'Title three',
      description: 'Description three',
    ),
  ];
}
