defmodule ErlangMD5 do
  def md5(string \\ "Tales from the Crypt") do
    IO.inspect :crypto.md5(string)
  end
end
