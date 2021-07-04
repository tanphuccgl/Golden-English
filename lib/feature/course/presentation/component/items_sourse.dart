List<ItemsCourse> myList = [item1, item2, item3, item4, item5, item6];
class ItemsCourse {
  String title;
  String subtitle;
  String event;
  String img;
  Function function;

  ItemsCourse({this.title, this.subtitle, this.event, this.img, this.function});
}
ItemsCourse item1 = new ItemsCourse(
  title: "Show Course",
  subtitle: "March, Wednesday",
  event: "3 Events",
  img: "assets/logos/ic_launcher.png",)
;

ItemsCourse item2 = new ItemsCourse(
  title: "Add Course",
  subtitle: "Bocali, Apple",
  event: "4 Items",
  img: "assets/logos/ic_launcher.png",
);

ItemsCourse item3 = new ItemsCourse(
  title: "Locations",
  subtitle: "Lucy Mao going to Office",
  event: "",
  img: "assets/logos/ic_launcher.png",
);

ItemsCourse item4 = new ItemsCourse(
  title: "Activity",
  subtitle: "Rose favirited your Post",
  event: "",
  img: "assets/logos/ic_launcher.png",
);

ItemsCourse item5 = new ItemsCourse(
  title: "To do",
  subtitle: "Homework, Design",
  event: "4 Items",
  img: "assets/logos/ic_launcher.png",
);

ItemsCourse item6 = new ItemsCourse(
  title: "Settings",
  subtitle: "",
  event: "2 Items",
  img: "assets/logos/ic_launcher.png",
);