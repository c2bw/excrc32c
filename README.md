# excrc32c [![Hex Version](https://img.shields.io/hexpm/v/excrc32c.svg)](https://hex.pm/packages/excrc32c) [![Hex Docs](https://img.shields.io/badge/docs-hexpm-blue.svg)](https://hexdocs.pm/excrc32c/)

A pure Elixir implementation of CRC32C.

Code is copied from [here](https://gist.github.com/tomciopp/2d174f3960b6386e86167268b1a9875d) and distributed as a package on Hex.pm

All credit goes to the original author(s):
- [tomciopp](https://github.com/tomciopp)
- [oliveigah](https://github.com/oliveigah)

## Installation

The package can be installedby adding `excrc32c` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:excrc32c, "~> 0.1.0"}
  ]
end
```

### Usage

```elixir
iex> Excrc32c.crc32c("123456789")
3808858755
iex> Excrc32c.crc32c("DYB|O")
0
```

### Performance

Tested using [`benchee`](https://github.com/bencheeorg/benchee) against [`crc32cer`](https://github.com/zmstone/crc32cer) (NIF):
```
Name             ips        average  deviation         median         99th %
nif           3.11 K        0.32 ms    ±33.60%        0.31 ms        0.51 ms
elixir       0.130 K        7.69 ms     ±1.92%        7.68 ms        8.24 ms

Comparison:
nif           3.11 K
elixir       0.130 K - 23.90x slower +7.37 ms
```

 

