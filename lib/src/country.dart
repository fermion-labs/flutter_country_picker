import 'country_localizations.dart';

///The country Model that has all the country
///information needed from the [country_picker]
class Country {
  ///The country phone code
  final String phoneCode;

  ///The country code, ISO (alpha-2)
  final String countryCode;
  final int e164Sc;
  final bool geographic;
  final int level;

  ///The country name in English
  final String name;

  ///An example of a telephone number without the phone code
  final String example;

  ///Country name (country code) [phone code]
  final String displayName;

  ///An example of a telephone number with the phone code and plus sign
  final String? fullExampleWithPlusSign;

  ///Country name (country code)

  final String displayNameNoCountryCode;
  final String e164Key;

  @Deprecated('The modern term is displayNameNoCountryCode. '
      'This feature was deprecated after v1.0.6.')
  String get displayNameNoE164Cc => displayNameNoCountryCode;

  Country({
    required this.phoneCode,
    required this.countryCode,
    required this.e164Sc,
    required this.geographic,
    required this.level,
    required this.name,
    required this.example,
    required this.displayName,
    required this.displayNameNoCountryCode,
    required this.e164Key,
    this.fullExampleWithPlusSign,
  });

  Country.from({required Map<String, dynamic> json})
      : phoneCode = json['e164_cc'],
        countryCode = json['iso2_cc'],
        e164Sc = json['e164_sc'],
        geographic = json['geographic'],
        level = json['level'],
        name = json['name'],
        example = json['example'],
        displayName = json['display_name'],
        fullExampleWithPlusSign = json['full_example_with_plus_sign'],
        displayNameNoCountryCode = json['display_name_no_e164_cc'],
        e164Key = json['e164_key'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['e164_cc'] = phoneCode;
    data['iso2_cc'] = countryCode;
    data['e164_sc'] = e164Sc;
    data['geographic'] = geographic;
    data['level'] = level;
    data['name'] = name;
    data['example'] = example;
    data['display_name'] = displayName;
    data['full_example_with_plus_sign'] = fullExampleWithPlusSign;
    data['display_name_no_e164_cc'] = displayNameNoCountryCode;
    data['e164_key'] = e164Key;
    return data;
  }

  bool startsWith(String query, CountryLocalizations? localizations) =>
      name.toLowerCase().startsWith(query.toLowerCase()) ||
      countryCode.toLowerCase().startsWith(query.toLowerCase()) ||
      (localizations
              ?.countryName(countryCode: countryCode)
              ?.toLowerCase()
              .startsWith(query.toLowerCase()) ??
          false);

  @override
  String toString() => 'Country(countryCode: $countryCode, name: $name)';

  @override
  bool operator ==(Object other) {
    if (other is Country) {
      return other.countryCode == countryCode;
    }

    return super == other;
  }

  @override
  int get hashCode => super.hashCode;
}
