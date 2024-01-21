import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';
import 'package:subscriptionfairy/feature/home/view_model/home_view_model.dart';
import 'package:subscriptionfairy/feature/home/view_model/mixin/home_subscription_card_mixin.dart';
import 'package:subscriptionfairy/product/core/app_cubit.dart';
import 'package:subscriptionfairy/product/core/app_state.dart';
import 'package:subscriptionfairy/product/mixin/succesfull_lottie.dart';
import 'package:subscriptionfairy/product/model/subscriptions/subscriptions.dart';
import 'package:subscriptionfairy/product/utility/padding/project_padding.dart';
import 'package:subscriptionfairy/product/widget/custom_cached_network_image.dart';

/// This is the view for the home feature.
final class HomeSubscriptionCard extends StatefulWidget with SuccesFullLottie {
  /// This is the constructor for the home view.
  const HomeSubscriptionCard({
    required this.index,
    required this.state,
    super.key,
  });

  /// This is the state for the home view.
  final AppLoadedState state;

  /// This is the index for the home view.
  final int index;

  @override
  State<HomeSubscriptionCard> createState() => _HomeSubscriptionCardState();
}

final class _HomeSubscriptionCardState extends State<HomeSubscriptionCard>
    with HomeSubscriptionCardMixin, SuccesFullLottie {
  @override
  Widget build(BuildContext context) {
    final startDate =
        widget.state.users.subscriptionList?[widget.index].startDate;
    final formattedDate = DateFormat.yMMMd().format(
      startDate ?? DateTime.now(),
    );
    final endDate = widget.state.users.subscriptionList?[widget.index].endDate;
    final formattedEndDate = DateFormat.yMMMd().format(
      endDate ?? DateTime.now(),
    );

    final subscriptionList = widget.state.users.subscriptionList?[widget.index];
    final cubit = context.read<AppCubit>();

    final homeViewModel = HomeViewModel();

    return Padding(
      padding: const ProjectPadding.allSmall(),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListenableBuilder(
          listenable: homeViewModel,
          builder: (context, child) => ExpansionTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CustomCachedNetworkImage(
                imageUrl: subscriptionList?.subscriptionIcon ?? '',
                height: context.sized.dynamicHeight(0.1),
                width: context.sized.dynamicWidth(0.2),
              ),
            ),
            title: Text(
              subscriptionList?.name ?? '',
            ),
            subtitle: Text(
              '${subscriptionList?.price ?? ''} TL',
            ),
            trailing: homeViewModel.isProcessing
                ? const CircularProgressIndicator()
                : Switch(
                    onChanged: (value) async {
                      homeViewModel.changeProcessing();
                      succesFullLottie(
                        context,
                      );
                      await cubit.updateSubscriptions(
                        subscriptionList!,
                        subscriptionList.copyWith(
                          isSubscribed: value,
                        ),
                      );
                      homeViewModel.changeProcessing();
                    },
                    value: subscriptionList?.isSubscribed ?? false,
                  ),
            children: [
              _subscriptionDateListTile(
                formattedDate,
                formattedEndDate,
                context,
              ),
              _SubscriptionPlanType(subscriptionList: subscriptionList),
            ],
          ),
        ),
      ),
    );
  }

  ListTile _subscriptionDateListTile(
    String formattedDate,
    String formattedEndDate,
    BuildContext context,
  ) {
    return ListTile(
      title: Text(
        'Başlangıç Tarihi: $formattedDate',
      ),
      subtitle: Text(
        'Bitiş Tarihi: $formattedEndDate',
      ),
      trailing: IconButton(
        onPressed: () {
          showCustomDatePicker(
            context,
            controller,
          );
        },
        icon: const Icon(
          Icons.calendar_today,
        ),
      ),
    );
  }
}

final class _SubscriptionPlanType extends StatelessWidget {
  const _SubscriptionPlanType({
    required this.subscriptionList,
  });

  final Subscriptions? subscriptionList;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppCubit>();
    final homeViewModel = HomeViewModel();
    return ListTile(
      title: Text(
        subscriptionList?.subscriptionPlan ?? '',
      ),
      trailing: ListenableBuilder(
        listenable: homeViewModel,
        builder: (context, child) => homeViewModel.isProcessing
            ? const CircularProgressIndicator()
            : IconButton(
                onPressed: () async {
                  homeViewModel.changeProcessing();

                  await cubit.deleteSubscriptionList(subscriptionList!);

                  homeViewModel.changeProcessing();
                },
                icon: const Icon(
                  Icons.delete_forever_sharp,
                ),
              ),
      ),
    );
  }
}
