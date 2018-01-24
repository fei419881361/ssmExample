package entity;

public class LenBook {
    private Integer lenId;

    private Integer rId;

    private Integer bId;

    private String lenTime;

    public Integer getLenId() {
        return lenId;
    }

    public void setLenId(Integer lenId) {
        this.lenId = lenId;
    }

    public Integer getrId() {
        return rId;
    }

    public void setrId(Integer rId) {
        this.rId = rId;
    }

    public Integer getbId() {
        return bId;
    }

    public void setbId(Integer bId) {
        this.bId = bId;
    }

    public String getLenTime() {
        return lenTime;
    }

    public void setLenTime(String lenTime) {
        this.lenTime = lenTime == null ? null : lenTime.trim();
    }
}