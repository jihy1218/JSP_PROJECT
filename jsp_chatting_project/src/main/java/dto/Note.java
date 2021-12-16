package dto;

public class Note {
	
	private int n_no;
	private String n_contents;
	private int n_from;
	private int n_to;
	private int n_check;
	private String n_date;
	
	public Note() {
		// TODO Auto-generated constructor stub
	}

	public Note(int n_no, String n_contents, int n_from, int n_to, int n_check, String n_date) {
		super();
		this.n_no = n_no;
		this.n_contents = n_contents;
		this.n_from = n_from;
		this.n_to = n_to;
		this.n_check = n_check;
		this.n_date = n_date;
	}

	public Note(String n_contents, int n_from, int n_to, int n_check) {
		super();
		this.n_contents = n_contents;
		this.n_from = n_from;
		this.n_to = n_to;
		this.n_check = n_check;
	}

	public int getN_no() {
		return n_no;
	}

	public void setN_no(int n_no) {
		this.n_no = n_no;
	}

	public String getN_contents() {
		return n_contents;
	}

	public void setN_contents(String n_contents) {
		this.n_contents = n_contents;
	}

	public int getN_from() {
		return n_from;
	}

	public void setN_from(int n_from) {
		this.n_from = n_from;
	}

	public int getN_to() {
		return n_to;
	}

	public void setN_to(int n_to) {
		this.n_to = n_to;
	}

	public int getN_check() {
		return n_check;
	}

	public void setN_check(int n_check) {
		this.n_check = n_check;
	}

	public String getN_date() {
		return n_date;
	}

	public void setN_date(String n_date) {
		this.n_date = n_date;
	}
	
	

}
