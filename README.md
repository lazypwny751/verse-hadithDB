# verses and hadiths database, stored in sqlite verse-hadithDB.
here are some verses from the Quran and authentic hadiths, verse and hadith files are backed up as json in the source and combined as sqlite file

# Installation
```bash
git clone "https://github.com/lazypwny751/verse-hadithDB.git" && cd "verse-hadithDB"
make build
sudo make install
```

# Uninstallation
```bash
cd "verse-hadithDB"
sudo make uninstall
# Or, if you know the SRCDIR you can remove directly the source dir, default is:
sudo rm -rf /usr/share/verse-hadith
```

# Requirements
- ## coreutils
- ## findutils
- ## sqlite3
- ## bash
- ## jq

# Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

# License
[GPLv3](https://choosealicense.com/licenses/gpl-3.0)