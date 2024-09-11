FROM python:3.11-slim-bookworm

# update and clean
RUN apt-get update \
    && apt-get install -y \
    build-essential \
    git \
    git-lfs \
    sudo \
    vim \
    gcc \
    g++ \
    make \
    cmake \
    curl \
    wget \
    jq \
    bat \
    fonts-firacode \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# env
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

# install zsh
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)" -- \
    -p colored-man-pages \
    -p https://github.com/zsh-users/zsh-autosuggestions
COPY powerlevel_config.zsh root/.p10k.zsh
RUN echo "[[ ! -f /root/.p10k.zsh ]] || source /root/.p10k.zsh" >> ~/.zshrc

ENV SHELL /usr/bin/zsh

# install packages
COPY requirements.txt requirements.txt
RUN pip install --upgrade pip \
    && pip install --ignore-installed -r requirements.txt \
    && rm -rf /root/.cache \
    && rm -rf work/*

# install fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git /root/.fzf
RUN /root/.fzf/install --key-bindings --completion --update-rc

# zsh aliases
RUN echo "alias zedit='vim ~/.zshrc'" >> ~/.zshrc
RUN echo "alias work='cd /workspaces/data-dbt'" >> ~/.zshrc
RUN echo "alias newsh='exec $SHELL && source ~/.zshrc'" >> ~/.zshrc
RUN echo "alias pcr='git stage . && pre-commit run'" >> ~/.zshrc

# functions
RUN echo 'function dbtddf() { \
    dbt "$@" -x \
    }' >> ~/.zshrc

# entry
ENTRYPOINT [ "/bin/zsh" ]