# Dot

Pretty much self explanatory, it's all my scripts & configs for my personal & work machine to get job done.

# Common problems after clean install

## Windows not showing on GRUB

Install os-prober

`sudo pacman -S os-prober`

Enable os-probe on grub config

`sudo nvim /etc/default/grub`

Generate grub config output file

`sudo grub-mkconfig -o /boot/grub/grub.cfg`

## Enable pacman parallel downloads

Edit this file

`sudo nvim /etc/pacman.conf`

uncomment or add this entry

`ParallelDownloads = 5`

## Installing fonts:

Move the fonts to this folder

`/usr/local/share/fonts`

note: do not use this other folder, it's used by the pacman
`/usr/share/fonts/`

## Polybar not launching

enable script execution

`sudo chmod +x $HOME/.config/polybar/launch.sh`