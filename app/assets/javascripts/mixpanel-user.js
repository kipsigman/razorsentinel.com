if (config.analytics.enable) {
  if (typeof user != 'undefined') {
    mixpanel.identify(user.id);
    mixpanel.people.set({
      "$first_name": user.firstName,
      "$last_name": user.lastName,
      "$email": user.email
    });
  }
}