class HotelListData {
  String imagePath;
  String titleTxt;
  String subTxt;
  String roomSold;
 

  HotelListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.subTxt = '',
    this.roomSold ='',
  
  });

  static List<HotelListData> hotelList = <HotelListData>[
    HotelListData(
      imagePath: 'assets/hotels/hotel_5.jpg',
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      roomSold: '3 rooms ',
    ),
    HotelListData(
      imagePath: 'assets/hotels/hotel_4.jpg',
      titleTxt: 'Queen Hotel',
      subTxt: 'Wembley, London',
      roomSold: 'Grand Royal Hotel',
    ),
    HotelListData(
      imagePath: 'assets/hotels/hotel_3.jpg',
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      roomSold: 'Grand Royal Hotel',   
    ),
    HotelListData(
      imagePath: 'assets/hotels/hotel_2.jpg',
      titleTxt: 'Queen Hotel',
      subTxt: 'Wembley, London',
      roomSold: 'Grand Royal Hotel',
    ),
    HotelListData(
      imagePath: 'assets/hotels/hotel_1.jpg',
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      roomSold: 'Grand Royal Hotel',
      
    ),
  ];
}
