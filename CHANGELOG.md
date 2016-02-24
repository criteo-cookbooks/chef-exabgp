# 2.0.0 / 2016-02-24

## Breaking Changes

* This cookbook is now Chef 12.1+ only compatible with a simplified resource
  rewrite. There are some backward-compatible additions noted in the readme.
  The default recipe now is only there for inclusion to let you use the exabgp
  resource.

## Testing

* Added a better testing suite. Will add in better test kitchen coverage in the
  near future.

# 1.1.1 / 2015-06-17

## Cleanup

* Changed attribute access to strings instead of symbols. Resolves a
  Foodcritic warning (FC001)

# 1.1.0 / 2015-06-17

## Enhancements

* Added local-preference attribute to not use ECMP. [PR#6][] [@ton31337][]
* Merged prefix and route attributes into one. [PR#5][] [PR#7][] [@ton31337][]

## Testing

* Laid the groundwork down for an upcoming LWRP for the 2.x release

# 1.0.2 / 2015-02-21

## Enhancements

* Added in a new attribute to allow for disabling the static route in the
  exabgp config template

# 1.0.1 / 2015-01-23

## Bug Fixes

* Sync to master for now to resolve a parse bug with incorrect community
  information

# 1.0.0 / 2015-01-23

## Cleanup

* Updated README and LICENSE, much more to come in the next few releases

## Breaking Changes

* Changed source install to point to the GitHub repository. They moved over
  a year ago, it's time we moved too. This also means we use git and dropped
  the mercurial cookbook dependency
* Defaulted to latest release at the time (3.4.7)

# 0.10.0 / 2015-01-19

## Enhancements

* Adding berkshelf integration

# 0.9.0 / 2013-07-11

* Initial release of exabgp

[PR#5]: https://github.com/aetrion/exabgp-cookbook/pull/5
[PR#6]: https://github.com/aetrion/exabgp-cookbook/pull/6
[PR#7]: https://github.com/aetrion/exabgp-cookbook/pull/7
[@ton31337]: https://github.com/ton31337
