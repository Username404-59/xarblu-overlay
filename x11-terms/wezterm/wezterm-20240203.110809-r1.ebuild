# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line@0.21.0
	adler32@1.2.0
	adler@1.0.2
	ahash@0.7.7
	ahash@0.8.7
	aho-corasick@1.1.2
	allocator-api2@0.2.16
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anes@0.1.6
	anstream@0.6.11
	anstyle-parse@0.2.3
	anstyle-query@1.0.2
	anstyle-wincon@3.0.2
	anstyle@1.0.5
	anyhow@1.0.79
	arrayref@0.3.7
	arrayvec@0.7.4
	as-raw-xcb-connection@1.0.1
	ash@0.37.3+1.3.251
	assert_fs@1.1.1
	async-broadcast@0.5.1
	async-channel@1.9.0
	async-channel@2.1.1
	async-executor@1.8.0
	async-fs@1.6.0
	async-io@1.13.0
	async-io@2.3.1
	async-lock@2.8.0
	async-lock@3.3.0
	async-net@1.8.0
	async-process@1.8.1
	async-recursion@1.0.5
	async-signal@0.2.5
	async-task@4.7.0
	async-trait@0.1.77
	atomic-waker@1.1.2
	atomic@0.5.3
	atty@0.2.14
	autocfg@1.1.0
	az@1.2.1
	backtrace@0.3.69
	base64@0.13.1
	base64@0.21.7
	benchmarking@0.4.12
	bit-set@0.5.3
	bit-vec@0.6.3
	bit_field@0.10.2
	bitflags@1.3.2
	bitflags@2.4.2
	block-buffer@0.10.4
	block@0.1.6
	blocking@1.5.1
	bstr@0.1.4
	bstr@1.9.0
	bumpalo@3.14.0
	bytemuck@1.14.1
	bytemuck_derive@1.5.0
	byteorder@1.5.0
	bytes@1.5.0
	cairo-rs@0.18.5
	camino@1.1.6
	cassowary@0.3.0
	cast@0.3.0
	cc@1.0.83
	cfg-if@1.0.0
	cgl@0.3.2
	chrono@0.4.33
	ciborium-io@0.2.2
	ciborium-ll@0.2.2
	ciborium@0.2.2
	clap@2.34.0
	clap@3.2.25
	clap@4.4.18
	clap_builder@4.4.18
	clap_complete@4.4.9
	clap_complete_fig@4.4.2
	clap_derive@4.4.7
	clap_lex@0.2.4
	clap_lex@0.6.0
	clipboard-win@2.2.0
	cocoa-foundation@0.1.2
	cocoa@0.20.2
	cocoa@0.25.0
	codespan-reporting@0.11.1
	color_quant@1.1.0
	colorchoice@1.0.0
	colored@1.9.4
	colored@2.1.0
	colorgrad@0.6.2
	com-rs@0.2.1
	concurrent-queue@2.4.0
	core-foundation-sys@0.7.0
	core-foundation-sys@0.8.6
	core-foundation@0.7.0
	core-foundation@0.9.4
	core-graphics-types@0.1.3
	core-graphics@0.19.2
	core-graphics@0.23.1
	core-text@20.1.0
	core2@0.4.0
	cpufeatures@0.2.12
	crc32fast@1.3.2
	criterion-plot@0.4.5
	criterion-plot@0.5.0
	criterion@0.3.6
	criterion@0.4.0
	crossbeam-channel@0.5.11
	crossbeam-deque@0.8.5
	crossbeam-epoch@0.9.18
	crossbeam-queue@0.3.11
	crossbeam-utils@0.8.19
	crossbeam@0.8.4
	crunchy@0.2.2
	crypto-common@0.1.6
	csscolorparser@0.6.2
	csv-core@0.1.11
	csv@1.3.0
	d3d12@0.7.0
	darling@0.20.3
	darling_core@0.20.3
	darling_macro@0.20.3
	dary_heap@0.3.6
	data-encoding@2.5.0
	deltae@0.3.2
	deranged@0.3.11
	derivative@2.2.0
	dhat@0.3.2
	diff@0.1.13
	difflib@0.4.0
	digest@0.10.7
	dirs-next@2.0.0
	dirs-sys-next@0.1.2
	dirs-sys@0.3.7
	dirs@4.0.0
	dlib@0.5.2
	doc-comment@0.3.3
	downcast-rs@1.2.0
	dwrote@0.11.0
	either@1.9.0
	embed-resource@1.8.0
	emojis@0.6.1
	encoding_rs@0.8.33
	enum-display-derive@0.1.1
	enumflags2@0.7.8
	enumflags2_derive@0.7.8
	env_filter@0.1.0
	env_logger@0.10.2
	env_logger@0.11.1
	equivalent@1.0.1
	errno@0.3.8
	euclid@0.22.9
	event-listener-strategy@0.4.0
	event-listener@2.5.3
	event-listener@3.1.0
	event-listener@4.0.3
	exr@1.6.4
	fallible-iterator@0.2.0
	fallible-streaming-iterator@0.1.9
	fancy-regex@0.11.0
	fastrand@1.9.0
	fastrand@2.0.1
	fdeflate@0.3.4
	filenamegen@0.2.4
	filetime@0.2.23
	finl_unicode@1.2.0
	fixed@1.24.0
	fixedbitset@0.4.2
	flate2@1.0.28
	float-cmp@0.9.0
	flume@0.10.14
	flume@0.11.0
	fnv@1.0.7
	foreign-types-macros@0.2.3
	foreign-types-shared@0.1.1
	foreign-types-shared@0.3.1
	foreign-types@0.3.2
	foreign-types@0.5.0
	form_urlencoded@1.2.1
	fsevent-sys@4.1.0
	futures-channel@0.3.30
	futures-core@0.3.30
	futures-executor@0.3.30
	futures-io@0.3.30
	futures-lite@1.13.0
	futures-lite@2.2.0
	futures-macro@0.3.30
	futures-sink@0.3.30
	futures-task@0.3.30
	futures-timer@3.0.2
	futures-util@0.3.30
	futures@0.3.30
	fuzzy-matcher@0.3.7
	generic-array@0.14.7
	gethostname@0.4.3
	getopts@0.2.21
	getrandom@0.2.12
	gif@0.12.0
	gimli@0.28.1
	git2@0.16.1
	gl_generator@0.14.0
	glium@0.31.0
	glob@0.3.1
	globset@0.4.14
	globwalk@0.9.1
	glow@0.13.1
	glutin_wgl_sys@0.5.0
	governor@0.5.1
	gpu-alloc-types@0.3.0
	gpu-alloc@0.6.0
	gpu-allocator@0.23.0
	gpu-descriptor-types@0.1.2
	gpu-descriptor@0.2.4
	guillotiere@0.6.2
	h2@0.3.24
	half@1.8.2
	half@2.3.1
	hashbrown@0.11.2
	hashbrown@0.12.3
	hashbrown@0.13.2
	hashbrown@0.14.3
	hashlink@0.7.0
	hassle-rs@0.10.0
	hdrhistogram@7.5.4
	heck@0.4.1
	hermit-abi@0.1.19
	hermit-abi@0.3.4
	hex@0.4.3
	hexf-parse@0.2.1
	home@0.5.9
	hostname@0.3.1
	http-body@0.4.6
	http@0.2.11
	http_req@0.10.2
	httparse@1.8.0
	httpdate@1.0.3
	humansize@2.1.3
	humantime@2.1.0
	hyper-tls@0.5.0
	hyper@0.14.28
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.59
	ident_case@1.0.1
	idna@0.5.0
	ignore@0.4.22
	image@0.24.8
	indexmap@1.9.3
	indexmap@2.2.1
	inotify-sys@0.1.5
	inotify@0.9.6
	instant@0.1.12
	intrusive-collections@0.9.6
	io-lifetimes@1.0.11
	ioctl-rs@0.1.6
	ipnet@2.9.0
	is-terminal@0.4.10
	itertools@0.10.5
	itoa@1.0.10
	jobserver@0.1.27
	jpeg-decoder@0.3.1
	js-sys@0.3.67
	k9@0.11.6
	k9@0.12.0
	khronos-egl@6.0.0
	khronos_api@3.1.0
	kqueue-sys@1.0.4
	kqueue@1.0.8
	lab@0.11.0
	lazy_static@1.4.0
	lazycell@1.3.0
	leb128@0.2.5
	lebe@0.5.2
	libc@0.2.152
	libflate@2.0.0
	libflate_lz77@2.0.0
	libgit2-sys@0.14.2+1.5.1
	libloading@0.6.7
	libloading@0.7.4
	libloading@0.8.1
	libm@0.2.8
	libredox@0.0.1
	libsqlite3-sys@0.24.2
	libssh-rs-sys@0.2.2
	libssh-rs@0.2.2
	libssh2-sys@0.3.0
	libz-sys@1.1.15
	line-wrap@0.1.1
	line_drawing@0.8.1
	linked-hash-map@0.5.6
	linux-raw-sys@0.3.8
	linux-raw-sys@0.4.13
	lock_api@0.4.11
	log@0.4.20
	lru@0.7.8
	lua-src@546.0.2
	luajit-src@210.5.5+f2336c4
	mac_address@1.1.5
	mach@0.3.2
	malloc_buf@0.0.6
	maplit@1.0.2
	match_cfg@0.1.0
	memchr@2.7.1
	memmap2@0.2.3
	memmap2@0.5.10
	memmap2@0.8.0
	memmem@0.1.1
	memoffset@0.6.5
	memoffset@0.7.1
	memoffset@0.9.0
	metal@0.27.0
	metrics-macros@0.4.1
	metrics@0.17.1
	mime@0.3.17
	minimal-lexical@0.2.1
	miniz_oxide@0.4.4
	miniz_oxide@0.7.1
	mintex@0.1.3
	mio@0.8.10
	mlua-sys@0.5.1
	mlua@0.9.5
	naga@0.14.2
	names@0.12.0
	nanorand@0.7.0
	native-tls@0.2.11
	nix@0.23.2
	nix@0.24.3
	nix@0.25.1
	nix@0.26.4
	no-std-compat@0.4.1
	nom@7.1.3
	nonzero_ext@0.3.0
	normalize-line-endings@0.3.0
	notify@5.2.0
	ntapi@0.4.1
	num-bigint@0.3.3
	num-complex@0.3.1
	num-derive@0.3.3
	num-integer@0.1.45
	num-iter@0.1.43
	num-rational@0.3.2
	num-traits@0.2.17
	num@0.3.1
	num_cpus@1.16.0
	objc@0.2.7
	objc_exception@0.1.2
	object@0.32.2
	once_cell@1.19.0
	oorandom@11.1.3
	openssl-macros@0.1.1
	openssl-probe@0.1.5
	openssl-src@300.2.1+3.2.0
	openssl-sys@0.9.99
	openssl@0.10.63
	ordered-float@4.2.0
	ordered-stream@0.2.0
	os_str_bytes@6.6.1
	parking@2.2.0
	parking_lot@0.11.2
	parking_lot@0.12.1
	parking_lot_core@0.8.6
	parking_lot_core@0.9.9
	paste@1.0.14
	pem@3.0.3
	percent-encoding@2.3.1
	pest@2.7.6
	pest_derive@2.7.6
	pest_generator@2.7.6
	pest_meta@2.7.6
	phf@0.11.2
	phf_codegen@0.11.2
	phf_generator@0.11.2
	phf_macros@0.11.2
	phf_shared@0.11.2
	pin-project-internal@1.1.4
	pin-project-lite@0.2.13
	pin-project@1.1.4
	pin-utils@0.1.0
	piper@0.2.1
	pkg-config@0.3.29
	plist@1.6.0
	plotters-backend@0.3.5
	plotters-svg@0.3.5
	plotters@0.3.5
	png@0.17.11
	polling@2.8.0
	polling@3.3.2
	powerfmt@0.2.0
	ppv-lite86@0.2.17
	predicates-core@1.0.6
	predicates-tree@1.0.9
	predicates@3.1.0
	presser@0.3.1
	proc-macro-crate@1.3.1
	proc-macro2@1.0.78
	profiling@1.0.13
	pulldown-cmark@0.9.6
	pure-rust-locales@0.7.0
	qoi@0.4.1
	quick-xml@0.30.0
	quick-xml@0.31.0
	quote@1.0.35
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	range-alloc@0.1.3
	raw-window-handle@0.5.2
	rayon-core@1.12.1
	rayon@1.8.1
	rcgen@0.12.1
	redox_syscall@0.2.16
	redox_syscall@0.4.1
	redox_users@0.4.4
	regex-automata@0.1.10
	regex-automata@0.4.5
	regex-syntax@0.8.2
	regex@1.10.3
	relative-path@1.9.2
	renderdoc-sys@1.0.0
	reqwest@0.11.23
	resize@0.5.5
	rgb@0.8.37
	ring@0.17.7
	rle-decode-fast@1.0.3
	rstest@0.18.2
	rstest_macros@0.18.2
	rusqlite@0.27.0
	rustc-demangle@0.1.23
	rustc-hash@1.1.0
	rustc_version@0.4.0
	rustix@0.37.27
	rustix@0.38.30
	ryu@1.0.16
	safemem@0.3.3
	same-file@1.0.6
	schannel@0.1.23
	scoped-tls@1.0.1
	scopeguard@1.2.0
	security-framework-sys@2.9.1
	security-framework@2.9.2
	semver-parser@0.10.2
	semver@0.11.0
	semver@1.0.21
	serde@1.0.196
	serde_cbor@0.11.2
	serde_derive@1.0.196
	serde_json@1.0.113
	serde_repr@0.1.18
	serde_spanned@0.6.5
	serde_urlencoded@0.7.1
	serde_with@2.3.3
	serde_with_macros@2.3.3
	serde_yaml@0.9.31
	serial-core@0.4.0
	serial-unix@0.4.0
	serial-windows@0.4.0
	serial@0.4.0
	sha1@0.10.6
	sha2@0.10.8
	shared_library@0.1.9
	shell-words@1.1.0
	shlex@1.3.0
	signal-hook-registry@1.4.1
	signal-hook@0.3.17
	simd-adler32@0.3.7
	siphasher@0.3.11
	slab@0.4.9
	slotmap@1.0.7
	smallvec@1.13.1
	smawk@0.3.2
	smithay-client-toolkit@0.16.1
	smol-potat-macro@0.6.0
	smol-potat@1.1.2
	smol@1.3.0
	socket2@0.4.10
	socket2@0.5.5
	spa@0.3.1
	spin@0.9.8
	spirv@0.2.0+1.5.4
	sqlite-cache@0.1.3
	ssh2@0.9.4
	starship-battery@0.7.9
	static_assertions@1.1.0
	strict-num@0.1.1
	strsim@0.10.0
	svg_fmt@0.4.1
	syn@1.0.109
	syn@2.0.48
	system-configuration-sys@0.5.0
	system-configuration@0.5.1
	takeable-option@0.5.0
	tar@0.4.40
	tempfile@3.9.0
	term_size@0.3.2
	termcolor@1.4.1
	terminal_size@0.2.6
	terminal_size@0.3.0
	terminfo@0.8.0
	termios@0.2.2
	termios@0.3.3
	termtree@0.4.1
	textwrap@0.11.0
	textwrap@0.16.0
	thiserror-impl@1.0.56
	thiserror@1.0.56
	thousands@0.2.0
	thread_local@1.1.7
	tiff@0.9.1
	time-core@0.1.2
	time-macros@0.2.16
	time@0.3.31
	tiny-skia-path@0.11.3
	tiny-skia@0.11.3
	tinytemplate@1.2.1
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	tokio-macros@2.2.0
	tokio-native-tls@0.3.1
	tokio-util@0.7.10
	tokio@1.35.1
	toml@0.5.11
	toml@0.8.8
	toml_datetime@0.6.5
	toml_edit@0.19.15
	toml_edit@0.21.0
	tower-service@0.3.2
	tracing-attributes@0.1.27
	tracing-core@0.1.32
	tracing@0.1.40
	try-lock@0.2.5
	typenum@1.17.0
	ucd-trie@0.1.6
	uds_windows@1.1.0
	unicase@2.7.0
	unicode-bidi@0.3.15
	unicode-ident@1.0.12
	unicode-linebreak@0.1.5
	unicode-normalization@0.1.22
	unicode-segmentation@1.10.1
	unicode-width@0.1.11
	unicode-xid@0.2.4
	unsafe-libyaml@0.2.10
	untrusted@0.9.0
	uom@0.30.0
	url@2.5.0
	utf8parse@0.2.1
	uuid@1.7.0
	varbincode@0.1.0
	vcpkg@0.2.15
	version_check@0.9.4
	vswhom-sys@0.1.2
	vswhom@0.1.0
	waker-fn@1.1.1
	walkdir@2.4.0
	want@0.3.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.90
	wasm-bindgen-futures@0.4.40
	wasm-bindgen-macro-support@0.2.90
	wasm-bindgen-macro@0.2.90
	wasm-bindgen-shared@0.2.90
	wasm-bindgen@0.2.90
	wayland-client@0.29.5
	wayland-commons@0.29.5
	wayland-cursor@0.29.5
	wayland-egl@0.29.5
	wayland-protocols@0.29.5
	wayland-scanner@0.29.5
	wayland-sys@0.29.5
	web-sys@0.3.64
	weezl@0.1.8
	wgpu-core@0.18.1
	wgpu-hal@0.18.1
	wgpu-types@0.18.0
	wgpu@0.18.0
	which@5.0.0
	whoami@1.4.1
	widestring@1.0.2
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.6
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-core@0.51.1
	windows-core@0.52.0
	windows-sys@0.45.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-targets@0.42.2
	windows-targets@0.48.5
	windows-targets@0.52.0
	windows@0.33.0
	windows@0.51.1
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.0
	windows_aarch64_msvc@0.33.0
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.0
	windows_i686_gnu@0.33.0
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.0
	windows_i686_msvc@0.33.0
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.0
	windows_x86_64_gnu@0.33.0
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.0
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.0
	windows_x86_64_msvc@0.33.0
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.0
	winnow@0.5.35
	winreg@0.10.1
	winreg@0.50.0
	wio@0.2.2
	x11@2.21.0
	xattr@1.3.1
	xcb@1.3.0
	xcursor@0.3.5
	xdg-home@1.0.0
	xkbcommon@0.7.0
	xkeysym@0.2.0
	xml-rs@0.8.19
	yaml-rust@0.4.5
	yasna@0.5.2
	zbus@3.14.1
	zbus_macros@3.14.1
	zbus_names@2.6.0
	zerocopy-derive@0.7.32
	zerocopy@0.7.32
	zstd-safe@5.0.2+zstd.1.5.2
	zstd-sys@2.0.9+zstd.1.5.5
	zstd@0.11.2+zstd.1.5.2
	zune-inflate@0.2.54
	zvariant@3.15.0
	zvariant_derive@3.15.0
	zvariant_utils@1.0.1
