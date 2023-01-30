class RnaTranscription {
  String toRna(String dna) {
    String rna = '';
    for (int i = 0; i < dna.length; i++) {
      switch (dna[i]) {
        case 'G':
          rna += 'C';
          break;
        case 'C':
          rna += 'G';
          break;
        case 'T':
          rna += 'A';
          break;
        case 'A':
          rna += 'U';
          break;
        default:
          throw ArgumentError("Invalid DNA strand");
      }
    }
    return rna;
  }
}
