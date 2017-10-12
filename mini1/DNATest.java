package mini1;

public class DNATest {

	public static void main(String[] args) {
		DNASequence dna = new DNASequence("ACGT");
		System.out.println(dna.allValid());
		System.out.println(dna.data);
		dna.complement();
		System.out.println(dna.data);
		
	}
}
