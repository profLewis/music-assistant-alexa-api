<!-- https://developers.home-assistant.io/docs/add-ons/presentation#keeping-a-changelog -->

## 1.3.10

- Update the bundled skill to the cosign-signed `v1.6.10` image.
- Fix SonarQube quality gate issues: eliminate duplicate strings, reduce cognitive complexity, remove unused code, validate request_id for security

## 1.3.6-pl.65

- Peach Banana tells the house straight away when its panel closes, so it is reopened in seconds (fewer adverts on the Moon) - skill b3f7e81.

## 1.3.6-pl.64

- Peach Banana: the Hallway is one room again (skill 02240ab) - both radiators, all hallway lights, its own temperature; "landing", "hall", "upper/lower hallway" all mean it. The voice model's room list changed: redeploy it when convenient (closes the Moon's panel ~30 s); until then the old names still resolve to the Hallway.

## 1.3.6-pl.63

- Peach Banana: "Alexa, continue" and "unpause (the music / the radio)" resume the music (skill 75f1d54).

## 1.3.6-pl.62

- Peach Banana: one room warmer or cooler by voice - "boost the kitchen", "increase the temperature in the living room by two degrees", "make Beau's room warmer for an hour", "turn the heating down in the bedroom by one degree for thirty minutes". By 1 degree unless said (up to 4), for the Boost length unless said; Home Assistant's script.heating_room_bump does it (that room's radiators only, a timed boost; the house target is not changed) and words the answer. Inside the panel the answer is said and the panel stays; "Alexa, ask Peach Banana to ..." on another Echo is a one-shot. Voice model changed (BoostIntent slots by / dur / way, HEAT_WAY type, room synonyms): redeploy the model.

## 1.3.6-pl.61

- Peach Banana: "Alexa, stop" (and cancel, pause, "be quiet", "shut up", "that's enough") no longer closes it. It stops what the house is sounding on the Moon - a Peach Banana timer or alarm first (Home Assistant script.peach_hush), else the music or radio (paused), else the screen speaker - and otherwise does nothing; the panel stays. Only "close Peach Banana" / "quit" ends it. Journal line stop-trapped. Voice model changed (QuietIntent, ExitIntent): redeploy the model.

## 1.3.6-pl.60

- Peach Banana: Back garden comes after the Kitchen in the room order (lights screen). No voice model change.

## 1.3.6-pl.59

- Peach Banana: the lights and heating screens list the rooms in the house's order (Sian study after the downstairs loo, Upper hallway after the Bedroom, Beau bedroom before Lewis study); "beau bedroom lights" is Beau's room, not the Bedroom. No voice model change.

## 1.3.6-pl.58

- Peach Banana: the hallway is two rooms, Lower hallway and Upper hallway (each its own lights, radiator and thermometer). "Hall", "downstairs hall", "front hall" = Lower; "landing", "upstairs hall" = Upper; "hallway" alone = both. The voice model's ROOM values changed: redeploy the model.

## 1.3.6-pl.57

- Peach Banana: a number on its own (9-40, halves too: "twenty point five", "nineteen and a half") sets the house target, clamped to the radiators' limits, and says what it set.

## 1.3.6-pl.53

- Peach Banana: "load …" (ready to play, paused) and "unload"; shuffle / repeat are player controls, not searches (a bare "shuffle" flips it).

## 1.3.6-pl.52

- Peach Banana: a station name on its own ("bbc radio four") is the radio.

## 1.3.6-pl.51

- Peach Banana: BBC stations by name, books (my book / read <title>) and podcasts - so the open panel wins over Alexa's own players.

## 1.3.6-pl.50

- Peach Banana: asked by an Echo without the panel, the house plays it on that Echo.

## 1.3.6-pl.49

- Peach Banana: asked to play while its panel is shut (the Show), it opens the panel and the house plays once the panel speaker is there - for the "Peach Banana: ..." Alexa routines; other Echoes play on themselves; "show apesma".

## 1.3.6-pl.48

- Peach Banana: "ask peach banana to play radio four" said while the panel is open plays it (it went to the AI helper as a question).

## 1.3.6-pl.47

- Peach Banana: no listening window after an answer that starts music ("play radio four" with the panel open was rejected by Alexa); the skill journal now covers Peach Banana too.

## 1.3.6-pl.46

