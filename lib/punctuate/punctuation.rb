String.class_eval do
  def punctuate!
    formatted_word = ""

    self.each_char do |char|
      converted = false
      converted_char = char

      Punctuate::Symbols::SYMBOLS_MAPPING.each do |character_byte, symbol_bytes_arrays|
        symbol_bytes_arrays.each do |symbol_bytes|
          if (char.bytes == symbol_bytes)
            converted_char = convert_byte_to_character(character_byte)
            converted = true
            break
          end
        end

        break if converted
      end

      formatted_word << converted_char
    end

    return formatted_word
  end

  private

  def convert_byte_to_character(character_byte)
    character_byte.split(",").map(&:to_i).pack("c*").force_encoding("utf-8")
  end
end
