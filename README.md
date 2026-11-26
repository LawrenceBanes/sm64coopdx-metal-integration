# SM64CoopDX Metal Integration Overlay

This private repository intentionally stores the Mission 01–09 integration patch series and build automation. It does not mirror the CoopDX iOS source tree, include Nintendo ROM/assets, or copy the previous SM64 Metal renderer.

`materialize.sh` fetches the public CoopDX iOS source at the exact upstream baseline commit and applies the patches locally. The patch series was checked to reproduce the integration worktree tree hash recorded in `UPSTREAM.txt`.

The upstream iOS fork and CoopDX repositories currently expose no recognized license metadata and no root `LICENSE`/`COPYING` file. This private patch overlay avoids publishing a full source mirror; it does not make any legal claim about upstream source distribution rights. Its materializer checks out the pinned publicly accessible baseline and applies the integration patch series. Mission 09 adds the original iOS control art/layout, multitouch behavior fixes, Metal cache/state hardening, regression fixtures, and validation records.

The build requires no ROM or derived Nintendo asset bundle. The resulting app expects the user to import a legally obtained ROM at runtime using the existing iOS flow. Host compilation/tests and Apple component-only validation are not a full Apple app build; no full-app IPA or physical-device Metal result is included in this checkpoint.