- Skill journal: every request and answer is noted in Home Assistant (event `skill_journal`), with Alexa's own error message when it rejects an answer - to find why "turn on radio 4" first gets "there was a problem with the requested skill's response".

## 1.3.6-pl.45
- Peach Banana: a short listening window after it answers, only while nothing plays; stop / pause also work on the rewound radio.

## 1.3.6-pl.44
- Peach Banana: never covers the full panel with the old built-in screens.

## 1.3.6-pl.43
- Peach Banana: "turn on radio 4", "switch on the radio", "tune in to five live", "turn on the archers" play like "play …".

## 1.3.6-pl.42
- Peach Banana: "good morning" (the time, then BBC Radio 4 on the panel, through the house).

## 1.3.6-pl.41

- Skill ad3be13: play this by voice; pause, resume and stop act on the music.

## 1.3.6-pl.40

- Skill 7118320: "not supported on this device" after a restart fixed; timers remember their length.

## 1.3.6-pl.39

- Skill e812f24: timers and alarms kept by the house, no Alexa permission needed.

## 1.3.6-pl.38

- Skill 90ae3c8: a much wider range of phrases goes to the AI helper before Alexa.

## 1.3.6-pl.37

- Skill fb179da: more openings (what does, is, can, do...) go to the AI helper.

## 1.3.6-pl.36

- Skill 31dcbdf: follow-up questions continue the same AI conversation.

## 1.3.6-pl.35

- Skill dcc811e: Peach Banana passes free questions to the AI helper (script.ai_ask), so the panel and music stay.

## 1.3.6-pl.34

- Peach Banana: timers and alarms set, read and cancelled from inside the skill (skill 4606e67).

## 1.3.6-pl.33 (profLewis fork)

- Echo Show: music plays through Alexa's own player, as on any other Echo - not inside the control panel - so a song can't be playing in both at once. (MUSIC_SCREEN_PLAY=true brings the in-panel music back.)

## 1.3.6-pl.32 (profLewis fork)

- Echo Show: with a panel open, "turn the volume down / up / to 4" sets the Echo's own volume (both skills), and in the music skill's panel alarms, timers and anything it doesn't recognise go to Alexa, then the panel comes back with the music playing on. Needs the voice models updated: POST /myhouse/deploy and POST /myhouse/music-volume.

## 1.3.6-pl.31 (profLewis fork)

- Echo Show: music moved onto the Show's own screen speaker keeps playing - Music Assistant stopping the Echo during the hand-over used to reopen the panel paused, and the music stopped.

## 1.3.6-pl.30 (profLewis fork)

- Echo Show: music played to a Show whose control panel isn't really up no longer goes silent. The skill now notices when the panel closes, and if a music hand-off's panel never comes up it lets Alexa's own player play on that Show for 15 minutes (each close is logged with Alexa's reason).

## 1.3.6-pl.29 (profLewis fork)

- Peach Banana: with the panel open, alarms and timers ("set an alarm for 7", "set a 10 minute timer", "cancel my alarm") go to Alexa and the panel comes back after; anything else it doesn't know closes the panel so Alexa can hear it said again (Home Assistant's script.peach_banana_handoff reopens it). Needs the voice model updated: POST /myhouse/deploy.

## 1.3.6-pl.28 (profLewis fork)

- Echo Show: the control panel can ask to be opened again (its screensaver does, a little before Alexa's 30-minute idle limit would close it and show the Show's own slideshow).

## 1.3.6-pl.27 (profLewis fork)

- Echo Show: pausing or stopping from the control panel no longer drops the Show back to Alexa's home screen - the panel opens again at once, paused, on its Music page.

## 1.3.6-pl.26 (profLewis fork)

- The control panel on an Echo Show plays the music itself (Alexa froze it when its own player started).

## 1.3.6-pl.25 (profLewis fork)

- Music played to an Echo Show opens the control panel on its Music page, which then starts the stream from inside it.

## 1.3.6-pl.24 (profLewis fork)

- The control panel inside the music skill on an Echo Show ("Alexa, open music assistant"), so music and screen are one skill; opening it (or Peach Banana) stops the music. Option-free: MUSIC_SCREEN_APP=false turns it off.

## 1.3.6-pl.23 (profLewis fork)

