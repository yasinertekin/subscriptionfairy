import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subscriptionfairy/feature/search/view_model/search_view_model.dart';
import 'package:subscriptionfairy/product/core/app_cubit.dart';
import 'package:subscriptionfairy/product/core/app_state.dart';
import 'package:subscriptionfairy/product/initialize/language/locale_keys.g.dart';
import 'package:subscriptionfairy/product/utility/padding/project_padding.dart';
import 'package:subscriptionfairy/product/widget/card/subscriptions_list_card.dart';
import 'package:subscriptionfairy/product/widget/lottie/lottie_search.dart';

part 'widget/search_app_bar.dart';
part 'widget/search_text_field.dart';

/// SearchView
final class SearchView extends StatelessWidget {
  /// Default constructor
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppCubit>().state as AppLoadedState;

    final controller = TextEditingController();
    final searchProvider = SearchViewModel();
    return ListenableBuilder(
      listenable: searchProvider,
      builder: (context, child) => Scaffold(
        appBar: const _SearchAppBar(),
        body: _SearchViewBody(
          controller: controller,
          searchProvider: searchProvider,
          state: state,
        ),
      ),
    );
  }
}

final class _SearchViewBody extends StatelessWidget {
  const _SearchViewBody({
    required this.controller,
    required this.searchProvider,
    required this.state,
  });

  final TextEditingController controller;
  final SearchViewModel searchProvider;
  final AppLoadedState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.allSmall(),
      child: Column(
        children: [
          _SearchTextField(
            controller: controller,
            searchProvider: searchProvider,
            state: state,
          ),
          if (searchProvider.subscriptions.isNotEmpty ||
              controller.text.isNotEmpty)
            _SearchList(
              searchProvider: searchProvider,
              state: state,
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
    required this.state,
  });

  final SearchViewModel searchProvider;
  final AppLoadedState state;

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
            state: state,
          );
        },
      ),
    );
  }
}
