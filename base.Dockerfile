FROM --platform=linux/amd64 archlinux

RUN pacman -Sy
RUN pacman -S --noconfirm --needed git base-devel

#AUR
ARG username="arch"
ARG paru_path="/home/${username}/paru"
RUN echo "${username} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN useradd -m -G wheel,users,kvm,render,video,audio ${username} && passwd -d ${username}
RUN sudo -u ${username} -- git clone https://aur.archlinux.org/paru-bin.git ${paru_path}
RUN cd ${paru_path} && sudo -u arch -- makepkg -si --noconfirm
RUN rm -rf ${paru_path}

#audio
RUN pacman -S --noconfirm pipewire-jack pipewire-pulse


#font
RUN pacman -S --noconfirm fontconfig noto-fonts gnu-free-fonts ttf-liberation


#more_lib
RUN pacman -S --noconfirm libxkbfile libbsd

#gui_app
RUN sudo -u arch -- paru -S --noconfirm firefox zed android-studio jdk-openjdk

#graphic
RUN pacman -S --noconfirm xf86-video-amdgpu vulkan-radeon mesa libva
# RUN pacman -S --noconfirm xf86-video-intel vulkan-intel vpl-gpu-rt intel-media-driver
# RUN pacman -S --noconfirm xf86-video-nouveau vulkan-nouveau