"

declare -A GIT_CRATES=(
	[xcb-imdkit]='https://github.com/wez/xcb-imdkit-rs;215ce4b08ac9c4822e541efd4f4ffb1062806051;xcb-imdkit-rs-%commit%'
)

inherit shell-completion desktop cargo xdg-utils

DESCRIPTION="A GPU-accelerated cross-platform terminal emulator and multiplexer"
HOMEPAGE="https://wezfurlong.org/wezterm/"

if [[ "${PV}" == *_pre* ]]; then
	MY_PV=""
	MY_P="${PN}-${MY_PV}"
	SRC_URI="
		https://github.com/wez/${PN}/archive/${MY_PV}.tar.gz -> ${MY_P}.tar.gz
		${CARGO_CRATE_URIS}
		"
else
	MY_PV="$(ver_rs 1 -)-5046fc22"
	MY_P="${PN}-${MY_PV}"
	SRC_URI="
		https://github.com/wez/${PN}/releases/download/${MY_PV}/${MY_P}-src.tar.gz
		${CARGO_CRATE_URIS}
		"
fi

SUBMODULES=(
	"freetype2 github main@freetype https://github.com/wez/freetype2 e4586d960f339cf75e2e0b34aee30a0ed8353c0d"
	"libpng github main@freetype https://github.com/pnggroup/libpng 8439534daa1d3a5705ba92e653eda9251246dd61"
	"zlib github main@freetype https://github.com/madler/zlib cacf7f1d4e3d44d871b605da3b647f07d718623f"
	"harfbuzz github main@harfbuzz https://github.com/harfbuzz/harfbuzz 894a1f72ee93a1fd8dc1d9218cb3fd8f048be29a"
	"xcb-imdkit github git-crate-xcb-imdkit@xcb-imdkit https://github.com/fcitx/xcb-imdkit 30e2f16f9a8b0e338e25ce5e3643809a07ad41f0"
)

