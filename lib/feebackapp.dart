import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DialogBoxRating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Rate Us'),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomDialog();
              },
            );
          },
        ),
      ),
    );
  }
}

//dailogbox used for rating purpose

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Rating',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 20,),
            RatingBarScreen(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ThankYouDialog();
                  },
                );
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}


class RatingBarScreen extends StatefulWidget {
  const RatingBarScreen({Key? key}) : super(key: key);

  @override
  State<RatingBarScreen> createState() => _RatingBarScreenState();
}

class _RatingBarScreenState extends State<RatingBarScreen> {
  double emojiRating = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              allowHalfRating: false,
              unratedColor: Colors.grey,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              updateOnDrag: true,
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return Icon(
                      Icons.sentiment_very_dissatisfied,
                      color: emojiRating == 1 ? Colors.red : Colors.grey,
                    );
                  case 1:
                    return Icon(
                      Icons.sentiment_dissatisfied,
                      color: emojiRating == 2 ? Colors.redAccent : Colors.grey,
                    );
                  case 2:
                    return Icon(
                      Icons.sentiment_neutral,
                      color: emojiRating == 3 ? Colors.amber : Colors.grey,
                    );
                  case 3:
                    return Icon(
                      Icons.sentiment_satisfied,
                      color: emojiRating == 4 ? Colors.lightGreen : Colors.grey,
                    );
                  case 4:
                    return Icon(
                      Icons.sentiment_very_satisfied,
                      color: emojiRating == 5 ? Colors.green : Colors.grey,
                    );
                  default:
                    return Container();
                }
              },
              onRatingUpdate: (ratingValue) {
                setState(() {
                  emojiRating = ratingValue;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text(
              emojiRating == 1
                  ? "SICK"
                  : emojiRating == 2
                  ? "BAD"
                  : emojiRating == 3
                  ? "OKAY"
                  : emojiRating == 4
                  ? "GOOD"
                  : emojiRating == 5
                  ? "GREAT"
                  : "",
              style: TextStyle(
                fontWeight: FontWeight.w400,

                fontSize: 18.0,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}




//dailogbox popped after submitting the rating

class ThankYouDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Thank You',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 20,),
            Text(
              'Thank you for your rating!',
              style: TextStyle(
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20,),
            SizedBox(
              width: 80.0,
              height: 30.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('Close'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


