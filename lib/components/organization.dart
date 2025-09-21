import 'package:flutter/material.dart';

class Organization {
  final String name;
  final String subtitle;
  final String memberCount;
  final double rating;
  final String imageUrl;
  final String backgroundUrl;

  Organization({
    required this.name,
    required this.subtitle,
    required this.memberCount,
    required this.rating,
    required this.imageUrl,
    required this.backgroundUrl,
  });
}

// Dummy data
final List<Organization> organizations = [
  Organization(
    name: 'Protect Sea Life',
    subtitle: 'The Pearl Protectors',
    memberCount: '100+ MEMBERS',
    rating: 4.8,
    imageUrl: 'assets/images/join1.png',
    backgroundUrl: 'assets/images/join1.png',
  ),
  Organization(
    name: 'Ocean Cleanup',
    subtitle: 'Wave Warriors',
    memberCount: '250+ MEMBERS',
    rating: 4.9,
    imageUrl: 'assets/images/join2.png',
    backgroundUrl: 'assets/images/join2.png',
  ),
  Organization(
    name: 'Marine Conservation',
    subtitle: 'Coral Guardians',
    memberCount: '150+ MEMBERS',
    rating: 4.7,
    imageUrl: 'assets/images/join3.png',
    backgroundUrl: 'assets/images/join3.png',
  ),
];

class OrganizationCard extends StatelessWidget {
  final Organization organization;

  const OrganizationCard({
    super.key,
    required this.organization,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(organization.backgroundUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.black.withOpacity(0.1),
              Colors.black.withOpacity(0.6),
            ],
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                organization.memberCount,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Spacer(),
            Center(
              child:Column(
                children:[
                  Text(
              organization.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              organization.subtitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
                ]
              )
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  organization.rating.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 4),
                ...List.generate(
                  5,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 2),
                    child: Icon(
                      Icons.star,
                      size: 16,
                      color: index < organization.rating
                          ? Colors.amber
                          : Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OrganizationsList extends StatelessWidget {
  final Function(Organization) onOrganizationTap;
  
  const OrganizationsList({
    super.key,
    required this.onOrganizationTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: organizations.map((org) => GestureDetector(
        onTap: () => onOrganizationTap(org),
        child: OrganizationCard(
          organization: org,
        ),
      )).toList(),
    );
  }
}