LICENSE="MIT"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 BSD-2 BSD CC0-1.0 ISC LGPL-2.1 MIT MPL-2.0
	Unicode-DFS-2016 WTFPL-2 ZLIB
"
SLOT="0"
KEYWORDS="~amd64"
IUSE="wayland"

RESTRICT="test" # tests require network

DEPEND="
	dev-libs/openssl
	wayland? ( dev-libs/wayland )
	media-fonts/jetbrains-mono
	media-fonts/nerd-fonts[nerdfontssymbolsonly]
	media-fonts/noto
	media-fonts/noto-emoji
	media-fonts/roboto
	media-libs/fontconfig
	media-libs/mesa
	sys-apps/dbus
	x11-libs/libX11
	x11-libs/libxkbcommon[X,wayland?]
	x11-libs/xcb-util
	x11-libs/xcb-util-image
	x11-libs/xcb-util-keysyms
	x11-libs/xcb-util-wm
	x11-themes/hicolor-icon-theme
	x11-themes/xcursor-themes
	|| (
		>=sys-libs/ncurses-6.4_p20240330
		~x11-terms/wezterm-terminfo-${PV}
	)
	~x11-terms/wezterm-shell-integration-${PV}
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-build/cmake
	dev-vcs/git
	virtual/pkgconfig
	virtual/rust
