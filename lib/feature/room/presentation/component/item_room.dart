 List<ItemsRoom> myList = [item1, item2, item3, item4, item5, item6];
class ItemsRoom {
  String title;
  String subtitle;
  String event;
  String img;
  Function function;

  ItemsRoom({this.title, this.subtitle, this.event, this.img, this.function});
}
ItemsRoom item1 = new ItemsRoom(
  title: "Show Room",
  subtitle: "March, Wednesday",
  event: "3 Events",
  img: "assets/logos/ic_launcher.png",)
;

ItemsRoom item2 = new ItemsRoom(
  title: "Add Room",
  subtitle: "Bocali, Apple",
  event: "4 Items",
  img: "assets/logos/ic_launcher.png",
);

ItemsRoom item3 = new ItemsRoom(
  title: "Locations",
  subtitle: "Lucy Mao going to Office",
  event: "",
  img: "assets/logos/ic_launcher.png",
);

ItemsRoom item4 = new ItemsRoom(
  title: "Activity",
  subtitle: "Rose favirited your Post",
  event: "",
  img: "assets/logos/ic_launcher.png",
);

ItemsRoom item5 = new ItemsRoom(
  title: "To do",
  subtitle: "Homework, Design",
  event: "4 Items",
  img: "assets/logos/ic_launcher.png",
);

ItemsRoom item6 = new ItemsRoom(
  title: "Settings",
  subtitle: "",
  event: "2 Items",
  img: "assets/logos/ic_launcher.png",
);