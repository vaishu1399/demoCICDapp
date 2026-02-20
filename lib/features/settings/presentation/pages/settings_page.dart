import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:democicdapp/config/routes/app_router.dart';
import 'package:democicdapp/config/providers.dart';
import 'package:democicdapp/core/usecases/usecase.dart';
import 'package:democicdapp/features/settings/domain/entities/app_settings.dart';
import 'package:democicdapp/features/home/presentation/widgets/coming_soon_card.dart';
import 'package:democicdapp/features/home/presentation/widgets/loading_indicator.dart';
import 'package:democicdapp/features/home/presentation/widgets/error_view.dart';

/// Settings page displaying app settings with "Coming Soon" content.
@RoutePage()
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsAsync = ref.watch(settingsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.router.maybePop();
          },
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(settingsProvider);
        },
        child: settingsAsync.when(
          data: (settings) => ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: settings.length,
            itemBuilder: (context, index) {
              final setting = settings[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ComingSoonCard(
                  title: setting.title,
                  description: setting.description,
                  iconName: setting.iconName,
                  onTap: () {
                    context.router.push(
                      SettingDetailRoute(
                        id: setting.id,
                        title: setting.title,
                        description: setting.description,
                      ),
                    );
                  },
                ),
              );
            },
          ),
          loading: () => const LoadingIndicator(),
          error: (error, stack) => ErrorView(
            message: error.toString(),
            onRetry: () {
              ref.invalidate(settingsProvider);
            },
          ),
        ),
      ),
    );
  }
}

/// Provider for settings using FutureProvider.
final settingsProvider = FutureProvider.autoDispose<List<AppSettings>>((
  ref,
) async {
  final useCase = ref.watch(getSettingsUseCaseProvider);
  return await useCase(const NoParams());
});
