package dto;

public class Board {

  private int b_no;
  private String b_title;
  private String b_contents;
  private String b_file;
	private int m_no;
	private String b_date;
	private int b_view;
	private int b_like;
	
	public Board() { }
	
	// 전체 생성자
	public Board(int b_no, String b_title, String b_contents, String b_file, int m_no, String b_date, int b_view,
			int b_like) {
		super();
		this.b_no = b_no;
		this.b_title = b_title;
		this.b_contents = b_contents;
		this.b_file = b_file;
		this.m_no = m_no;
		this.b_date = b_date;
		this.b_view = b_view;
		this.b_like = b_like;
	}

	// 등록 생성자
	public Board(String b_title, String b_contents, String b_file, int m_no) {
		super();
		this.b_title = b_title;
		this.b_contents = b_contents;
		this.b_file = b_file;
		this.m_no = m_no;
	}

	// 수정 생성자
	public Board(int b_no, String b_title, String b_contents, String b_file) {
		super();
		this.b_no = b_no;
		this.b_title = b_title;
		this.b_contents = b_contents;
		this.b_file = b_file;
	}

	// Get, Set
	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_contents() {
		return b_contents;
	}

	public void setB_contents(String b_contents) {
		this.b_contents = b_contents;
	}

	public String getB_file() {
		return b_file;
	}

	public void setB_file(String b_file) {
		this.b_file = b_file;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getB_date() {
		return b_date;
	}

	public void setB_date(String b_date) {
		this.b_date = b_date;
	}

	public int getB_view() {
		return b_view;
	}

	public void setB_view(int b_view) {
		this.b_view = b_view;
	}

	public int getB_like() {
		return b_like;
	}

	public void setB_like(int b_like) {
		this.b_like = b_like;
	}
}
