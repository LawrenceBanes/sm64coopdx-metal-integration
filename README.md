# SM64CoopDX Metal Integration Overlay

This private repository intentionally stores **only** the Mission 01/02/03/04 integration patch series and build automation. It does not mirror the CoopDX iOS source tree, include Nintendo ROM/assets, or include the previous SM64 Metal renderer.

`materialize.sh` fetches the public CoopDX iOS source at the exact upstream baseline commit and applies the patches locally. The patch series was checked to reproduce the integration worktree tree hash recorded in `UPSTREAM.txt`.

The upstream iOS fork and CoopDX repositories currently expose no recognized license metadata and no root `LICENSE`/`COPYING` file. This overlay avoids publishing a full source mirror; it does not make any legal claim about upstream source distribution rights. The workflow only checks out the publicly accessible baseline on a temporary GitHub runner, builds it, and retains a short-lived private IPA artifact.

The build requires no ROM or derived Nintendo asset bundle. The resulting app expects the user to import a legally obtained ROM at runtime using the existing iOS flow.
