defmodule Excrc32c do
  @moduledoc """
  A pure Elixir implementation of the CRC32C algorithm.

  ### Usage

  ```elixir
  iex> Excrc32c.crc32c("123456789")
  3808858755
  iex> Excrc32c.crc32c("DYB|O")
  0
  ```

  """
  import Bitwise

  @doc """
  Calculates the CRC32C of the binary.
  """
  @spec crc32c(binary()) :: non_neg_integer()
  def crc32c(data), do: crc32c(data, 0xFFFFFFFF)


  defp crc32c(<<>>, acc), do: bxor(acc, 0xFFFFFFFF)

  defp crc32c(<<current::size(8), data::binary>>, acc) do
    index = acc |> bxor(current) |> band(0xFF)
    crc32c(data, bxor(bsr(acc, 8), get_polynomial(index)))
  end

  defp get_polynomial(0), do: 0x00000000
  defp get_polynomial(1), do: 0xF26B8303
  defp get_polynomial(2), do: 0xE13B70F7
  defp get_polynomial(3), do: 0x1350F3F4
  defp get_polynomial(4), do: 0xC79A971F
  defp get_polynomial(5), do: 0x35F1141C
  defp get_polynomial(6), do: 0x26A1E7E8
  defp get_polynomial(7), do: 0xD4CA64EB
  defp get_polynomial(8), do: 0x8AD958CF
  defp get_polynomial(9), do: 0x78B2DBCC
  defp get_polynomial(10), do: 0x6BE22838
  defp get_polynomial(11), do: 0x9989AB3B
  defp get_polynomial(12), do: 0x4D43CFD0
  defp get_polynomial(13), do: 0xBF284CD3
  defp get_polynomial(14), do: 0xAC78BF27
  defp get_polynomial(15), do: 0x5E133C24
  defp get_polynomial(16), do: 0x105EC76F
  defp get_polynomial(17), do: 0xE235446C
  defp get_polynomial(18), do: 0xF165B798
  defp get_polynomial(19), do: 0x030E349B
  defp get_polynomial(20), do: 0xD7C45070
  defp get_polynomial(21), do: 0x25AFD373
  defp get_polynomial(22), do: 0x36FF2087
  defp get_polynomial(23), do: 0xC494A384
  defp get_polynomial(24), do: 0x9A879FA0
  defp get_polynomial(25), do: 0x68EC1CA3
  defp get_polynomial(26), do: 0x7BBCEF57
  defp get_polynomial(27), do: 0x89D76C54
  defp get_polynomial(28), do: 0x5D1D08BF
  defp get_polynomial(29), do: 0xAF768BBC
  defp get_polynomial(30), do: 0xBC267848
  defp get_polynomial(31), do: 0x4E4DFB4B
  defp get_polynomial(32), do: 0x20BD8EDE
  defp get_polynomial(33), do: 0xD2D60DDD
  defp get_polynomial(34), do: 0xC186FE29
  defp get_polynomial(35), do: 0x33ED7D2A
  defp get_polynomial(36), do: 0xE72719C1
  defp get_polynomial(37), do: 0x154C9AC2
  defp get_polynomial(38), do: 0x061C6936
  defp get_polynomial(39), do: 0xF477EA35
  defp get_polynomial(40), do: 0xAA64D611
  defp get_polynomial(41), do: 0x580F5512
  defp get_polynomial(42), do: 0x4B5FA6E6
  defp get_polynomial(43), do: 0xB93425E5
  defp get_polynomial(44), do: 0x6DFE410E
  defp get_polynomial(45), do: 0x9F95C20D
  defp get_polynomial(46), do: 0x8CC531F9
  defp get_polynomial(47), do: 0x7EAEB2FA
  defp get_polynomial(48), do: 0x30E349B1
  defp get_polynomial(49), do: 0xC288CAB2
  defp get_polynomial(50), do: 0xD1D83946
  defp get_polynomial(51), do: 0x23B3BA45
  defp get_polynomial(52), do: 0xF779DEAE
  defp get_polynomial(53), do: 0x05125DAD
  defp get_polynomial(54), do: 0x1642AE59
  defp get_polynomial(55), do: 0xE4292D5A
  defp get_polynomial(56), do: 0xBA3A117E
  defp get_polynomial(57), do: 0x4851927D
  defp get_polynomial(58), do: 0x5B016189
  defp get_polynomial(59), do: 0xA96AE28A
  defp get_polynomial(60), do: 0x7DA08661
  defp get_polynomial(61), do: 0x8FCB0562
  defp get_polynomial(62), do: 0x9C9BF696
  defp get_polynomial(63), do: 0x6EF07595
  defp get_polynomial(64), do: 0x417B1DBC
  defp get_polynomial(65), do: 0xB3109EBF
  defp get_polynomial(66), do: 0xA0406D4B
  defp get_polynomial(67), do: 0x522BEE48
  defp get_polynomial(68), do: 0x86E18AA3
  defp get_polynomial(69), do: 0x748A09A0
  defp get_polynomial(70), do: 0x67DAFA54
  defp get_polynomial(71), do: 0x95B17957
  defp get_polynomial(72), do: 0xCBA24573
  defp get_polynomial(73), do: 0x39C9C670
  defp get_polynomial(74), do: 0x2A993584
  defp get_polynomial(75), do: 0xD8F2B687
  defp get_polynomial(76), do: 0x0C38D26C
  defp get_polynomial(77), do: 0xFE53516F
  defp get_polynomial(78), do: 0xED03A29B
  defp get_polynomial(79), do: 0x1F682198
  defp get_polynomial(80), do: 0x5125DAD3
  defp get_polynomial(81), do: 0xA34E59D0
  defp get_polynomial(82), do: 0xB01EAA24
  defp get_polynomial(83), do: 0x42752927
  defp get_polynomial(84), do: 0x96BF4DCC
  defp get_polynomial(85), do: 0x64D4CECF
  defp get_polynomial(86), do: 0x77843D3B
  defp get_polynomial(87), do: 0x85EFBE38
  defp get_polynomial(88), do: 0xDBFC821C
  defp get_polynomial(89), do: 0x2997011F
  defp get_polynomial(90), do: 0x3AC7F2EB
  defp get_polynomial(91), do: 0xC8AC71E8
  defp get_polynomial(92), do: 0x1C661503
  defp get_polynomial(93), do: 0xEE0D9600
  defp get_polynomial(94), do: 0xFD5D65F4
  defp get_polynomial(95), do: 0x0F36E6F7
  defp get_polynomial(96), do: 0x61C69362
  defp get_polynomial(97), do: 0x93AD1061
  defp get_polynomial(98), do: 0x80FDE395
  defp get_polynomial(99), do: 0x72966096
  defp get_polynomial(100), do: 0xA65C047D
  defp get_polynomial(101), do: 0x5437877E
  defp get_polynomial(102), do: 0x4767748A
  defp get_polynomial(103), do: 0xB50CF789
  defp get_polynomial(104), do: 0xEB1FCBAD
  defp get_polynomial(105), do: 0x197448AE
  defp get_polynomial(106), do: 0x0A24BB5A
  defp get_polynomial(107), do: 0xF84F3859
  defp get_polynomial(108), do: 0x2C855CB2
  defp get_polynomial(109), do: 0xDEEEDFB1
  defp get_polynomial(110), do: 0xCDBE2C45
  defp get_polynomial(111), do: 0x3FD5AF46
  defp get_polynomial(112), do: 0x7198540D
  defp get_polynomial(113), do: 0x83F3D70E
  defp get_polynomial(114), do: 0x90A324FA
  defp get_polynomial(115), do: 0x62C8A7F9
  defp get_polynomial(116), do: 0xB602C312
  defp get_polynomial(117), do: 0x44694011
  defp get_polynomial(118), do: 0x5739B3E5
  defp get_polynomial(119), do: 0xA55230E6
  defp get_polynomial(120), do: 0xFB410CC2
  defp get_polynomial(121), do: 0x092A8FC1
  defp get_polynomial(122), do: 0x1A7A7C35
  defp get_polynomial(123), do: 0xE811FF36
  defp get_polynomial(124), do: 0x3CDB9BDD
  defp get_polynomial(125), do: 0xCEB018DE
  defp get_polynomial(126), do: 0xDDE0EB2A
  defp get_polynomial(127), do: 0x2F8B6829
  defp get_polynomial(128), do: 0x82F63B78
  defp get_polynomial(129), do: 0x709DB87B
  defp get_polynomial(130), do: 0x63CD4B8F
  defp get_polynomial(131), do: 0x91A6C88C
  defp get_polynomial(132), do: 0x456CAC67
  defp get_polynomial(133), do: 0xB7072F64
  defp get_polynomial(134), do: 0xA457DC90
  defp get_polynomial(135), do: 0x563C5F93
  defp get_polynomial(136), do: 0x082F63B7
  defp get_polynomial(137), do: 0xFA44E0B4
  defp get_polynomial(138), do: 0xE9141340
  defp get_polynomial(139), do: 0x1B7F9043
  defp get_polynomial(140), do: 0xCFB5F4A8
  defp get_polynomial(141), do: 0x3DDE77AB
  defp get_polynomial(142), do: 0x2E8E845F
  defp get_polynomial(143), do: 0xDCE5075C
  defp get_polynomial(144), do: 0x92A8FC17
  defp get_polynomial(145), do: 0x60C37F14
  defp get_polynomial(146), do: 0x73938CE0
  defp get_polynomial(147), do: 0x81F80FE3
  defp get_polynomial(148), do: 0x55326B08
  defp get_polynomial(149), do: 0xA759E80B
  defp get_polynomial(150), do: 0xB4091BFF
  defp get_polynomial(151), do: 0x466298FC
  defp get_polynomial(152), do: 0x1871A4D8
  defp get_polynomial(153), do: 0xEA1A27DB
  defp get_polynomial(154), do: 0xF94AD42F
  defp get_polynomial(155), do: 0x0B21572C
  defp get_polynomial(156), do: 0xDFEB33C7
  defp get_polynomial(157), do: 0x2D80B0C4
  defp get_polynomial(158), do: 0x3ED04330
  defp get_polynomial(159), do: 0xCCBBC033
  defp get_polynomial(160), do: 0xA24BB5A6
  defp get_polynomial(161), do: 0x502036A5
  defp get_polynomial(162), do: 0x4370C551
  defp get_polynomial(163), do: 0xB11B4652
  defp get_polynomial(164), do: 0x65D122B9
  defp get_polynomial(165), do: 0x97BAA1BA
  defp get_polynomial(166), do: 0x84EA524E
  defp get_polynomial(167), do: 0x7681D14D
  defp get_polynomial(168), do: 0x2892ED69
  defp get_polynomial(169), do: 0xDAF96E6A
  defp get_polynomial(170), do: 0xC9A99D9E
  defp get_polynomial(171), do: 0x3BC21E9D
  defp get_polynomial(172), do: 0xEF087A76
  defp get_polynomial(173), do: 0x1D63F975
  defp get_polynomial(174), do: 0x0E330A81
  defp get_polynomial(175), do: 0xFC588982
  defp get_polynomial(176), do: 0xB21572C9
  defp get_polynomial(177), do: 0x407EF1CA
  defp get_polynomial(178), do: 0x532E023E
  defp get_polynomial(179), do: 0xA145813D
  defp get_polynomial(180), do: 0x758FE5D6
  defp get_polynomial(181), do: 0x87E466D5
  defp get_polynomial(182), do: 0x94B49521
  defp get_polynomial(183), do: 0x66DF1622
  defp get_polynomial(184), do: 0x38CC2A06
  defp get_polynomial(185), do: 0xCAA7A905
  defp get_polynomial(186), do: 0xD9F75AF1
  defp get_polynomial(187), do: 0x2B9CD9F2
  defp get_polynomial(188), do: 0xFF56BD19
  defp get_polynomial(189), do: 0x0D3D3E1A
  defp get_polynomial(190), do: 0x1E6DCDEE
  defp get_polynomial(191), do: 0xEC064EED
  defp get_polynomial(192), do: 0xC38D26C4
  defp get_polynomial(193), do: 0x31E6A5C7
  defp get_polynomial(194), do: 0x22B65633
  defp get_polynomial(195), do: 0xD0DDD530
  defp get_polynomial(196), do: 0x0417B1DB
  defp get_polynomial(197), do: 0xF67C32D8
  defp get_polynomial(198), do: 0xE52CC12C
  defp get_polynomial(199), do: 0x1747422F
  defp get_polynomial(200), do: 0x49547E0B
  defp get_polynomial(201), do: 0xBB3FFD08
  defp get_polynomial(202), do: 0xA86F0EFC
  defp get_polynomial(203), do: 0x5A048DFF
  defp get_polynomial(204), do: 0x8ECEE914
  defp get_polynomial(205), do: 0x7CA56A17
  defp get_polynomial(206), do: 0x6FF599E3
  defp get_polynomial(207), do: 0x9D9E1AE0
  defp get_polynomial(208), do: 0xD3D3E1AB
  defp get_polynomial(209), do: 0x21B862A8
  defp get_polynomial(210), do: 0x32E8915C
  defp get_polynomial(211), do: 0xC083125F
  defp get_polynomial(212), do: 0x144976B4
  defp get_polynomial(213), do: 0xE622F5B7
  defp get_polynomial(214), do: 0xF5720643
  defp get_polynomial(215), do: 0x07198540
  defp get_polynomial(216), do: 0x590AB964
  defp get_polynomial(217), do: 0xAB613A67
  defp get_polynomial(218), do: 0xB831C993
  defp get_polynomial(219), do: 0x4A5A4A90
  defp get_polynomial(220), do: 0x9E902E7B
  defp get_polynomial(221), do: 0x6CFBAD78
  defp get_polynomial(222), do: 0x7FAB5E8C
  defp get_polynomial(223), do: 0x8DC0DD8F
  defp get_polynomial(224), do: 0xE330A81A
  defp get_polynomial(225), do: 0x115B2B19
  defp get_polynomial(226), do: 0x020BD8ED
  defp get_polynomial(227), do: 0xF0605BEE
  defp get_polynomial(228), do: 0x24AA3F05
  defp get_polynomial(229), do: 0xD6C1BC06
  defp get_polynomial(230), do: 0xC5914FF2
  defp get_polynomial(231), do: 0x37FACCF1
  defp get_polynomial(232), do: 0x69E9F0D5
  defp get_polynomial(233), do: 0x9B8273D6
  defp get_polynomial(234), do: 0x88D28022
  defp get_polynomial(235), do: 0x7AB90321
  defp get_polynomial(236), do: 0xAE7367CA
  defp get_polynomial(237), do: 0x5C18E4C9
  defp get_polynomial(238), do: 0x4F48173D
  defp get_polynomial(239), do: 0xBD23943E
  defp get_polynomial(240), do: 0xF36E6F75
  defp get_polynomial(241), do: 0x0105EC76
  defp get_polynomial(242), do: 0x12551F82
  defp get_polynomial(243), do: 0xE03E9C81
  defp get_polynomial(244), do: 0x34F4F86A
  defp get_polynomial(245), do: 0xC69F7B69
  defp get_polynomial(246), do: 0xD5CF889D
  defp get_polynomial(247), do: 0x27A40B9E
  defp get_polynomial(248), do: 0x79B737BA
  defp get_polynomial(249), do: 0x8BDCB4B9
  defp get_polynomial(250), do: 0x988C474D
  defp get_polynomial(251), do: 0x6AE7C44E
  defp get_polynomial(252), do: 0xBE2DA0A5
  defp get_polynomial(253), do: 0x4C4623A6
  defp get_polynomial(254), do: 0x5F16D052
  defp get_polynomial(255), do: 0xAD7D5351
end
