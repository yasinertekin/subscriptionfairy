import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: implementation_imports
import 'package:gen/src/index.dart';
import 'package:kartal/kartal.dart';
import 'package:subscriptionfairy/feature/home/view/widget/home_subscription_card.dart';
import 'package:subscriptionfairy/feature/home/view_model/home_view_model.dart';
import 'package:subscriptionfairy/product/core/app_cubit.dart';
import 'package:subscriptionfairy/product/core/app_state.dart';
import 'package:subscriptionfairy/product/initialize/language/locale_keys.g.dart';
import 'package:subscriptionfairy/product/initialize/navigation/navigation_service.dart';
import 'package:subscriptionfairy/product/model/subscriptions/subscriptions.dart';
import 'package:subscriptionfairy/product/widget/other/common_bloc_builder.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

part 'widget/home_app_bar.dart';
part 'widget/home_date_range_picker.dart';
part 'widget/subscription_detail_expansion_tile.dart';
part 'widget/subscription_details_list_tile.dart';

/// This is the view for the home feature.
final class HomeView extends StatelessWidget {
  /// This is the constructor for the home view.
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<ScaffoldState>();
    return CommonBlocBuilder(
      key: key,
      builder: (context, state) {
        final subscriptionList =
            (state as AppLoadedState).users.subscriptionList;
        return Scaffold(
          appBar: const _HomeAppBar(),
          body: _HomeBuilder(
            subscriptionList,
            key,
          ),
        );
      },
    );
  }
}

final class _HomeBuilder extends StatelessWidget {
  const _HomeBuilder(
    this.subscriptionList,
    this.scaffoldKey,
  );
  final List<Subscriptions>? subscriptionList;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final totalPrices = subscriptionList
        ?.map((e) => e.price)
        .fold<num>(0, (value, element) => value + (element ?? 0));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SubscriptionDetailsExpansionTile(
          totalPrices: totalPrices,
          subscriptionList: subscriptionList,
        ),
        // ignore: use_if_null_to_convert_nulls_to_bools
        if (subscriptionList?.isNotEmpty == true)
          _SubscriptionList(
            subscriptionList: subscriptionList,
            scaffoldKey: scaffoldKey,
          )
        else
          Expanded(
            child: Center(
              child: const Text(
                LocaleKeys.home_youHaveNoSubscriptions,
              ).tr(),
            ),
          ),
      ],
    );
  }
}

final class _SubscriptionList extends StatelessWidget {
  const _SubscriptionList({
    required this.subscriptionList,
    required this.scaffoldKey,
  });

  final List<Subscriptions>? subscriptionList;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: subscriptionList?.length,
        itemBuilder: (context, index) {
          return HomeSubscriptionCard(
            scaffoldKey: scaffoldKey,
            index: index,
            subscriptions: subscriptionList?[index],
          );
        },
      ),
    );
  }
}
