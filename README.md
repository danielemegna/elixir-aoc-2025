# Elixir Advent Of Code 2025

Solutions for [2025 Advent Of Code challenges](https://adventofcode.com/2025) in Elixir lang

Challenge solutions are in tests as assertions:

```elixir
test "solve first part with file" do
  actual = Day01.Main.find_password_for(read_file_stream())
  assert actual == 1135
end
```

> following AOC authors guidelines, input.txt files are not included in the repo
----

### Docker-only dev setup

Use temporary container with current directory volume:

```
$ docker run --rm -it -v $PWD:/app -w /app elixir:1.19.4-otp-28 bash
# mix test
# mix test ./test/day01
```

### VSCode Dev Container setup

VSCode can use devcontainers to be configured with the proper extensions without language specific utilities locally installed.

In order to proceed, install the [related extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) (`ms-vscode-remote.remote-containers`) and reopen vscode in Dev Container mode.

> the first run can take some minutes to install and setup properly container and vscode extensions

If you want to open an additional bash session in the vscode container:

```
$ docker exec -it -w /workspaces/$(basename $PWD) <container-name> bash
# mix test
```

### asdf dev setup

Install needed plugins:

```
$ asdf plugin add erlang
$ asdf plugin add elixir
```

and erlang + elixir relases than:

```
$ asdf install erlang 28.3
$ asdf install elixir 1.19.4-otp-28
$ mix test
```
