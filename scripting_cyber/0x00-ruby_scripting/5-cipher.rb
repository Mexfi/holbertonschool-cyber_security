class CaesarCipher
  def initialize(shift)
    @shift = shift
  end

  def encrypt(message)
    cipher(message, @shift)
  end

  def decrypt(message)
    cipher(message, -@shift)
  end

  private

  def cipher(message, shift)
    result = ""

    message.each_char do |char|
      if char.match?(/[A-Z]/)
        # Böyük hərflər üçün (ASCII 65-90)
        base = 'A'.ord
        shifted_char = ((char.ord - base + shift) % 26 + 26) % 26 + base
        result << shifted_char.chr
      elsif char.match?(/[a-z]/)
        # Kiçik hərflər üçün (ASCII 97-122)
        base = 'a'.ord
        shifted_char = ((char.ord - base + shift) % 26 + 26) % 26 + base
        result << shifted_char.chr
      else
        # Hərf olmayan simvollar (boşluq, nida və s.) eynilə qalır
        result << char
      end
    end

    result
  end
end
