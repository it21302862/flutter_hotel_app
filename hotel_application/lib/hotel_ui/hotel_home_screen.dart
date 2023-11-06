import 'package:flutter/material.dart';
import 'package:hotel_application/hotel_ui/hotel_list_model.dart';
import 'package:hotel_application/hotel_ui/hotel_theme.dart';
import 'package:intl/intl.dart';

class HotelHomeScreen extends StatefulWidget {
  const HotelHomeScreen({super.key});

  @override
  State<HotelHomeScreen> createState() => _HotelHomeScreenState();
}

class _HotelHomeScreenState extends State<HotelHomeScreen>
    with TickerProviderStateMixin {
  List<HotelListData> hotelList = HotelListData.hotelList;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2023),
      lastDate: DateTime(2024),
      initialDateRange: DateTimeRange(start: startDate, end: endDate),
    );

    if (picked != null) {
      setState(() {
        startDate = picked.start;
        endDate = picked.end;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          getAppBarUI(),
          Expanded(
              child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    // Return the Column widget with its children

                    return Column(
                      // children: <Widget>[getMyHotelTextUI()],
                      children: <Widget>[getMyHotelTextUI(), getTimeDateUI()],
                    );
                  },
                      childCount:
                          1), // Set the childCount to the number of children you have in the Column
                ),
              ];
            },
            // body: Container(
            //   child: ListView.builder(
            //     itemCount: HotelListData
            //         .hotelList.length, // Use the length of the list
            //     padding: const EdgeInsets.only(top: 8),
            //     scrollDirection: Axis.vertical,
            //     itemBuilder: (context, index) {
            //       final hotel = HotelListData.hotelList[index];
            //       return ListTile(
            //         leading:
            //             Image.asset(hotel.imagePath), // Display the image
            //         title: Text(hotel.titleTxt), // Display the title
            //         subtitle: Text(hotel.subTxt), // Display the subtitle

            //       );
            //     },
            //   ),
            // ),
            body: const HotelListWidget(),
          ))
        ],
      ),
    );
  }

  getMyHotelTextUI() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 8, top: 15, left: 12, right: 16),
      child: Align(
        alignment: Alignment(-0.8, 0.0),
        child: Text(
          "My Hotels",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

//   Widget getTimeDateUI() {
//   DateTime? selectedStartDate;
//   DateTime? selectedEndDate;

//   Future<void> _selectDate(BuildContext context, bool isStartDate) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime(DateTime.now().year + 1),
//     );

//     if (picked != null) {
//       if (isStartDate) {
//         selectedStartDate = picked;
//       } else {
//         selectedEndDate = picked;
//       }
//     }
//   }

//  List<DateTime> savedDates = [];

// void _saveDates() {
//   if (selectedStartDate != null && selectedEndDate != null) {
//     // Make sure both start and end dates are selected
//     savedDates.clear(); // Clear any previous saved dates
//     for (var date = selectedStartDate;
//         date!.isBefore(selectedEndDate!.add(const Duration(days: 1)));
//         date = date.add(const Duration(days: 1))) {
//       savedDates.add(date); // Add each date between start and end dates
//     }
//     // Now, savedDates contains the selected dates between start and end
//     print(savedDates); // You can print or use these dates as needed
//   } else {
//     // Handle the case when either start or end date is missing
//     print("Please select both start and end dates.");
//   }
// }

//   return Column(
//     children: <Widget>[
//       Text('Selected Start Date: ${selectedStartDate?.toString() ?? "Not selected"}'),
//       Text('Selected End Date: ${selectedEndDate?.toString() ?? "Not selected"}'),
//       IconButton(
//         icon: const Icon(Icons.calendar_today),
//         onPressed: () {
//           _selectDate(context, true); // Set true for start date, false for end date
//         },
//       ),
//       ElevatedButton(
//         onPressed: () {
//           _saveDates(); // Call the function to save the selected dates
//         },
//         child: Text("Save"),
//       ),
//       // Your other widgets here
//     ],
//   );
// }

  Widget getAppBarUI() {
    return Container(
        decoration: BoxDecoration(
            color: HotelTheme.buildLightTheme().backgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: const Offset(0, 2),
                blurRadius: 8.0,
              )
            ]),
        child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
//           left: 8,
//           right: 8
            ),
            child: Row(children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                width: AppBar().preferredSize.height + 40,
                height: AppBar().preferredSize.height,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                ),
              ),
              const Expanded(
                  child: Center(
                child: Text(
                  "Hotels",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              )),
              Container(
                  width: AppBar().preferredSize.height + 40,
                  height: AppBar().preferredSize.height,
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                  ))
            ])));
  }

  getTimeDateUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 18, bottom: 16),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Material(
                  color: Colors.transparent,
                  child: GestureDetector(
                    onTap: () {
                      _selectDateRange(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(height: 8),
                          const Icon(
                            Icons.calendar_today,
                            color: Color.fromARGB(255, 6, 7, 8),
                            size: 20,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            "${DateFormat('dd MMM').format(startDate)} to ${DateFormat('dd MMM , yyyy').format(endDate)}",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          )),
          const Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.only(right: 6), // Add margin to the icon
                  child: Icon(
                    Icons.filter_list,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8), // Add margin to the text
                  child: Text(
                    'Hotels',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          )

          // Padding(
          //   padding: const EdgeInsets.only(right: 8),
          //   child: Container(
          //     width: 1,
          //     height: 42,
          //     color: Colors.grey.withOpacity(0.8),
          //   ),
          // ),
          // Expanded(
          //     child: Row(
          //   children: <Widget>[
          //     Material(
          //       color: Colors.transparent,
          //       child: Padding(
          //         padding:
          //             const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: <Widget>[
          //             Text(
          //               'Number of Rooms',
          //               style: TextStyle(
          //                   fontWeight: FontWeight.w100,
          //                   fontSize: 16,
          //                   color: Colors.grey.withOpacity(0.8)),
          //             ),
          //             const SizedBox(height: 8),
          //             const Text(
          //               '1 Room - 2 Adults',
          //               style: TextStyle(
          //                 fontWeight: FontWeight.w100,
          //                 fontSize: 16,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     )
          //   ],
          // ))
        ],
      ),
    );
  }
}

class HotelListWidget extends StatelessWidget {
  const HotelListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: HotelListData.hotelList.length,
        padding: const EdgeInsets.only(top: 8),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final hotel = HotelListData.hotelList[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image.asset(
                    hotel.imagePath,
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  const Positioned(
                    top: 12,
                    right: 12, 
                    child: Icon(Icons.more_vert), // Three dots icon
                  ),
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(58, 165, 61, 1),
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      child: Text(
                        hotel.roomSold,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    // color: Colors.black.withOpacity(0.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          hotel.subTxt,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            height: 1.5,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              hotel.titleTxt,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              hotel.salary, // Align to the right
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        // Add other details as needed
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
