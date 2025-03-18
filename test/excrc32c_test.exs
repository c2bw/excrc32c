defmodule Excrc32cTest do
  use ExUnit.Case
  doctest Excrc32c

  test "calculates CRC32C for empty string" do
    assert Excrc32c.crc32c("") == 0x00000000
  end

  test "calculates CRC32C for simple strings" do
    assert Excrc32c.crc32c("123456789") == 0xE3069283
    assert Excrc32c.crc32c("Hello World") == 0x691DAA2F
  end

  test "calculates CRC32C for longer text" do
    assert Excrc32c.crc32c("The quick brown fox jumps over the lazy dog") == 0x22620404
  end

  test "calculates different CRC32C for different strings" do
    value1 = Excrc32c.crc32c("test1")
    value2 = Excrc32c.crc32c("test2")
    assert value1 != value2
  end
end
