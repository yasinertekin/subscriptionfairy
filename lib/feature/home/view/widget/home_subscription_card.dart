import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';
import 'package:subscriptionfairy/feature/home/view_model/mixin/custom_card_mixin.dart';
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
    with HomeSubscriptionCardMixin {
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

    return Padding(
      padding: const ProjectPadding.allSmall(),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: ExpansionTile(
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
          trailing: Switch(
            onChanged: (value) async {
              await cubit.deleteSubscriptionList(
                subscriptionList!,
              );
            },
            value: subscriptionList?.isSubscribed ?? false,
          ),
          children: [
            _subscriptionDateListTile(formattedDate, formattedEndDate, context),
            _SubscriptionPlanType(subscriptionList: subscriptionList),
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
    return ListTile(
      title: Text(
        subscriptionList?.subscriptionPlan ?? '',
      ),
    );
  }
}
