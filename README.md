# Run 🏃 [![Build Status](https://travis-ci.com/getGuaka/Run.svg?branch=master)](https://travis-ci.com/getGuaka/Run)

Run provides a quick, concise way to run an external command and read its standard output and standard error.

## Usage

To execute a simple command you would do:

```swift
let result = run("ls -all")
print(result.stdout)
```
`result` type is `RunResults`, it contains:

- `exitStatus`: The command exit status
- `stdout`: The standard output for the command executed
- `stderr`: The standard error for the command executed

While `run("command")` can split the arguments by spaces. Some times argument splitting is not trivial. If you have multiple argument to pass to the command to execute, you should use `run(command: String, args: String...)`. The above translates to:

```swift
let result = run("ls", args: "-all")
```

To customize the run function, you can pass in a customization block:

```swift
let result = run("ls -all") { settings in
    settings.dryRun = true
    settings.echo = [.Stdout, .Stderr, .Command]
    settings.interactive = false
}
```

`settings` is an instance of RunSettings, which contains the following variables:

- `settings.dryRun`: defaults to false. If false, the command is actually run. If true, the command is logged to the stdout paramter of result
- `settings.echo`: Customize the message printed to stdout, `echo` can contain any of the following:
    - `EchoSettings.Stdout`: The stdout returned from running the command will be printed to the terminal
    - `EchoSettings.Stderr`: The stderr returned from running the command will be printed to the terminal
    - `EchoSettings.Command`: The command executed will be printed to the terminal
- `settings.interactive`: defaults to false. If set to true the command will be executed using `system` kernel function and only the exit status will be captured. If set to false, the command will be executed using `NSTask` and both stdout and stderr will be captured.
Set `interactive` to true if you expect the launched command to ask input from the user through the stdin.

`runWithoutCapture("command")` is a quick way to run a command in interactive mode. The return value is the exit code of that command.

## Installation

### Swift Package Manager

```swift
.package(url: "https://github.com/getGuaka/Run.git", from: "0.1.0"),
```

## License

MIT
