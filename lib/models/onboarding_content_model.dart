class OnboardingContent {
 final String image;
 final String title;
 final String description;

  OnboardingContent({required this.image,required this.title,required this.description});
}

List<OnboardingContent> contents = [
  OnboardingContent(
    title: 'Safe and easy',
    image: 'assets/images/onboarding_1.png',
    description: "The safest and easiest way to save and save money"
  ),
  OnboardingContent(
    title: 'Integrated process',
    image: 'assets/images/onboarding_2.png',
    description: "Say goodbye to slow and inconvenient processes"
  ),
  OnboardingContent(
    title: 'With just one app',
    image: 'assets/images/onboarding_3.png',
    description: "All your needs are integrated with just one application"
  ),
];