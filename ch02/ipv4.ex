defmodule IPv4 do
  def parse(packet) do
    <<version :: size(4), ihl :: size(4), dscp :: size(6), ecn :: size(2), total_length :: size(16),
      identification :: size(16), flags :: size(3), fragment_offset :: size(13),
      time_to_live :: size(8), protocol :: size(8), checksum :: size(16),
      source :: size(32), destination :: size(32), options :: size(128)>> = packet

    %{
      version: version,
      ihl: ihl,
      dscp: dscp,
      ecn: ecn,
      total_length: total_length,
      identification: identification,
      flags: flags,
      fragment_offset: fragment_offset,
      time_to_live: time_to_live,
      protocol: protocol,
      checksum: checksum,
      source: source,
      destination: destination,
      options: options
    }
  end
end
