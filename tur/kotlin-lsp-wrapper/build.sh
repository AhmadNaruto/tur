TERMUX_PKG_HOMEPAGE=https://github.com/Alacho2/kotlin-lsp-proxy.git
TERMUX_PKG_DESCRIPTION="Just a wrapper for the kotlin-lsp"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_MAINTAINER="@AhmadNaruto"
TERMUX_PKG_VERSION="0.1.0"
TERMUX_PKG_GIT_BRANCH="main"
TERMUX_PKG_SRCURL=git+https://github.com/Alacho2/kotlin-lsp-proxy.git
TERMUX_PKG_BUILD_IN_SRC=true
# TERMUX_PKG_BUILD_DEPENDS="zlib"

termux_step_pre_configure() {
	termux_setup_rust
}

termux_step_make() {
	cargo build --jobs $TERMUX_PKG_MAKE_PROCESSES --target $CARGO_TARGET_NAME --release
}

termux_step_make_install() {
	install -Dm700 -t $TERMUX_PREFIX/bin target/${CARGO_TARGET_NAME}/release/kotlin-lsp-wrapper
}
