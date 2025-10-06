// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:neoterra/models/vibe.dart';

import '../models/language_model.dart';

class AppConstants {
  static String APP_NAME = "project_template";

  // share preference Key
  static String THEME = "theme";

  static const String LANGUAGE_CODE = 'language_code';
  static const String COUNTRY_CODE = 'country_code';

  static RegExp emailValidator = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  static RegExp passwordValidator = RegExp(
    r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$",
  );
  static List<LanguageModel> languages = [
    LanguageModel(
      languageName: 'English',
      countryCode: 'US',
      languageCode: 'en',
    ),
    LanguageModel(languageName: 'عربى', countryCode: 'SA', languageCode: 'ar'),
    LanguageModel(
      languageName: 'Spanish',
      countryCode: 'ES',
      languageCode: 'es',
    ),
  ];

  static List<Vibe> vibes = [
    Vibe(
      name: "Hip-Hop",
      description: "Rap• Trap• Dance",
      coverImage: "assets/images/hiphop.jpg",
      iconImage: "assets/images/hiphop_logo.png",
    ),
    Vibe(
      name: "R&B",
      description: "Contemporary R&B",
      coverImage: "assets/images/rnb.jpg",
      iconImage: "assets/images/rnb_logo.png",
    ),
    Vibe(
      name: "Global Sounds",
      description: "Reggaetón •Salsa/Bachata • Baile",
      coverImage: "assets/images/globalsounds.jpg",
      iconImage: "assets/images/globalsounds_logo.png",
    ),
    Vibe(
      name: "Inclusive Events",
      description: "LGBTQ+ events • Trans & Non-Binary",
      coverImage: "assets/images/inclusiveevents.jpg",
      iconImage: "assets/images/inclusiveevents_logo.png",
    ),
    Vibe(
      name: "House & Dance",
      description: "Deep • Soulful • Tech • Disco",
      coverImage: "assets/images/housendance.jpg",
      iconImage: "assets/images/housendance_logo.png",
    ),
    Vibe(
      name: "Day Parties & Social Vibes",
      description: "Brunch • Rooftop • Pool • Open-Air",
      coverImage: "assets/images/daypartiesnsocialvibes.jpg",
      iconImage: "assets/images/daypartiesnsocialvibes_logo.png",
    ),
    Vibe(
      name: "Culture, Creativity & Community",
      description:
          "Mixers • Poetry • Film • Art • Comedy •Fashion •Cultural Markets",
      coverImage: "assets/images/culturecreativityncommunity.jpg",
      iconImage: "assets/images/culturecreativityncommunity_logo.png",
    ),
    Vibe(
      name: "Wellness",
      description:
          "Movement & Fitness • Mind & Soul •Healing •Nature & Outdoor",
      coverImage: "assets/images/wellness.jpg",
      iconImage: "assets/images/wellness_logo.png",
    ),
  ];
}
