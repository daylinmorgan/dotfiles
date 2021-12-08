import yaml
from pathlib import Path

FRONTMATTER = """
VS Code Extensions install script 

Author: Daylin Morgan

DO NOT EDIT MANUALLY!
Regenerate with generate_install_scripts.py
"""

FILE_DIR = Path(__file__).parent

def shell_script_writer(extensions_dict, filename):
    with Path(filename).open("w") as f:
        f.write("#!/bin/bash\n")
        f.write(FRONTMATTER.replace("\n", "\n# ")[:-2])
        f.write('\n\necho "Installing VS Code Extensions"\n')

        for section, extensions in extensions_dict.items():
            f.write(f"\n# {section} extensions")
            f.write("\n# " + "-" * len(section) + "-" * 11)

            for extension in extensions:
                f.write(f"\ncode --install-extension {extension} --force")

            f.write("\n")

        f.write('\necho "Extension installation compeleted!"')


def batch_script_writer(extensions_dict, filename):
    with Path(filename).open("w") as f:
        f.write("echo off\n")
        f.write(FRONTMATTER.replace("\n", "\n:: ")[:-3])
        f.write('\n\necho "Installing VS Code Extensions"\necho.\n')

        for section, extensions in extensions_dict.items():
            f.write(f"\n:: {section} extensions")
            f.write("\n:: " + "-" * len(section) + "-" * 11)

            for extension in extensions:
                f.write(f"\ncall code --install-extension {extension} --force")

            f.write("\n")

        f.write('\necho "Extension installation compeleted!"')


def main():
    print("Generating shell and batch scripts with extensions.yml")

    extensions_yml = FILE_DIR / "extensions.yml"

    with extensions_yml.open("r") as f:
        extensions_dict = yaml.load(f, Loader=yaml.FullLoader)

    shell_script_writer(extensions_dict, "install-extensions.sh")

    batch_script_writer(extensions_dict, "install-extensions.bat")


if __name__ == "__main__":
    main()