"

QA_FLAGS_IGNORED="
	usr/bin/.*
"

S="${WORKDIR}/${MY_P}"

submodule_uris() {
	for line in "${SUBMODULES[@]}"; do
		read -r name hoster dep url commit <<< "${line}" || die

		if [ "${hoster}" == "github" ]; then
			SRC_URI+=" ${url}/archive/${commit}.tar.gz -> ${url##*/}-${commit}.tar.gz"
		elif [ "${hoster}" == "gitlab" ]; then
			SRC_URI+=" ${url}/-/archive/${commit}/${url##*/}-${commit}.tar.gz"
		else
			die
		fi
	done
}

submodule_uris

src_prepare() {
	# copy submodules to where they should go
	for line in "${SUBMODULES[@]}"; do
		read -r name hoster dep url commit <<< "${line}" || die
		case ${dep} in
			main@*)
				dest="${S}/deps/${dep##*@}/${name}"
				;;
			git-crate-*@*)
				crate="${dep%%@*}"
				crate="${crate#git-crate-}"
				my_crate="$(cut -d ";" -f 3 <<< "${GIT_CRATES[${crate}]}" || die)"
				crate_commit="$(cut -d ";" -f 2 <<< "${GIT_CRATES[${crate}]}" || die)"
				if [[ -z "${my_crate}" ]]; then
					crate_dir="${crate}-${crate_commit}"
				else
					crate_dir="${my_crate//%commit%/${crate_commit}}"
				fi
				dest="${WORKDIR}/${crate_dir}/deps/${dep##*@}"
				;;
		esac
		mkdir -p "${dest}" || die
		cp -r "${WORKDIR}/${url##*/}-${commit}/"* "${dest}" || die
	done

	echo "${MY_PV}-gentoo" > .tag || die

	default
	eapply_user
}

