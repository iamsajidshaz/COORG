class HomeStays {
  final String title;
  final String subTitle;
  final String urlImage;
  final String imageOne;
  final String imageTwo;
  final String imageThree;
  final List<String> facilities;

  const HomeStays({
    required this.title,
    required this.subTitle,
    required this.urlImage,
    required this.imageOne,
    required this.imageTwo,
    required this.imageThree,
    required this.facilities,
  });
}

const allHomeStays = [
  HomeStays(
    title: 'RICHBERRY- A Premium Plantation Villa',
    subTitle: 'BM Road, 7th hoskote, Suntikoppa',
    urlImage: "assets/images/richberry.jpg",
    imageOne: "assets/images/richberry_one.jpg",
    imageTwo: "assets/images/richberry_two.jpg",
    imageThree: "assets/images/richberry_three.jpg",
    facilities: ["fac1", "fac2"],
  ),
  HomeStays(
    title: "Green Nest Plantation(Kingmaker's Plantation)",
    subTitle: "Kadagadal - Boikeri Rd, Ibnivalvadi Rural",
    urlImage: "assets/images/kingmaker.jpg",
    imageOne: "assets/images/kingmaker_one.jpg",
    imageTwo: "assets/images/kingmaker_two.jpg",
    imageThree: "assets/images/kingmaker_three.jpg",
    facilities: ["fac1", "fac2", "fac3"],
  ),
  HomeStays(
    title: 'RICHBERRY- A Premium Plantation Villa',
    subTitle: 'BM Road, 7th hoskote, Suntikoppa',
    urlImage: "assets/images/richberry.jpg",
    imageOne: "assets/images/richberry_one.jpg",
    imageTwo: "assets/images/richberry_two.jpg",
    imageThree: "assets/images/richberry_three.jpg",
    facilities: ["fac1", "fac2", "fac3", "fac4"],
  ),
  HomeStays(
    title: 'RICHBERRY- A Premium Plantation Villa',
    subTitle: 'BM Road, 7th hoskote, Suntikoppa',
    urlImage: "assets/images/richberry.jpg",
    imageOne: "assets/images/richberry_one.jpg",
    imageTwo: "assets/images/richberry_two.jpg",
    imageThree: "assets/images/richberry_three.jpg",
    facilities: ["fac1", "fac2", "fac3", "fac4", "fac5"],
  ),
];
