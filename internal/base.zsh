#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function tmux::internal::tmux::install {
    message_info "Installing ${TMUX_PACKAGE_NAME}"
    core::install tmux
    message_success "Installed ${TMUX_PACKAGE_NAME}"
    tmux::post_install
}

function tmux::internal::tmuxinator::install {
    message_info "Installing tmuxinator for ${TMUX_PACKAGE_NAME}"
    if ! core::exists gem; then
        message_warning "${TMUX_MESSAGE_RVM}"
        return
    fi
    gem install tmuxinator
    message_success "Installed tmuxinator for ${TMUX_PACKAGE_NAME}"
}

function tmux::internal::tpm::install {
    message_info "Installing tpm for ${TMUX_PACKAGE_NAME}"
    git clone https://github.com/tmux-plugins/tpm "${TMUX_TPM_PATH}"
    message_success "Installed tpm for ${TMUX_PACKAGE_NAME}"
}
