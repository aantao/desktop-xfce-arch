FROM archlinux:latest

RUN pacman -Syuu --noconfirm
RUN pacman -S xorg xorg-server --noconfirm
RUN pacman -S xfce4 --noconfirm
RUN pacman -S xfce4-goodies --noconfirm
RUN pacman -S lightdm --noconfirm
RUN pacman -S lightdm-gtk-greeter --noconfirm
RUN systemctl enable lightdm 
# Language/locale settings
#   replace en_US by your desired locale setting, 
#   for example de_DE for german.
ENV LANG en_US.UTF-8
#RUN gsettings set org.mate.screensaver idle-activation-enabled false
# RUN gsettings set org.mate.session gnome-compat-startup "['smproxy']"
# RUN if [[ -f "${HOME}/.config/monitors.xml" ]]; then mv "${HOME}/.config/monitors.xml" "${HOME}/.config/monitors.xml.bak"; fi
# ENV AUTOSTART="${HOME}/.config/autostart"
# RUN rm -fr "${AUTOSTART}"
# RUN mkdir -p "${AUTOSTART}"
#RUN for service in "gnome-keyring-gpg" "gnome-keyring-pkcs11" "gnome-keyring-secrets" "gnome-keyring-ssh" "mate-volume-control-applet" "polkit-mate-authentication-agent-1" "pulseaudio" "rhsm-icon" "spice-vdagent" "xfce4-power-manager"; do cat "/etc/xdg/autostart/${service}.desktop" <(echo "X-MATE-Autostart-enabled=false") > "${AUTOSTART}/${service}.desktop"; done
#RUN dconf write /org/mate/terminal/profiles/default/login-shell true
# Mate desktop
COPY ./xfce.sh .
#CMD ["mate-session"]
RUN chmod +x ./xfce.sh
#RUN ./xfce.sh
#CMD ["xfce4-session"]