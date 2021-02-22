# Changelog

## 2021-??-?? - 1.3.2

- [179](https://github.com/Smashing/smashing/pull/179) Replace Travis CI by GH actions

## 2021-01-30 - 1.3.1

- [177](https://github.com/Smashing/smashing/pull/177) Remove websocket connections that have been closed in send_event (thanks @ssgelm)

## 2020-06-04 - 1.3.0

- [#157](https://github.com/Smashing/smashing/pull/157) Update gems
- [#155](https://github.com/Smashing/smashing/pull/155) Fix bug causing AnimatedValue to freeze after same value is entered
- [#162](https://github.com/Smashing/smashing/pull/162) Add version command
- [#163](https://github.com/Smashing/smashing/pull/163) Disable the twitter job and comment out the gem dependency
- Dropped Ruby 2.2 in Travis due to rack requiring >= 2.3.0

## 2020-05-19 - 1.2.0

- [#151](https://github.com/Smashing/smashing/pull/151) Upgrading font awesome to 5.11
- [#153](https://github.com/Smashing/smashing/pull/153) Fix GitHub security alert updating to rake 12.3.3
- [#147](https://github.com/Smashing/smashing/pull/147) Checking for existing displayedValue
- [#141](https://github.com/Smashing/smashing/pull/141) Disable warnings in test, circular require warning we're clouding up
- [#135](https://github.com/Smashing/smashing/pull/135) Fixing favicon location
- [#137](https://github.com/Smashing/smashing/pull/137) Use {} as fallback for history.yaml
- [#103](https://github.com/Smashing/smashing/pull/103) Don't display exception pages to users by default
- [#107](https://github.com/Smashing/smashing/pull/107) Update to latest gridster to fix touch input bug
- [#95](https://github.com/Smashing/smashing/pull/95) Silence rake warnings about unused vars
- [#96](https://github.com/Smashing/smashing/pull/96) Added Batman filter 'shortenedBytes'

## 2017-12-25 - 1.1.0

- [#25](https://github.com/Smashing/smashing/pull/25) Add data transformation method to widget base
- [#27](https://github.com/Smashing/smashing/pull/27) Add error string when widget not rendered
- [73e75f](https://github.com/Smashing/smashing/commit/73e75f) Switched background colors for 'danger' and 'warning'
- [#53](https://github.com/Smashing/smashing/pull/52) Use old-style hash syntax to enable compatibility with ruby 1.8.7
- [7a6d67](https://github.com/Smashing/smashing/commit/7a6d67) Update gemspec to have a valid link to the Smashing GitHub pages site
- [#56](https://github.com/Smashing/smashing/pull/56) Change update time on events
- [#60](https://github.com/Smashing/smashing/pull/60) Fix favicon url
- [#11](https://github.com/Smashing/smashing/pull/11) Update Rufus-Scheduler version
- [#67](https://github.com/Smashing/smashing/pull/67) Capture Interrupt error (Ctrl+c) and cleanly exit
- [fa7cf4](https://github.com/Smashing/smashing/commit/fa7cf4) Don't multiply the updatedAt timestamp by 1000
- [855348](https://github.com/Smashing/smashing/commit/855348) Travis: Change to pre-installed Rubies, drop 2.1
- [4e2b7f](https://github.com/Smashing/smashing/commit/4e2b7f) Update all gems
- [305193](https://github.com/Smashing/smashing/commit/305193) Facilitate testing

## 2016-10-23 - 1.0.0

- First release after Dashing: https://github.com/Shopify/dashing/issues/711
