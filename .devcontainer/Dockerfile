

FROM ghcr.io/xu-cheng/texlive-alpine:latest

# 1. Install dependencies + chktex (Alpine native version)
# We combine these to reduce layers
RUN apk update && apk add -q --no-cache \
    nano \
    shadow \
    libstdc++ \
    ca-certificates \
    openssh-client \
    gnupg \
    tzdata \
    mandoc \
    zsh \
    git-doc \ 
    git


# 2. Setup Timezone
ENV TZ=Australia/Melbourne

# 3. Setup Shell and User (Fixing the shadow/zsh logic)
RUN usermod --shell /bin/zsh root


WORKDIR /root
COPY .zshrc-specific .welcome.sh .p10k.zsh /root/
RUN git clone --single-branch --depth 1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

RUN apk add -q --no-cache zsh-theme-powerlevel10k gitstatus && \
    ln -s /usr/share/zsh/plugins/powerlevel10k ~/.oh-my-zsh/custom/themes/powerlevel10k

# 6. Final Verification 
# Using full paths ensures the build doesn't fail due to PATH resolution issues
WORKDIR /workspace

RUN tlmgr version && \
    latexmk -version && \
    chktex --version

ENTRYPOINT [ "/bin/zsh" ]
