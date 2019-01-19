FROM ubuntu
RUN apt-get update
RUN apt-get install -y python3.7 python3.7-dev \
                       python3.7-venv

RUN apt-get install -y libncurses5-dev libgnome2-dev libgnomeui-dev
RUN apt-get install -y git
RUN apt-get install -y libgtk-3-0 libgtk-3-common
RUN apt-get install -y libxt6
RUN apt-get install -y xorg-dev

RUN apt-get install -y ruby-dev lua5.1 liblua5.1-dev libperl-dev git

RUN git clone https://github.com/vim/vim.git /opt/vim_sources
RUN cd /opt/vim_sources && \
    ./configure --disable-netbeans \
                --enable-cscope \
                --enable-fail-if-missing \
                --enable-fontset \
                --enable-gui=auto \
                --enable-largefile \
                --enable-luainterp=yes \
                --enable-multibyte \
                --enable-perlinterp=yes \
                --enable-python3interp=yes \
                --enable-rubyinterp=yes \                
                --with-compiledby='https://github.com/jalexandretoledo/DockerUbuntuPython37' \
                --with-features=huge \
                --with-python3-command=python3.7 \
                --with-python3-config-dir=/usr/lib/python3.7/config-3.7m-x86_64-linux-gnu \
                --with-x && \
    make  && \
    make install

RUN apt-get clean
