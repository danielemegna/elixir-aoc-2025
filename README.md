# Elixir Advent Of Code 2025

Solutions for [2025 Advent Of Code challenges](https://adventofcode.com/2025) in Elixir lang

Challenge solutions are in tests as assertions:

```elixir
// TODO
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
