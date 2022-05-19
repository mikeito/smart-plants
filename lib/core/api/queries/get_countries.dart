const getCountries = r'''
  query Query {
    countries {
      code,
      name,
      native,
      currency,
      emoji,
      emojiU,
    }
  }
''';
