import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static const _coverPhotoUrl =
      'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=1400&q=85';
  static const _profilePhotoUrl =
      'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=crop&w=400&q=85';

  String _selectedTab = 'All';

  Widget _circleIcon(IconData icon, String label, {double size = 20}) {
    return Semantics(
      label: label,
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          color: Color(0xFFF0F2F5),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: size, color: const Color(0xFF1C1E21)),
      ),
    );
  }

  Widget _profileImage() {
    return Container(
      width: 112,
      height: 112,
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: Image.network(
          _profilePhotoUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            color: const Color(0xFFE4E6EB),
            alignment: Alignment.center,
            child: const Icon(Icons.person, size: 56, color: Color(0xFF65676B)),
          ),
        ),
      ),
    );
  }

  Widget _tab(String name, IconData icon) {
    final selected = _selectedTab == name;
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => setState(() => _selectedTab = name),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 11),
          decoration: BoxDecoration(
            color: selected ? const Color(0xFFE7F3FF) : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 18,
                color: selected
                    ? const Color(0xFF1877F2)
                    : const Color(0xFF65676B),
              ),
              const SizedBox(width: 6),
              Text(
                name,
                style: TextStyle(
                  color: selected
                      ? const Color(0xFF1877F2)
                      : const Color(0xFF65676B),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _personalDetail(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 23, color: const Color(0xFF65676B)),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xFF65676B),
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    color: Color(0xFF1C1E21),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    _circleIcon(Icons.menu, 'Menu'),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        'John Doe',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    _circleIcon(Icons.edit_outlined, 'Edit profile'),
                    const SizedBox(width: 8),
                    _circleIcon(Icons.search, 'Search'),
                    const SizedBox(width: 8),
                    _circleIcon(Icons.more_horiz, 'More options'),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 255,
                width: double.infinity,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox(
                      height: 205,
                      width: double.infinity,
                      child: Image.network(
                        _coverPhotoUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: const Color(0xFFCCD0D5),
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.landscape,
                            size: 48,
                            color: Color(0xFF65676B),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 14,
                      bottom: 62,
                      child: _circleIcon(
                        Icons.camera_alt,
                        'Change cover photo',
                      ),
                    ),
                    Positioned(left: 16, top: 151, child: _profileImage()),
                    Positioned(
                      left: 95,
                      top: 225,
                      child: Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE4E6EB),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          size: 18,
                          color: Color(0xFF1C1E21),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1C1E21),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '3 posts  ·  Iloilo City',
                      style: TextStyle(fontSize: 14, color: Color(0xFF65676B)),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: FilledButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.add, size: 20),
                            label: const Text('Add to story'),
                            style: FilledButton.styleFrom(
                              backgroundColor: const Color(0xFF1877F2),
                              foregroundColor: Colors.white,
                              minimumSize: const Size.fromHeight(42),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: FilledButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.edit, size: 18),
                            label: const Text('Edit profile'),
                            style: FilledButton.styleFrom(
                              backgroundColor: const Color(0xFFE4E6EB),
                              foregroundColor: const Color(0xFF1C1E21),
                              minimumSize: const Size.fromHeight(42),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F2F5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.lock_outline,
                            color: Color(0xFF65676B),
                            size: 21,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Your profile is locked',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF1C1E21),
                                  ),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  'Only friends can see your full profile and photos.',
                                  style: TextStyle(
                                    color: Color(0xFF65676B),
                                    fontSize: 13,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.only(top: 6),
                                    minimumSize: Size.zero,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    alignment: Alignment.centerLeft,
                                  ),
                                  child: const Text('Learn more'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        _tab('AI', Icons.auto_awesome),
                        const SizedBox(width: 6),
                        _tab('Photos', Icons.photo_library_outlined),
                        const SizedBox(width: 6),
                        _tab('Reels', Icons.video_library_outlined),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Divider(height: 1, color: Color(0xFFE4E6EB)),
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Personal details',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1C1E21),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          tooltip: 'Edit personal details',
                          icon: const Icon(
                            Icons.edit_outlined,
                            color: Color(0xFF65676B),
                          ),
                        ),
                      ],
                    ),
                    _personalDetail(
                      Icons.location_on_outlined,
                      'Location',
                      'Iloilo City, Philippines',
                    ),
                    _personalDetail(
                      Icons.home_outlined,
                      'Address',
                      'Pavia, Iloilo',
                    ),
                    _personalDetail(
                      Icons.cake_outlined,
                      'Birth date',
                      'January 16, 2000',
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
