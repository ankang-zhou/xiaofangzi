package cn.bdqn.domain;

public class Tourist {
    private Integer touristId;

    private String touristNickname;

    private String touristEmail;

    private String headId;

    public Integer getTouristId() {
        return touristId;
    }

    public void setTouristId(Integer touristId) {
        this.touristId = touristId;
    }

    public String getTouristNickname() {
        return touristNickname;
    }

    public void setTouristNickname(String touristNickname) {
        this.touristNickname = touristNickname == null ? null : touristNickname.trim();
    }

    public String getTouristEmail() {
        return touristEmail;
    }

    public void setTouristEmail(String touristEmail) {
        this.touristEmail = touristEmail == null ? null : touristEmail.trim();
    }

    public String getHeadId() {
        return headId;
    }

    public void setHeadId(String headId) {
        this.headId = headId == null ? null : headId.trim();
    }
}