import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:subscriptionfairy/feature/home/view_model/home_view_model.dart';
import 'package:subscriptionfairy/feature/home/view_model/mixin/home_subscription_card_mixin.dart';
import 'package:subscriptionfairy/product/core/app_cubit.dart';
import 'package:subscriptionfairy/product/initialize/language/locale_keys.g.dart';
import 'package:subscriptionfairy/product/mixin/succesfull_lottie.dart';
import 'package:subscriptionfairy/product/model/subscriptions/subscriptions.dart';
import 'package:subscriptionfairy/product/utility/padding/project_padding.dart';
import 'package:subscriptionfairy/product/widget/other/custom_cached_network_image.dart';

/// This is the view for the home feature.
final class HomeSubscriptionCard extends StatefulWidget {
  /// This is the constructor for the home view.
  const HomeSubscriptionCard({
    required this.index,
    required this.subscriptions,
    required this.scaffoldKey,
    super.key,
  });

  /// This is the subscriptions list.
  final Subscriptions? subscriptions;

  /// This is the index for the home view.
  final int index;

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<HomeSubscriptionCard> createState() => _HomeSubscriptionCardState();
}

final class _HomeSubscriptionCardState extends State<HomeSubscriptionCard>
    with HomeSubscriptionCardMixin, SuccesFullLottie {
  @override
  Widget build(BuildContext context) {
    const elevation = 10.0;

    var startDateTime = DateTime.parse(
      widget.subscriptions?.startDate.toString() ?? '',
    );
    var endDateTime = DateTime.parse(
      widget.subscriptions?.endDate.toString() ?? '',
    );

    // Saat, dakika, saniye ve milisaniyeyi sıfırla
    startDateTime =
        DateTime(startDateTime.year, startDateTime.month, startDateTime.day);
    endDateTime =
        DateTime(endDateTime.year, endDateTime.month, endDateTime.day);
    return Padding(
      padding: const ProjectPadding.allSmall(),
      child: Card(
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: context.border.normalBorderRadius,
        ),
        child: ExpansionTile(
          shape: RoundedRectangleBorder(
            borderRadius: context.border.normalBorderRadius,
          ),
          leading: ClipRRect(
            borderRadius: context.border.normalBorderRadius,
            child: CustomCachedNetworkImage(
              imageUrl: widget.subscriptions?.subscriptionIcon ?? '',
              height: context.sized.dynamicHeight(0.1),
              width: context.sized.dynamicWidth(0.14),
              fit: BoxFit.fill,
            ),
          ),
          title: Text(
            widget.subscriptions?.name ?? '',
          ),
          subtitle: Text(
            '${widget.subscriptions?.price ?? ''} \$',
          ),
          trailing: homeViewModel.isProcessing
              ? const CircularProgressIndicator()
              : _CustomSwitch(
                  scaffoldKey: widget.scaffoldKey,
                  subscriptionList: widget.subscriptions,
                ),
          children: [
            _subscriptionDateListTile(
              DateFormat.yMMMd().format(startDateTime),
              DateFormat.yMMMd().format(endDateTime),
              context,
            ),
            _SubscriptionPlanType(
              subscriptionList: widget.subscriptions,
            ),
          ],
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
        '${LocaleKeys.home_startDate.tr()} $formattedDate',
      ).tr(),
      subtitle: Text(
        '${LocaleKeys.home_endDate.tr()} $formattedEndDate',
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

final class _SubscriptionPlanType extends StatelessWidget
    with SuccesFullLottie {
  const _SubscriptionPlanType({
    required this.subscriptionList,
  });

  final Subscriptions? subscriptionList;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppCubit>();
    final homeViewModel = HomeViewModel();
    final scaffoldKey = GlobalKey<ScaffoldState>();
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
                  succesFullLottie(
                    scaffoldKey,
                  );
                },
                icon: const Icon(
                  Icons.delete_forever_sharp,
                ),
              ),
      ),
    );
  }
}

final class _CustomSwitch extends StatelessWidget with SuccesFullLottie {
  const _CustomSwitch({
    required this.subscriptionList,
    required this.scaffoldKey,
  });

  final Subscriptions? subscriptionList;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final homeViewModel = HomeViewModel();
    final cubit = context.read<AppCubit>();
    return ListenableBuilder(
      listenable: homeViewModel,
      builder: (context, child) => Switch(
        onChanged: (value) async {
          homeViewModel.changeProcessing();

          await cubit.updateSubscriptions(
            subscriptionList!,
            subscriptionList!.copyWith(
              isSubscribed: value,
            ),
          );
          homeViewModel.changeProcessing();
          succesFullLottie(
            scaffoldKey,
          );
        },
        value: subscriptionList?.isSubscribed ?? false,
      ),
    );
  }
}