src_configure() {
	local myfeatures=(
		distro-defaults
		$(usev wayland)
	)
	cargo_src_configure --no-default-features
}

src_install() {
	dobin "$(cargo_target_dir)/wezterm"
	dobin "$(cargo_target_dir)/wezterm-gui"
	dobin "$(cargo_target_dir)/wezterm-mux-server"
	dobin "$(cargo_target_dir)/strip-ansi-escapes"

	insinto /usr/share/icons/hicolor/128x128/apps
	newins assets/icon/terminal.png org.wezfurlong.wezterm.png

	newmenu assets/wezterm.desktop org.wezfurlong.wezterm.desktop

	insinto /usr/share/metainfo
	newins assets/wezterm.appdata.xml org.wezfurlong.wezterm.appdata.xml

	insinto /usr/share/nautilus-python/extensions
	newins assets/wezterm-nautilus.py "${PN}.py"

	newbashcomp assets/shell-completion/bash "${PN}"
	newzshcomp assets/shell-completion/zsh "_${PN}"
	newfishcomp assets/shell-completion/fish "${PN}.fish"
}

pkg_postinst() {
	xdg_icon_cache_update
	einfo "It may be necessary to configure wezterm to use a cursor theme, see:"
	einfo "https://wezfurlong.org/wezterm/faq.html?highlight=xcursor_theme#i-use-x11-or-wayland-and-my-mouse-cursor-theme-doesnt-seem-to-work"
	einfo "It may be necessary to set the environment variable XCURSOR_PATH"
	einfo "to the directory containing the cursor icons, for example"
	einfo 'export XCURSOR_PATH="/usr/share/cursors/xorg-x11/"'
	einfo "before starting the wayland or X11 window compositor to avoid the error:"
	einfo "ERROR  window::os::wayland::frame > Unable to set cursor to left_ptr: cursor not found"
	einfo "For example, in the file ~/.wezterm.lua:"
	einfo "return {"
	einfo '  xcursor_theme = "whiteglass"'
	einfo "}"
}

pkg_postrm() {
	xdg_icon_cache_update
}
