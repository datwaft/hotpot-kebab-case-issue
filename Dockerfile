FROM debian:buster-slim

# Install dependencies
RUN apt-get update && apt-get install -y curl git

# Install Neovim
WORKDIR /tmp
RUN curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
RUN tar xzf nvim-linux64.tar.gz -C /opt
ENV PATH /opt/nvim-linux64/bin:$PATH

# Deploy the Neovim configuration
COPY config /root/.config/nvim

# Install hotpot.nvim
WORKDIR /root/.local/share/nvim/site/pack/packer/start
RUN git clone https://github.com/rktjmp/hotpot.nvim

# Finish
WORKDIR /root
