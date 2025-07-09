FROM ubuntu:latest
RUN apt update && apt install -y sudo vim curl git fzf tmux
RUN useradd -m tester && echo "tester:pass" | chpasswd && usermod -aG sudo tester && chown -R tester:tester /home/tester
USER tester
RUN echo 'export PATH=$HOME/.local/bin:$PATH' > /home/tester/.bash_aliases
RUN mkdir -p /home/tester/.local/bin/
COPY --chown=tester:tester ./pctl /home/tester/.local/bin/pctl
COPY --chown=tester:tester ~/.local/share/pctl/projectlist /home/tester/.local/share/pctl/projectlist
WORKDIR /home/tester
CMD ["/bin/bash"]
