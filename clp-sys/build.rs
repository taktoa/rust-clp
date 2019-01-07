extern crate bindgen;
extern crate pkg_config;

use std::env;

fn main() {
    let out_file = env::current_dir().unwrap().join("src").join("bindings.rs");

    let clp = pkg_config::Config::new()
        .atleast_version("1.16.11")
        .probe("clp")
        .unwrap();

    // Skip building if bindings already exist.
    // If you want to rebuild, delete the bindings file.
    if out_file.exists() { return; }

    let clang_arguments: Vec<String>
        = clp.include_paths
        .iter()
        .map(|inc| format!("-I{}", inc.to_str().unwrap()))
        .collect();

    let bindings = bindgen::Builder::default()
        .header_contents("wrapper.h", "#include <coin/Clp_C_Interface.h>\n")
        .clang_args(clang_arguments)
        .generate()
        .expect("Unable to generate bindings");

    // Write bindings to src.
    bindings
        .write_to_file(out_file)
        .expect("Couldn't write bindings!");
}
