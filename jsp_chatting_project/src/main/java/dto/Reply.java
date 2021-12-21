package dto;

public class Reply {

    private int r_no;  
    private String r_contents; 
    private String r_date;  
    private int m_num;  
    private int b_num; 
    
    public Reply() {}
    
    public Reply(int r_no, String r_contents, String r_date, int m_num, int b_num) {
	super();
	this.r_no = r_no;
	this.r_contents = r_contents;
	this.r_date = r_date;
	this.m_num = m_num;
	this.b_num = b_num;
    }

    public int getR_no() {
        return r_no;
    }

    public void setR_no(int r_no) {
        this.r_no = r_no;
    }

    public String getR_contents() {
        return r_contents;
    }

    public void setR_contents(String r_contents) {
        this.r_contents = r_contents;
    }

    public String getR_date() {
        return r_date;
    }

    public void setR_date(String r_date) {
        this.r_date = r_date;
    }

    public int getM_num() {
        return m_num;
    }

    public void setM_num(int m_num) {
        this.m_num = m_num;
    }

    public int getB_num() {
        return b_num;
    }

    public void setB_num(int b_num) {
        this.b_num = b_num;
    }
    
    
    
    
}
