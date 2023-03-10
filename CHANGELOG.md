# Changelog

## 2023-??-?? - 1.3.7

- [199](https://github.com/Smashing/smashing/pull/199)  Bump rack from 2.2.4 to 2.2.6.3

## 2022-12-08 - 1.3.6

- [190](https://github.com/Smashing/smashing/pull/190) Add sprockets precompile rake task
- [196](https://github.com/Smashing/smashing/pull/196) Replaced open with URI.open, as Kernel#open was deprecated in Ruby 2.7 and doens't work anymore with Ruby 3 (thanks @thomaswitt)
- [197](https://github.com/Smashing/smashing/pull/197) Update rack requirement from ~> 2.2 to >= 2.2, < 4.0 (thanks to @dependabot)

## 2021-07-01 - 1.3.5

- [186](https://github.com/Smashing/smashing/pull/186) Escape widget error message (thanks @gebhardtr) ([CVE-2021-35440](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-35440))
- [142](https://github.com/Smashing/smashing/issues/142) Add screenshots
- [166](https://github.com/Smashing/smashing/issues/166) Update installation instructions docs for Windows
- [168](https://github.com/Smashing/smashing/issues/168) Update installation instructions docs for Windows
- [174](https://github.com/Smashing/smashing/issues/174) Update troubleshooting docs with note about thin_http_parser error
- [167](https://github.com/Smashing/smashing/issues/167) Update troubleshooting docs with note about raspberry pi error

## 2021-03-07 - 1.3.4

- [184](https://github.com/Smashing/smashing/pull/184) Add switch to not filter events (thanks @toy)

## 2021-03-06 - 1.3.3

- [182](https://github.com/Smashing/smashing/pull/182) Create EventSource at the right moment (thanks @toy)

## 2021-02-27 - 1.3.2

- [179](https://github.com/Smashing/smashing/pull/179) Replace Travis CI by GH actions
- [178](https://github.com/Smashing/smashing/pull/178) Relax dependencies; pinned minor, free patch version (thanks @dylanratcliffe)
- [173](https://github.com/Smashing/smashing/pull/173) Send only data that is needed on the dashboard (thanks @toy)

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
