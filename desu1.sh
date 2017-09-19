#!/bin/bash
pause=1

while [ $pause == 1 ]
do
	echo "What would you like your username to be?"
	echo ""
	echo "Do NOT pick the name of an already existing user. This will overwrite their files!"
	echo ""
	echo "Pick a new username:"
	read USER
	read -p  "You have chosen $USER for your name. Are you sure? [y/N]" yn
	case $yn in
		[Yy]* ) pause=0 ;;
		[yes]* ) pause=0 ;;
		[Yes]* ) pause=0 ;;
	esac

done

useradd -m -g wheel -s /bin/bash $USER
passwd $USER
echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers


xbps-install xorg-minimal xorg-fonts xf86-input-synaptics xf86-video-intel base-devel xinit xorg-server rxvt-unicode feh ffmpeg arandr mpv wget curl rofi python-pip python-netifaces python-psutil NetworkManager network-manager-applet vim w3m ranger mediainfo poppler highlight tmux calcurse htop newsbeuter moc firefox qutebrowser ImageMagick transmission-gtk transmission atool libcaca compton transset blender gimp texlive MultiMarkdown mupdf evince audacity rsync youtube-dl openssh syncthing noto-fonts-cjk noto-fonts-emoji cups screenFetch neofetch scrot unzip git lmms p7zip font-tamsyn speedometer neomutt font-awesome mypaint pandoc xdotool unclutter-xfixes i3-gaps i3lock i3blocks i3status

tlmgr info collections | grep -o 'collection-[A-Za-z]*' | xargs tlmgr install

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

git clone https://github.com/ying17zi/vim-live-latex-preview.git
mv vim-live-latex-preview ~/.vim/bundle/ 

curl https://github.com/sterdayye/voidrice/blob/master/desu1.sh > /home/$USER/desu1.sh

echo "root system configuration complete."
echo ""
echo "Now log out of root (ctrl-d), log in as $USER and run the following command:"
echo ""
echo "bash desu1.sh"
