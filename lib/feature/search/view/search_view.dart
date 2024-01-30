import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:subscriptionfairy/feature/search/view_model/search_view_model.dart';
import 'package:subscriptionfairy/product/initialize/language/locale_keys.g.dart';
import 'package:subscriptionfairy/product/model/subscription_list/subscriptions_list.dart';
import 'package:subscriptionfairy/product/utility/padding/project_padding.dart';
import 'package:subscriptionfairy/product/widget/card/subscriptions_list_card.dart';
import 'package:subscriptionfairy/product/widget/lottie/lottie_search.dart';

part 'widget/search_app_bar.dart';
part 'widget/search_text_field.dart';

/// SearchView
final class SearchView extends StatelessWidget {
  /// Default constructor
  const SearchView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final receivedData =
        ModalRoute.of(context)!.settings.arguments! as List<SubscriptionsList>;

    final controller = TextEditingController();
    final searchProvider = SearchViewModel();
    return ListenableBuilder(
      listenable: searchProvider,
      builder: (context, child) => Scaffold(
        appBar: const _SearchAppBar(),
        body: _SearchViewBody(
          controller: controller,
          searchProvider: searchProvider,
          subscriptions: receivedData,
        ),
      ),
    );
  }
}

final class _SearchViewBody extends StatelessWidget {
  const _SearchViewBody({
    required this.controller,
    required this.searchProvider,
    required this.subscriptions,
  });

  final TextEditingController controller;
  final SearchViewModel searchProvider;
  final List<SubscriptionsList> subscriptions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.allSmall(),
      child: Column(
        children: [
          _SearchTextField(
            subscriptions: subscriptions,
            controller: controller,
            searchProvider: searchProvider,
          ),
          if (searchProvider.subscriptions.isNotEmpty ||
              controller.text.isNotEmpty)
            _SearchList(
              searchProvider: searchProvider,
              subscriptionList: subscriptions,
            )
          else
            const LottieSearch(),
        ],
      ),
    );
  }
}

final class _SearchList extends StatelessWidget {
  const _SearchList({
    required this.searchProvider,
    required this.subscriptionList,
  });

  final SearchViewModel searchProvider;
  final List<SubscriptionsList> subscriptionList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: searchProvider.subscriptions.length,
        itemBuilder: (context, index) {
          final subscription = searchProvider.subscriptions[index];
          return SubscriptionsListCard(
            subscription: subscription,
            index: index,
          );
        },
      ),
    );
  }
}
