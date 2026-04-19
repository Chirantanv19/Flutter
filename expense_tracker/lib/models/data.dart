// // Parent
// class ParentWidget extends StatefulWidget {
//   @override
//   _ParentWidgetState createState() => _ParentWidgetState();
// }

// class _ParentWidgetState extends State<ParentWidget> {
//   String receivedData = "";

//   void _handleData(String data) {
//     setState(() {
//       receivedData = data;  // Update parent state
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(receivedData),  // Show received data
//         ChildWidget(onDataReturn: _handleData),  // Pass callback
//       ],
//     );
//   }
// }

// // Child
// class ChildWidget extends StatelessWidget {
//   const ChildWidget({required this.onDataReturn});
  
//   final void Function(String) onDataReturn;  // Callback type

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () => onDataReturn("Data from child"),  // Call callback
//       child: Text("Send Data"),
//     );
//   }
// }