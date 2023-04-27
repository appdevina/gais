import 'package:flutter/material.dart';
import 'package:gais/widgets/home_data_item.dart';
import 'package:provider/provider.dart';
import 'package:gais/models/user_model.dart';
import 'package:gais/providers/auth_provider.dart';
import 'package:gais/theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Halo, ${user.fullname}',
                    style: primaryTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    '@${user.username}',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: user.profilePhotoUrl != null
                  ? BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          user.profilePhotoUrl ?? '',
                        ),
                        fit: BoxFit.fill,
                      ),
                    )
                  : const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/image_profile.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
            ),
          ],
        ),
      );
    }

    Widget ReportMenuItem() {
      return GestureDetector(
        onTap: () => showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text(
              'Yakin akan membuat request ?',
            ),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Tidak',
                ),
              ),
            ],
          ),
        ),
        child: Container(
          width: 155,
          height: 155,
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/problem.jpg',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'Report',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget RequestMenuItem() {
      return Container(
        width: 155,
        height: 155,
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    'assets/request.jpg',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              'Request',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      );
    }

    Widget buildHomeMenu(BuildContext context) {
      return Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What you need ?',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Wrap(
              spacing: 17,
              runSpacing: 17,
              children: [
                ReportMenuItem(),
                RequestMenuItem(),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Data',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Wrap(
              spacing: 17,
              runSpacing: 17,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HomeDataItem(
                      iconUrl: 'assets/ic_product.png',
                      title: 'Barang',
                      onTap: () {},
                    ),
                    HomeDataItem(
                      iconUrl: 'assets/ic_category.png',
                      title: 'Kategori',
                      onTap: () {},
                    ),
                    HomeDataItem(
                      iconUrl: 'assets/ic_unittype.png',
                      title: 'Tipe Unit',
                      onTap: () {
                        Navigator.pushNamed(context, '/unittype');
                      },
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      );
    }

    return ListView(
      children: [
        header(),
        buildHomeMenu(context),
      ],
    );
  }
}
