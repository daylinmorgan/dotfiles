NOTE: This repo has now been integrated in my system nix flake, [oizys](https://git.dayl.in/daylin/oizys).

---

# dotfiles

## Install

From Source:
```bash
sh -c "$(curl -fsLS https://chezmoi.io/get)" -- init --apply git.dayl.in/daylin -S ~/.dotfiles --ssh
```

From Mirror:

```bash
sh -c "$(curl -fsLS https://chezmoi.io/get)" -- init --apply daylinmorgan -S ~/.dotfiles --ssh
```

On Nix:

```bash
nix run "nixpkgs#chezmoi" -- init --apply daylinmorgan -S ~/.dotfiles
```

## Relevant XKCD

<p align="center">
<img src="https://imgs.xkcd.com/comics/borrow_your_laptop.png">
</p>
