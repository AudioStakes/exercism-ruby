class Complement
  COMPLEMENTS_FROM_DNA_TO_RNA = {
    G: "C",
    C: "G",
    T: "A",
    A: "U"
  }
  def self.of_dna(dnas)
    rnas = ""
    dnas.chars do |dna|
      rnas << COMPLEMENTS_FROM_DNA_TO_RNA[dna.to_sym]
    end
    rnas
  end
end