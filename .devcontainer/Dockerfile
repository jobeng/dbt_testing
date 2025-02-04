FROM python:3.12-slim-bookworm

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

# # install zsh
# Default powerline10k theme, no plugins installed
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.2.0/zsh-in-docker.sh)" -- \
    -p colored-man-pages \
    -p https://github.com/zsh-users/zsh-autosuggestions
COPY powerlevel_config.zsh root/.p10k.zsh
RUN echo "[[ ! -f /root/.p10k.zsh ]] || source /root/.p10k.zsh" >> ~/.zshrc

ENV SHELL /usr/bin/zsh
ENV DBT_PROFILES_DIR="/workspaces"

# install packages
COPY requirements.txt requirements.txt
RUN pip install --upgrade pip \
    && pip install --ignore-installed -r requirements.txt \
    && rm -rf /root/.cache \
    && rm -rf work/*

RUN echo "alias zedit='vim ~/.zshrc'" >> ~/.zshrc
RUN echo "alias work='cd /workspaces/dbt_testing'" >> ~/.zshrc
RUN echo "alias newsh='exec $SHELL && source ~/.zshrc'" >> ~/.zshrc
RUN echo "alias pcr='git stage . && pre-commit run'" >> ~/.zshrc

# functions
RUN echo 'function dbtddf() { \
    dbt "$@" -x \
    }' >> ~/.zshrc

# entry
ENTRYPOINT [ "/bin/zsh" ]