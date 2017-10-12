package mini1;

public class DNASequence {
	
	 String data;
	
	public DNASequence(String givenData) {
		data = givenData;
	}
	
	public boolean allValid() {

		for(int i=0; i<data.length(); i++) {
			char c = data.charAt(i);
			if(!("AGCT".indexOf(c) >= 0)) return false;
		}
		return true;
	}
	
	public void complement() {
				
	}
	
	public int countBondsWithShift(DNASequence other, int shift) {
		return -1;
	}
	
	public String findBondsWithShift(DNASequence other, int shift) {
		return "test";
	}
	
	public int findMaxPossibleBonds(DNASequence other) {
		return -1;
	}
	
	public void fix() {
		
	}
	
	public boolean isSubsequence(DNASequence other) {
		return false;
	}
	
	public String toString() {
		return "test";
	}
	
	public boolean willBond(char c1, char c2) {
		return false;
	}
}
