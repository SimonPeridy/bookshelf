FROM python:3.10

## Add non-root user
ARG USERNAME=nonrootuser
RUN groupadd --gid 1000 $USERNAME && useradd --uid 1000 --gid 1000 -m $USERNAME
# Make sure to reflect new user in PATH
ENV PATH="/home/${USERNAME}/.local/bin:${PATH}"
USER $USERNAME

# ## Persist bash history NOT USED
# RUN SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=/home/$USERNAME/.bash_history"
# # RUN mkdir /home/$USERNAME
# RUN touch /home/$USERNAME/.bash_history
# RUN chmod +777 /home/$USERNAME/.bash_history
# RUN echo "$SNIPPET" >> "/home/$USERNAME/.bashrc"


## Custom utilities
# oh-my-posh
RUN curl -s https://ohmyposh.dev/install.sh | bash -s
# fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
RUN ~/.fzf/install

## Change directory. TO PARAMETRIZE
ARG WORKSPACE_PATH=/workspaces/bookshelf
WORKDIR ${WORKSPACE_PATH}

## Pip dependencies
# Upgrade pip
RUN pip install --upgrade pip
# Install poetry
RUN curl -sSL https://install.python-poetry.org | python3 -
# poetry params
RUN poetry config virtualenvs.in-project true

## With poetry
COPY pyproject.toml pyproject.toml
COPY poetry.lock poetry.lock
RUN poetry install