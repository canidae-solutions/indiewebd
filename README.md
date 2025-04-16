# indiewebd
![trans rights](https://pride-badges.pony.workers.dev/static/v1?label=trans%20rights&stripeWidth=6&stripeColors=5BCEFA,F5A9B8,FFFFFF,F5A9B8,5BCEFA)

the daemon that your static-site indieweb blog never knew it wanted

## dev flow
all dependencies for local dev are in the nix shell. make sure you're in there while developing.

first off, run the initial repo setup with `just dev-setup`. then, you can start the dev server and all other dependencies with `just`.

## roadmap
- webmentions
  - [ ] receiving
  - [ ] sending
- [ ] automatic syndication
- [ ] websub
