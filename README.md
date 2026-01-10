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
