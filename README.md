# adminlte-keycloak-theme
A Keycloak theme based on the AdminLTE UI library

<img src="screenshots/login.png" />

## Installation

To install this theme:
- Clone or download this repository
- Copy the `adminlte` directory from this repository into your Keyloak server's `themes` directory
- Restart your Keycloak server
- Navigate to your Keycloak server's administration console.  Select your realm, and go Realm Settings → Themes.  Select "adminlte" as your login theme.

## Libraries

This theme uses [AdminLTE](https://almsaeedstudio.com/themes/AdminLTE/index2.html), [Bootstrap 3](http://getbootstrap.com/), and [jQuery](https://jquery.com/).  This theme also uses several of the [plugins used by the AdminLTE library](https://almsaeedstudio.com/themes/AdminLTE/documentation/index.html#plugins).

These libraries are included directly in this repository's source for ease of use and development.

## Developing

A few handy things to know while developing:

- Changes to the `.css` and `.js` files (or other items in the `resources` directory) don't require a restart to take effect.
- Changes to `.ftl` template files (or the addition of new `.ftl` files) **do** require a restart before taking effect.

## Notes

This theme is far from complete; there are several workflows and screens which have not yet been templated.  Currently, only a subset of the login screens have been themed.  You can use this theme as a starting point, and feel free to submit pull requests for new features you add!

For more examples of this theme, see the [screenshots](screenshots) directory in this repository.


