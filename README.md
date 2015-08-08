#updatenotifier

Update notification plasmoid for Plasma 5

![screenshot](http://i.imgur.com/19oEtZg.png)

##Backend

The backend of this plasmoid relies on commands defined in the plasmoid configuration. A command needs to be a single application call with its parameters. If you need to use multiple applications, use bash -c "app1 | app2 | app3"

|Configuration   |Description   |Example/Default   |
|---|---|---|
| Open software center command  | Command which will be executed when the software center should be opened   | octopi   |
| Update system command   | Command which will be executed when a system upgrade should be started    | octopi -sysupgrade   |
| Refresh list command   | Command which will be executed when the plasmoid checks for new updates. The command needs to print the data to stdout. The data must be structured in csv format. It uses the first 3 columns of every row for the list (eg. "firefox;39.0.1;A standalone webbrowser from mozilla.org"). Columns seperated by ";", rows seperated by "\n"   | bash -c "paste -d';' <(pacman -Qu \| sed 's/\ /;/' \| sed -r 's/->.*//') <(pacman -Qui \| grep Description \| sed 's/^Description[ \t:]*//')"   |
| Notify command   | Command which will be executed when the plasmoid refreshed the list and found available updates. May contain the 2 makros {{ICON}} and {{TEXT}}. Makro {{ICON}} will be replaced with either the full path of an image file or the name of a system icon. Makro {{TEXT}} will be replaced with the status text (eg. "23 Updates available!")   | bash -c "notify-send -i {{ICON}} 'Software' '{{TEXT}}'"   |
