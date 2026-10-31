import 'package:flutter/material.dart';
import '../../../../core/constants/dummy_data.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/kos_sorter.dart';
import '../../../../shared/models/kampus_model.dart';
import '../../../../shared/models/kos_model.dart';
import '../widgets/campus_dropdown.dart';
import '../widgets/kos_card.dart';

class HomeTestScreen extends StatefulWidget {
  const HomeTestScreen({super.key});

  @override
  State<HomeTestScreen> createState() => _HomeTestScreenState();
}

class _HomeTestScreenState extends State<HomeTestScreen> {
  late KampusModel _selectedCampus;
  late List<KosModel> _sortedKosList;

  @override
  void initState() {
    super.initState();
    _selectedCampus = DummyData.kampusList.first;
    _updateSortedKos();
  }

  void _updateSortedKos() {
    setState(() {
      _sortedKosList = KosSorter.getSortedKosList(
        kosList: DummyData.kosList,
        targetCampus: _selectedCampus,
      );
    });
  }

  void _onCampusChanged(KampusModel? newCampus) {
    if (newCampus != null && newCampus != _selectedCampus) {
      _selectedCampus = newCampus;
      _updateSortedKos();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kost Point - Padang'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _CampusSelectorSection(
                    selectedCampus: _selectedCampus,
                    onChanged: _onCampusChanged,
                  ),
                  const SizedBox(height: 16),
                  _ResultSummarySection(
                    campusName: _selectedCampus.shortName,
                    kosCount: _sortedKosList.length,
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final kos = _sortedKosList[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: KosCard(
                      kos: kos,
                      onTap: () => _showDetailBottomSheet(context, kos),
                    ),
                  );
                },
                childCount: _sortedKosList.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 24),
          ),
        ],
      ),
    );
  }

  void _showDetailBottomSheet(BuildContext context, KosModel kos) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => _KosDetailSheet(kos: kos),
    );
  }
}

class _CampusSelectorSection extends StatelessWidget {
  final KampusModel selectedCampus;
  final ValueChanged<KampusModel?> onChanged;

  const _CampusSelectorSection({
    required this.selectedCampus,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pilih Kampus Tujuan',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        CampusDropdown(
          campuses: DummyData.kampusList,
          selectedCampus: selectedCampus,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class _ResultSummarySection extends StatelessWidget {
  final String campusName;
  final int kosCount;

  const _ResultSummarySection({
    required this.campusName,
    required this.kosCount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Kos di Sekitar $campusName',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          '$kosCount Ditemukan',
          style: theme.textTheme.bodySmall?.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

class _KosDetailSheet extends StatelessWidget {
  final KosModel kos;

  const _KosDetailSheet({required this.kos});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            kos.name,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            kos.address,
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            kos.formattedPrice,
            style: theme.textTheme.titleSmall?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Fasilitas Utama:',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Wrap(
            spacing: 8,
            runSpacing: 6,
            children: kos.facilities.map((f) {
              return Chip(
                label: Text(f, style: const TextStyle(fontSize: 12)),
                backgroundColor: AppColors.background,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.chat_outlined),
            label: Text('Hubungi Pemilik via WA (${kos.whatsappNumber})'),
          ),
        ],
      ),
    );
  }
}
