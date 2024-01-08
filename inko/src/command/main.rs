use crate::command::build;
use crate::command::check;
use crate::command::pkg;
use crate::command::print;
use crate::command::run;
use crate::command::test;
use crate::error::Error;
use crate::options::print_usage;
use getopts::{Options, ParsingStyle};
use std::env;

const USAGE: &str = "Usage: inko [OPTIONS] [COMMAND | FILE]

Commands:

    build  Compile Inko source code
    check  Check a project or single file for correctness
    pkg    Manage Inko packages
    print  Print compiler details to STDOUT
    run    Compile and run source code directly
    test   Run Inko unit tests

Examples:

    inko run hello.inko    # Same
    inko build hello.inko  # Compile the file into an executable
    inko check hello.inko  # Check hello.inko for errors
    inko run --help        # Print the help message for the run command";

pub(crate) fn run() -> Result<i32, Error> {
    let args: Vec<String> = env::args().collect();
    let mut options = Options::new();

    options.parsing_style(ParsingStyle::StopAtFirstFree);
    options.optflag("h", "help", "Show this help message");
    options.optflag("v", "version", "Print the version number");

    let matches = options.parse(&args[1..])?;

    if matches.opt_present("h") {
        print_usage(&options, USAGE);
        return Ok(0);
    }

    if matches.opt_present("v") {
        println!("inko {}", env!("CARGO_PKG_VERSION"));
        return Ok(0);
    }

    match matches.free.first().map(|s| s.as_str()) {
        Some("run") => run::run(&matches.free[1..]),
        Some("build") => build::run(&matches.free[1..]),
        Some("check") => check::run(&matches.free[1..]),
        Some("test") => test::run(&matches.free[1..]),
        Some("print") => print::run(&matches.free[1..]),
        Some("pkg") => pkg::run(&matches.free[1..]),
        Some(cmd) => {
            Err(Error::generic(format!("The command '{}' is invalid", cmd)))
        }
        None => {
            print_usage(&options, USAGE);
            Ok(0)
        }
    }
}
