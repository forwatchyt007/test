FROM --platform=linux/amd64 archlinux:multilib-devel

RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm --needed git base-devel

# #graphic
# RUN pacman -S --noconfirm lib32-mesa-demos lib32-mesa-utils mesa mesa-demos mesa-utils libva lib32-libva
# RUN pacman -S --noconfirm xf86-video-amdgpu lib32-vulkan-radeon vulkan-radeon
# RUN pacman -S --noconfirm xf86-video-intel lib32-vulkan-intel vulkan-intel vpl-gpu-rt intel-media-driver
# RUN pacman -S --noconfirm xf86-video-nouveau lib32-nvidia-utils nvidia-utils lib32-vulkan-nouveau vulkan-nouveau
# #audio
# RUN pacman -S --noconfirm lib32-pipewire lib32-pipewire-jack pipewire-alsa pipewire-pulse wireplumber

# #font
# RUN pacman -S --noconfirm fontconfig noto-fonts gnu-free-fonts ttf-liberation

#AUR
# ARG username="arch"
# ARG paru_path="/home/${username}/paru"
# RUN echo "${username} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
# RUN useradd -m -G wheel,users,kvm,render,video,audio ${username} && passwd -d ${username}
# RUN sudo -u ${username} -- git clone https://aur.archlinux.org/paru-bin.git ${paru_path}
# RUN cd ${paru_path} && sudo -u arch -- makepkg -si --noconfirm
# RUN rm -rf ${paru_path}

#more_lib
RUN pacman -S --noconfirm libxkbfile libbsd

# #base_gui_app
# RUN pacman -S --noconfirm firefox thunar
# RUN sudo -u arch -- paru -S --noconfirm brave-bin ungoogled-chromium-bin
