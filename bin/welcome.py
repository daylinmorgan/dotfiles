#!/usr/bin/env python3

from rich.console import Console
from rich.text import Text
import argparse

console = Console(force_terminal=True)

colors = [
    "black",
    "red",
    "green",
    "yellow",
    "blue",
    "magenta",
    "cyan",
    "white",
    "bright_black",
    "bright_red",
    "bright_green",
    "bright_yellow",
    "bright_blue",
    "bright_magenta",
    "bright_cyan",
    "bright_white",
]


def wave():
    """
    ╮╭╭╮╮╭╭╮╮╭╭╮╮╭╭╮
    ╰╯╯╰╰╯╯╰╰╯╯╰╰╯╯╰
    """

    lines = ["╮╭╭╮╮╭╭╮╮╭╭╮╮╭╭╮", "╰╯╯╰╰╯╯╰╰╯╯╰╰╯╯╰"]
    for line in lines:
        styled_line = [
            Text(line[i * 2 : i * 2 + 2], style=color)
            for i, color in enumerate(colors[:8])
        ]
        console.print(Text("").join(styled_line))


def dots():
    """
    ● ● ● ● ● ● ● ●
    """

    console.print(Text(" ").join([Text("●", style=color) for color in colors[:8]]))


def wave_w_dots():
    """
    Alternating colors from red to white with
    black separators

    ╮╮●╭╭╭─╮╮╮●╭╭╭─╮╮╮●╭╭╭─╮╮╮●╭╭
    ╰╰─╯╯╯●╰╰╰─╯╯╯●╰╰╰─╯╯╯●╰╰╰─╯╯
    """

    lines = ["╮╮●╭╭╭─╮╮╮●╭╭╭─╮╮╮●╭╭╭─╮╮╮●╭╭", "╰╰─╯╯╯●╰╰╰─╯╯╯●╰╰╰─╯╯╯●╰╰╰─╯╯"]

    for line in lines:
        styled_line = []
        for i, x in enumerate(line):
            if i % 4:
                styled_line.append(Text(x, style=colors[1 + int(i / 4)]))
            else:
                styled_line.append(Text(x, style="black"))

        console.print(Text("").join(styled_line))


def main():
    prompts = {"wave": wave, "dots": dots, "wave_w_dots": wave_w_dots}
    parser = argparse.ArgumentParser(
        description="generate ansi color coded login prompts'"
    )
    parser.add_argument("--welcome", type=str, help="a welcome screen to print")

    args = parser.parse_args()

    if not args.welcome:
        for name, prompt in prompts.items():
            console.print(f"name: {name}")
            prompt()
    elif args.welcome not in prompts.keys():
        console.print(f"{args.welcome} is not a registered prompt")
    else:
        prompts[args.welcome]()


if __name__ == "__main__":
    main()
