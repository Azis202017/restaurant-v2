import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:resto/apps/pages/detail_page.dart';
import 'package:resto/apps/providers/search_provider.dart';
import 'package:resto/apps/services/api_service.dart';
import 'package:resto/theme/color/color.dart';
import 'package:resto/theme/fonts/fonts.dart';

class SearchPage extends StatelessWidget {
  static const routeName = '/search-page';
  final String? query;
  const SearchPage({Key? key, this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ChangeNotifierProvider(
        create: (context) => SearchRestaurantProvider(
            apiService: ApiService(), query: query!.toLowerCase()),
        child: Consumer<SearchRestaurantProvider>(builder: (context, state, _) {
          if (state.state == ResultState.loading) {
            return const Material(
                child: Center(child: CircularProgressIndicator()));
          } else if (state.state == ResultState.hasData) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: ColorApp.primaryColor,
                title: const Text('Pencarian'),
              ),
              body: ListView.separated(
                  itemBuilder: (context, index) {
                    var dataResto = state.result.restaurants![index];
                    return Container(
                      padding: const EdgeInsets.only(
                        top: 12,
                        bottom: 12,
                      ),
                      decoration: BoxDecoration(
                        color: ColorApp.whiteColor,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, DetailPage.routeName,
                              arguments: dataResto);
                        },
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            'https://restaurant-api.dicoding.dev/images/small/${dataResto.pictureId}',
                          ),
                        ),
                        title: Text('${dataResto.name}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            Text(
                              '${dataResto.description}',
                              style: FontApp.descriptionText.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_sharp,
                                  color: ColorApp.primaryColor,
                                ),
                                Text(
                                  '${dataResto.city}',
                                  style: FontApp.descriptionText.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  Icons.star_rate,
                                  color: ColorApp.primaryColor,
                                ),
                                Text(
                                  '${dataResto.rating}',
                                  style: FontApp.descriptionText.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, __) {
                    return const SizedBox(height: 16);
                  },
                  itemCount: state.result.restaurants!.length),
            );
          } else if (state.state == ResultState.noData) {
            return Material(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.network(
                      "https://assets2.lottiefiles.com/packages/lf20_xlkigwme.json"),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text('Hasil pencarian tidak ditemukan'),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: ColorApp.primaryColor),
                    child: const Text('Kembali '),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            );
          } else if (state.state == ResultState.error) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/json/empty-state-wifi.json',
                    width: double.infinity,
                    height: 300,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    state.message,
                    style: FontApp.descriptionText,
                    textAlign: TextAlign.center,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: ColorApp.primaryColor),
                    child: const Text('Kembali '),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            );
          } else {
            return const Center(
              child: Text(''),
            );
          }
        }),
      ),
    );
  }
}