- Peach Banana widgets (Central Control, Peach Banana): set myhouse_client_id / myhouse_client_secret (the skill's Alexa Client Id / Secret) for the live reading.

## 1.3.6-pl.22 (profLewis fork)

- The house skill is now Peach Banana ("Alexa, open Peach Banana").

## 1.3.6-pl.21 (profLewis fork)

- The house skill is now Apple Banana ("Alexa, open Apple Banana").

## 1.3.6-pl.20 (profLewis fork)

- Cat Ballou: fresh start page each time.

## 1.3.6-pl.19 (profLewis fork)

- Cat Ballou signs the Echo Show in with a one-time code each time it opens (set catballou_ha_password to the Echo Show user's password); the Show's browser keeps no stored sign-in.

## 1.3.6-pl.18 (profLewis fork)

- Cat Ballou opens the whole control panel on the Echo Show (web app), signed in as the Echo Show user (catballou_ha_token). Heating settings page.

## 1.3.6-pl.17 (profLewis fork)

- Cat Ballou copies the music skill's per-region endpoints and Wildcard certificate setting, so Amazon calls it.

## 1.3.6-pl.16 (profLewis fork)

- Cat Ballou now uses the same skill address as the music skill (requests are told apart by skill id).

## 1.3.6-pl.15 (profLewis fork)

- Cat Ballou simulator check uses Amazon v2 API.

## 1.3.6-pl.14 (profLewis fork)

- Cat Ballou: a simulator check for diagnosing launches.

## 1.3.6-pl.13 (profLewis fork)

- Cat Ballou lists the Echo screens it supports, so Amazon sends it to the Echo Show.

## 1.3.6-pl.12 (profLewis fork)

- Cat Ballou uses the same endpoint certificate type as the working music skill; a check page shows both skills as Amazon has them.

## 1.3.6-pl.11 (profLewis fork)

- The house skill is now called Cat Ballou ("Alexa, open Cat Ballou"): Alexa took "my house" as a device or area.

## 1.3.6-pl.10 (profLewis fork)

- MyHouse: the house on the Echo Show ("Alexa, open my house") - Home, Lights, Heating and Music screens with touch controls and voice commands, as its own Alexa skill at /myhouse. Needs Home Assistant API access (homeassistant_api). Create it at Amazon with POST /myhouse/deploy.

## 1.3.6-pl.9 (profLewis fork)

- Screen Echoes (display-only page): a pause - including the one Music Assistant sends - is now a plain stop that ends the Alexa session, so the Echo no longer sits listening for a reply afterwards. A display event never reopens the session. (skill fd30c11)

## 1.3.6-pl.8 (profLewis fork)
- Display-only page timer uses handleTick (keeps running after the session closes).

## 1.3.6-pl.7 (profLewis fork)
- The display-only page follows the song (cover + title re-loaded every 10 s; the session stays closed).

## 1.3.6-pl.6 (profLewis fork)
- New option apl_display_only (default on): graphics with Alexa's player playing - the session closes, no listening.

## 1.3.6-pl.5 (profLewis fork)
- Skill: Alexa's own player shows cover/title/artist (APL off = full screen, session closed - no listening); the skill's APL page is readable (dark scrim + blur, white text).

## 1.3.6-pl.4 (profLewis fork)
- The enable_apl option is applied at every start (upstream only reads options on the first start).

## 1.3.6-pl.3 (profLewis fork)
- Builds on a Home Assistant Pi: the skill image is the fixed base (Supervisor's own Alpine base was being used).

## 1.3.6-pl.2 (profLewis fork)
- Skill fork f34d078: one stream per speaker (each mapped Echo gets its own player's stream); with `enable_apl: false`
  a display left on a screen Echo no longer keeps the session open (no listening, no Alexa+ "say 'Alexa, exit'" line).

<!-- https://developers.home-assistant.io/docs/add-ons/presentation#keeping-a-changelog -->

## 1.3.9

- Update the bundled skill to the cosign-signed `v1.6.9` image.
- Fix external check-host.net badge merge bug: per-endpoint results now merge correctly so all three badges upgrade to green when external verification passes.

## 1.3.9-beta.9

- **Beta — for testing only.** Update the bundled skill to the cosign-signed `v1.6.9` image.
- Fix external check-host.net badge merge bug: per-endpoint results now merge correctly so all three badges upgrade to green when external verification passes

## 1.3.9-beta.8

- **Beta — for testing only.** Update the bundled skill to the cosign-signed `v1.6.8` image.
- Fix external check-host.net result parsing with endpoint labels so badges properly upgrade to green when external verification passes
- Remove 'Nodes' column from results table to prevent wrapping

## 1.3.9-beta.7

- **Beta — for testing only.** Update the bundled skill to the cosign-signed `v1.6.7` image.
- External check-host.net result overrides local reachability: when external verification passes, local results upgrade from "warning" to "reachable" (green badges), split-horizon note removed, summary banner shows "External path check passed" (green).

## 1.3.9-beta.6

- **Beta — for testing only.** Update the bundled skill to the cosign-signed `v1.6.6` image.
- Compact check-host.net results table with aggregation: shows total/passed/failed nodes, HTTP codes, and latency stats (avg/min/max ms) per endpoint
- Fix 'OK' dot issue in results table
- Show success banner when all endpoints pass all vantage points

## 1.3.9-beta.5

- **Beta — for testing only.** Update the bundled skill to the cosign-signed `v1.6.5` image.
- Fix check-host.net result parsing: handle `None` node_data when checks are still pending. This allows the "Test public path (external)" button to show results in the table once checks complete.

## 1.3.9-beta.4

- **Beta — for testing only.** Update the bundled skill to the cosign-signed `v1.6.4` image.
- Fix check-host.net integration: the /status/check-host/start endpoint now correctly passes MA_HOSTNAME to public_base(), resolving the TypeError that prevented external checks from starting.

## 1.3.9-beta.3

- **Beta — for testing only.** Update the bundled skill to the cosign-signed `v1.6.3` image.
- Improved check-host.net external public path verification: detailed error messages (timeout, connection error, HTTP error) are now shown in the UI instead of generic failures.

## 1.3.9-beta.2

- **Beta — for testing only.** Update the bundled skill to the cosign-signed `v1.6.2` image.
- Add check-host.net external public path verification: a new "Test public path (external)" button in the status UI triggers multi-vantage-point checks via check-host.net for the three core endpoints (Skill endpoint, Stream host, Public audio delivery). This verifies the true public path that an Echo would use, independent of local split-horizon DNS. Includes disclaimer that this uses an external service.

## 1.3.9-beta.1

- **Beta — for testing only.** Update the bundled skill to the cosign-signed `v1.6.1` image.
- Fix reachability checks against name-based reverse proxies: the pinned probe was sending `Host: <ip>` instead of the real hostname, causing all three core checks (Skill endpoint, Stream host, Public audio delivery) to report "DNS lookup or connection failed" on split-horizon setups (skill v1.6.1).

## 1.3.8

- The bundled skill moves to `ghcr.io/timlaing/music-assistant-skill:v1.6.0` (cosign-signed). The status page gains an **MA to Amazon channel** check (V13) that catches a dead Music Assistant → Amazon session: MA pushes the stream to the skill but its Alexa provider can no longer ask Amazon to start playback, so MA-initiated play and volume control silently fail while every other check stays green (#86). V13 correlates the pushed stream with the Echo's own playback reports — a fresh push that its player never reports as current becomes a warning pointing at re-authenticating Music Assistant's Alexa provider with Amazon, which is separate from this add-on's **Connect to Amazon** step. An idle Echo does not warn: a stale or absent push reports Unknown instead.
- The **Music Assistant API URL** and **access token** now have their own **Music Assistant control API** section on **Application settings** instead of sitting behind **Advanced connection settings**, with helper text naming what they unlock: the Alexa provider, Now playing and Alexa players status checks, the player picker on Devices, voice pause/resume/stop routed to Music Assistant, and stale one-shot stream recovery (skill PR #55, fixes #87).
- The V1–V12 Music Assistant channel checks probe the configured skill endpoint with its path prefix, so a prefixed deployment is no longer judged by the bare host where another service (for example the Music Assistant stream server) answers (skill PRs #51, #52, fixes skill issues #47 and #49).
- The Current audio check verifies real bytes and HTTP 405 counts as reachable for the Stream host check on Home Assistant roots that only accept GET (skill PR #50, fixes skill issue #48).
- Localized responses keep empty messages empty instead of substituting a fallback (skill PR #57).

## 1.3.7

- The bundled skill moves to `ghcr.io/timlaing/music-assistant-skill:v1.5.0` (cosign-signed). **Upgrading changes the invocation name in every locale to `music assistant`** — relearn the launch phrase after deploying, and redeploy from **Skill setup → Review settings → Deploy approved settings** if the deployed model still uses an older name (skill issue #71). The status page gains an **Invocation name** check (V12) that compares the deployed name against Music Assistant's start command for the configured locale.
- Spoken music selection and queue commands: ask for a song, artist, album, playlist, radio station or favourites; queue, shuffle, insert next and favourite the current track; and hear what is playing, next and previous (skill PR #38). Requires the Music Assistant control API URL and token; `en-US` only, other locales unchanged.
- Playback position: the add-on serves `GET /alexa/playback-state?player_id=…` behind the API credentials, reporting where each Echo really is so Music Assistant's Alexa player no longer drifts ahead of the device with every voice command (skill PR #38). Pairs with Music Assistant server change music-assistant/server#7143.
- Only requests from the deployed skill are accepted: the endpoint rejects correctly-signed requests from any other Alexa skill with the same endpoint, and fails closed until a deployment has been verified (skill PR #36).
- Package verification accepts Amazon skill exports that omit the optional `skill-package/` wrapper (skill PR #37).
- Give each Echo the stream pushed for its own player: with several Echos on separate queues, stale-stream recovery and the APL metadata refresh no longer pick up another player's stream (skill PR #41, fixes skill issue #33).
- Choose the Music Assistant player from a list on the Devices page: a dropdown of Music Assistant's own players labelled by display name, with validation of saved ids and free text as a fallback when Music Assistant is unreachable (skill PR #42).
- A diagnostics download and read-only Music Assistant channel verification (checks V1–V11) are available from the status page for the "skill answers but the Echo stays silent" reports (#40, #71).
- Redesigned setup UI: a four-step wizard with global navigation and eight views on a shared page shell (skill PRs #32, #34). The public skill endpoint is now collected on **Application settings**, before the step that displays the Amazon callback URL derived from it (skill PR #39).
- Consistent field styling across setup and simulator pages, HTTP response statuses in the Invocations tables, and Echo playback state updated from accepted device callbacks (skill PR #40).
- The Stream host HEAD check treats HTTP 405 as reachable for Home Assistant roots that only accept GET.
- Troubleshooting documentation: the Alexa locale must match the locale registered to the Echo devices, the Amazon callback URL follows the public skill endpoint, the reverse-proxy `trusted_proxies` ranges one setup needed, and an ordered "skill answers but the Echo stays silent" sequence including the invocation-name failure class (#72, #76).

## 1.3.7-beta.5

- **Beta — for testing only.** Update the bundled skill to the cosign-signed `v1.5.0-beta.3` image.
- Give each Echo the stream pushed for its own player: with several Echos on separate queues, stale-stream recovery and the APL metadata refresh no longer pick up another player's stream, so the wrong queue no longer starts playing and another Echo's track no longer appears on this one's card (skill PR #41, fixes skill issue #33).
- Choose the Music Assistant player from a list on the Devices page: the player field becomes a dropdown of Music Assistant's own players labelled by display name, a saved id Music Assistant no longer reports is kept, an id that is not a listed player is rejected with the previous mapping untouched, and the free-text field remains as a fallback when Music Assistant is unreachable (skill PR #42). The long Alexa device id now truncates instead of stretching the card grid.

## 1.3.7-beta.4

- **Beta — for testing only.** Update the bundled skill to the cosign-signed `v1.5.0-beta.2` image.
- Use consistent field styling across setup and simulator pages.
- Show recorded HTTP response statuses in the Invocations desktop table and mobile cards; malformed log entries remain readable.
- Update Echo playback from accepted device callbacks, showing the last reported state, device and time. Simulator requests are excluded, and callback timestamps prevent delayed events from replacing newer playback states.
- Treat HTTP 405 as reachable for the Stream host HEAD check, supporting Home Assistant roots that only accept GET. Skill and audio checks retain their stricter response checks.
- Clarify that Echo Show track metadata appears in Metadata diagnostics.

## 1.3.7-beta.3

- **Beta — for testing only.** The bundled skill moves to `ghcr.io/timlaing/music-assistant-skill:v1.5.0-beta.1` (cosign-signed).
- Spoken music selection and queue commands: ask for a song, artist, album, playlist, radio station or favourites; queue, shuffle, insert next and favourite the current track; and hear what is playing, next and previous (skill PR #38). Requires the Music Assistant control API URL and token for library and favourites changes. `en-US` only; other locales are unchanged.
- Playback position: the add-on now serves `GET /alexa/playback-state?player_id=…` behind the API credentials, reporting where each Echo really is so Music Assistant's Alexa player no longer drifts ahead of the device with every voice command (skill PR #38). Pairs with Music Assistant server change music-assistant/server#7143.
- Package verification accepts Amazon exports that omit the optional `skill-package/` wrapper, fixing the deployment failure reported against 1.3.7-beta.2 where every member path differed and the whole package was rejected as a mismatch (skill PR #37).
- Only requests from the deployed skill are accepted: the endpoint rejects correctly-signed requests from any other Alexa skill with the same endpoint, and fails closed until a deployment has been verified (skill PR #36).
- A diagnostics download and read-only Music Assistant channel verification (checks V1–V11) are available from the status page, for the "skill answers but the Echo stays silent" reports in #40 and #71 (skill PR #35).
- Setup now collects the public skill endpoint on **Application settings**, before the step that displays the Amazon callback URL derived from it. The callback URL is derived from the skill endpoint rather than the audio URL, and step 3 no longer collects a value that could silently override an endpoint already registered with Amazon (skill PR #39, addressing points 3 and 4 of @Rob-SBT's report in #40).
- Document the #40 setup findings: the Alexa locale must match the locale registered to the Echo devices, the Amazon callback URL follows the public skill endpoint, the reverse-proxy `trusted_proxies` ranges one setup needed, and a troubleshooting sequence for "the skill answers but the Echo stays silent" (#72).

## 1.3.7-beta.2

- **Beta — for testing only.** The bundled skill moves to `ghcr.io/timlaing/music-assistant-skill:v1.4.2-beta.2` (cosign-signed), which lands the redesigned web UI: eight views on a shared page shell, static assets served from `/assets` with per-use revalidation, and an error fallback on the Devices page that keeps device mapping available (skill PR #34).

## 1.3.7-beta.1

- **Beta — for testing only.** The bundled skill moves to `ghcr.io/timlaing/music-assistant-skill:v1.4.2-beta.1` (cosign-signed), which restructures the skill's setup UI into a four-step wizard with global navigation and adds a test-audio player on the reachability page (skill PR #32).
- Maintenance: CI cosign-verifies the pinned skill image signature before checking out the skill repository to run its test suite (#68).

## 1.3.6

- The bundled skill moves to `ghcr.io/timlaing/music-assistant-skill:v1.4.1` (cosign-signed), which carries the runtime modernization (Ubuntu 26.04, Python 3.14, Node 26) and the skill fix for stale one-shot flow-stream URLs: after an idle period the skill now validates the stored stream URL, asks Music Assistant to resume the player and plays the pushed replacement URL instead of serving a 404 to Alexa (skill PR #31, addressing the playback failures reported in #40).
- Raise the gunicorn keepalive so it outlives client connection pools, fixing the first-attempt `Server disconnected` playback failures on the add-on-facing half of #55 (the `players/cmd/play_pause` path is MA-side via alexapy and is not addressed here).
- Document an NGINX Home Assistant SSL proxy example configuration (#60).
- Maintenance: CI and Sonar analysis run on Python 3.14 (#63); gunicorn.conf.py is excluded from Sonar coverage and remaining coverage exclusions passed as inline scanner args (#64, #65).

Validated as 1.3.6-beta.1 before this release.

## 1.3.5

- Update the bundled skill to 1.3.5: package verification now **validates** icon URIs instead of excluding them — a locale's `smallIconUri`/`largeIconUri` equal to the configured artwork or to Amazon's own materialized `file://assets/images/…` form passes, while a foreign URL, a cross-locale path or a missing key still fails — and stores Amazon's one-time re-encoded icon artwork (`assets/images/*IconUri.png`) into the approved package so the byte comparison never fails on it again. Verified with a full deployment against the live Amazon service; every non-artwork file keeps byte-for-byte verification. Fixes the remaining "Amazon's exported package differs from the approved deployment" failures of #40.
- The add-on image now builds `FROM ghcr.io/timlaing/music-assistant-skill:v1.3.5` (the cosign-signed release image published by the skill repository) instead of compiling the skill from the `skill-api` git submodule. The image already ships the patched Python environment, ASK CLI and assets; the add-on layer contributes gunicorn, the ingress service entrypoint and the healthcheck. Identical application code — faster, reproducible builds and a one-line bump for future skill releases.

## 1.3.4

- Update the bundled skill to 1.3.4: package verification no longer fails on `smallIconUri`/`largeIconUri`, which Amazon rewrites during import and export — this was the remaining cause of "Amazon's exported package differs from the approved deployment" reported for es-ES and en-GB; every other field stays fully verified. No add-on changes.

## 1.3.3

- Update the bundled skill to 1.3.3: a failed package verification now names the differing files and JSON paths, the fr-CA and nl-NL interaction models are converted to the current schema with invocation names and a PlayAudio intent, nl-NL gains a manifest entry, and every bundled locale round-trips a full deployment in the test suite; no add-on changes.

## 1.3.2

- Replace the add-on store README with an overview, installation steps, a quick start and support links.
- Update the bundled skill to 1.3.2, which fixes the standalone image build workflow and refreshes documentation wording; no application changes.

## 1.3.1

- Fix personal-skill deployment for the es-ES, es-MX, fr-FR and it-IT locales, which failed final package verification with "Amazon's exported package differs from the approved deployment" (#40).

- Update the bundled skill to 1.3.1, which includes the custom slot type list in every bundled interaction model so Amazon's export matches the approved package.

## 1.3.0

- Promote the personal-skill deployment wizard to stable following maintainer confirmation that it is tested and working.

- Put LWA registration instructions, the developer-console link and generated callback URL in Connect to Amazon.
- Show connection success with a green tick and place setup feedback in its relevant section.
- Offer Trusted, Trusted sub-domain and File certificate choices; validate and deploy public PEM certificates for development testing.
- Use the maintained add-on artwork for the skill icons.
- Wait for running builds and verify the imported package when Amazon omits legacy build-status fields, preserving failure/mismatch checks and accepted-import resume.

## 1.3.0-beta.3

- Show Amazon connection progress and errors beside Connect, validate settings before sign-in and provide a direct sign-in link when pop-ups are blocked.
- Share responsive page styling between Status and Setup; place Setup navigation above the status title and group checks under section headings.
- Put required API username/password in Credentials and additional connection fields in Advanced settings.
- Default the skill endpoint to the public audio URL origin plus `/ma-alexa-skill/`, with an optional override.

## 1.3.0-beta.2

- Fix Home Assistant Open Web UI opening the status page with a doubled slash; accept cached status entry links only through the trusted ingress gateway.

## 1.3.0-beta.1 (candidate)

- Move application settings into the ingress setup page, migrate available legacy values and persist web edits.
- Generate the callback URL and initial API password; mask secrets and provide deliberate provider-password reveal.
- Remove the unused AWS region configuration.

- Provide status/setup through Home Assistant ingress without a separate app login, preserving API authentication.
- Keep the Amazon callback under `/ma-alexa-skill/`, completing sign-in in the original ingress browser.
- Verify configured URL reachability on status with background HTTPS/health/audio checks.

- Replace interactive web ASK CLI setup with self-hosted Amazon browser sign-in and direct management APIs.
- Add explicit existing-skill selection, configuration review and supported package import/build verification.
- Preserve skill identity, other locales and unrelated resources; prevent automatic deletion and duplicate creation retries.
- Persist private credentials/progress and resume accepted imports after restart.
- Add Login with Amazon and certificate options, callback proxy guidance and automated protocol/security tests.
- Live Amazon deployment and Echo acceptance are still required before promotion.

## 1.2.0

- Promote the tested beta after maintainer confirmation of real-device playback through NPM.
- Verify signed base image indexes before publication and in PR builds.
- Document shared-host `/alexa/` and `/ma/` API proxy routing.

## 1.2.0-beta.1

- Update to latest upstream via the maintained Alexa skill fork.
- Fix single-worker playback deadlocks with one threaded worker and direct store access.
- Correct HTTPS stream/artwork rewriting for NPM hostnames and path prefixes.
- Stop stale flow streams and announcements from being enqueued repeatedly.
- Add optional MA voice-control credentials, persistent device mapping and APL settings.
- Add idle-aware status, unauthenticated health checks and fault diagnostics.
- Pin base images and Python dependencies; validate both architecture images in CI.

## 1.1.0

- Update the Alexa skill submodule and support its refactored application layout.
- Add the upstream skill setup UI, locale selection, and optional stream URL validation bypass.
- Run a single application worker so pushed stream state remains consistent.

## 1.0.3

Fix gunicorn worker issues

## 1.0.2

Bugfix environment variable

## 1.0.1

Refactor docker / repo dependencies

## 1.0.0

- Initial release
