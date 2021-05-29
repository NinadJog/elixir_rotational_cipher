defmodule ElixirRotationalCipher do
 @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    (for << ch <- text >>, do: ch |> rotate_char(shift)) # Rotate each character
      |> to_string                                       # Convert the charlist to string.
  end

  @doc """
  If the input is an uppercase or lowercase character, it returns the rotated
  character. Otherwise it returns the character as it is.
  """
   @spec rotate_char(text :: char, shift :: integer) :: char
   defp rotate_char(ch, shift) when ch in ?A..?Z, do: rotate_with_offset(ch, shift, ?A)  # Capital (uppercase) letter
   defp rotate_char(ch, shift) when ch in ?a..?z, do: rotate_with_offset(ch, shift, ?a)  # Small (lowercase) letter
   defp rotate_char(ch, _shift), do: ch                                                  # Not a letter

   @spec rotate_with_offset(ch :: char, shift :: integer, low :: integer) :: char
   defp rotate_with_offset(ch, shift, low), do: low + rem(ch - low + shift, 26)
end
