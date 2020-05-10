class Slide {

  final String imageUrl;
  final String title;
  final String description;

  Slide({ this.imageUrl, this.title, this.description });

}

final slideList = [
  Slide(
    imageUrl: 'assets/images/workshop3.png',
    title: 'Workshop',
    description: 'We organise workshops that teach essential skills which may not be taught in your classroom. Learn how to build your own apps and the development tools that is used in the actual industry.',
  ),

  Slide(
    imageUrl: 'assets/images/competition3.png',
    title: 'Competitions',
    description: 'We participate in competitions such as Hackathons (building apps) and CTFs (hacking) to test our skills and promote our growth.',
  ),

  Slide(
    imageUrl: 'assets/images/projects3.png',
    title: 'Projects',
    description: 'We collaborate with each other to apply our knowledge by building real projects that can benefits the local community.',
  ),

  Slide(
    imageUrl: 'assets/images/mission.png',
    title: 'Mission',
    description: 'To build a platform where students can learn beyond the classroom, participate in tech competition, and collaborate in building real projects for the community, together.',
  ),
];