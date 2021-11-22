import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:resto/apps/model/restaurant.dart';
import 'package:resto/apps/providers/addreview_provider.dart';
import 'package:resto/apps/widgets/add_review_widget.dart';
import 'package:resto/theme/color/color.dart';
import 'package:resto/theme/fonts/fonts.dart';

class AddReviewPage extends StatelessWidget {
  static const routeName = '/addreview';
  final RestaurantsDetails restaurant;

  const AddReviewPage(this.restaurant, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController reviewController = TextEditingController();

    return ChangeNotifierProvider(
      create: (context) => AddReviewProvider(),
      child: Consumer<AddReviewProvider>(builder: (context, state, _) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Tambah Review',
                style: FontApp.descriptionText.copyWith(
                  color: ColorApp.whiteColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              backgroundColor: ColorApp.primaryColor,
            ),
            body: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(left: 24, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 56,
                    ),
                    Text(
                      'Tambah Review',
                      style: FontApp.subtitleText1,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 49,
                      ),
                      child: Text(
                        'Tolong berikan review yang jujur dan tidak menggunakan kalimat kasar',
                        style: FontApp.descriptionText,
                      ),
                    ),
                    const SizedBox(height: 56),
                    TextFormReview(
                      nameController,
                      label: 'Nama Lengkap',
                      hintText: 'Tulis nama lengkap anda ...',
                    ),
                    const SizedBox(height: 16),
                    TextFormReview(
                      reviewController,
                      textInputType: TextInputType.multiline,
                      maxLine: 0,
                      label: 'Review',
                      hintText: 'Tulis review anda ...',
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 42,
                      ),
                      width: double.infinity,
                      height: 49,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: ColorApp.primaryColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          state.postReview(
                            '${restaurant.id}',
                            nameController.text,
                            reviewController.text,
                          );
                          Get.snackbar('Review ditambahkan',
                              'Review berhasil ditambahkan');
                        },
                        child: Text(
                          'Kirim Review',
                          style: FontApp.buttonText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
