# For developers

Developer who waht to generated the documentaion also locally do have to install some tools:
<a name="rust-compiler"></a>
## Rust-Compiler

Base is a Rust-Compiler because all following tools are programmed in Rust and some of them have to be compiled.

Please note the Rust version ahs to be current to get **mdbook** compiled (See below)

> mdBook currently requires at least Rust version 1.82.

The current *Raspberry Pi OS* *Bookworm* has *rustc* Version 1.63 in it's repos which are too old.

For the Rust installation see *Rust*:

  - https://www.rust-lang.org/tools/install
  - https://www.rust-lang.org/learn/get-started

Following curl is the easiest way to install the Rust compiler.

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

**Don't use** `sudo` because it's a user specific installation.


## Generator - mdbook

The most important tool is the generator which generates the html pages from the markdown textfiles.

*mdbook* ist used in this prject.

This tool is used for the Rust documentation and is also written in Rust. See also <https://rust-lang.github.io/mdBook>

### Installation

Siehe <https://rust-lang.github.io/mdBook/guide/installation.html>

Outline:

#### Binaries

For Apple, Windows and x86_64-Linux there exist complete binaries for download. But because additional tools have to be compiled in any case it 
makes sense to compile *mdbook* also:

<a name="compile-from-sources"></a>

#### Compilation from source

All required tools can be built from source.
<https://rust-lang.github.io/mdBook/guide/installation.html#build-from-source-using-rust>

and requires a Rust compile environment.

When the `rustc` compiler was installed ([s.o.](#rust-compiler)), *mdbook* will be compiled and installed.

    cargo install mdbook

Next two preprocessores are required. They enable nice rendering of notes and generate a local contents. 

    cargo install mdbook-admonish
    cargo install mdbook-toc

The whole process including *Rust* installation takes on a PI5 just a couple of minutes.
