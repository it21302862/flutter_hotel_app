class HotelListData {
  String imagePath;
  String titleTxt;
  String subTxt;
  String roomSold;
  String salary;

  HotelListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.subTxt = '',
    this.roomSold = '',
    this.salary = '',
  });

  static List<HotelListData> hotelList = <HotelListData>[
    HotelListData(
      imagePath: 'assets/hotels/hotel_5.jpg',
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      roomSold: '3 Rooms SOLD',
      salary: '\$358',
    ),
    HotelListData(
      imagePath: 'assets/hotels/hotel_4.jpg',
      titleTxt: 'Queen Hotel',
      subTxt: 'Wembley, London',
      roomSold: '5 Rooms SOLD',
      salary: '\$200',
    ),
    HotelListData(
      imagePath: 'assets/hotels/hotel_3.jpg',
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      roomSold: '2 Rooms SOLD',
      salary: '\$191',
    ),
    HotelListData(
      imagePath: 'assets/hotels/hotel_2.jpg',
      titleTxt: 'Queen Hotel',
      subTxt: 'Wembley, London',
      roomSold: '7 Rooms SOLD',
      salary: '\$200',
    ),
    HotelListData(
      imagePath: 'assets/hotels/hotel_1.jpg',
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      roomSold: '10 Rooms SOLD',
      salary: '\$250',
    ),
  ];
}
