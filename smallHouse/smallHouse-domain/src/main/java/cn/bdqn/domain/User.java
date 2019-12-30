package cn.bdqn.domain;

public class User {
    private Integer userId;

    private String userEamil;

    private String userPassword;

    private String userNickname;

    private String userName;

    private Integer userAge;

    private Integer userSex;

    private String userHead;

    private Integer userVip;

    private Integer userState;

    private Integer userAddress;

    private String userProfession;

    private String userAttention;

    private String userFans;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserEamil() {
        return userEamil;
    }

    public void setUserEamil(String userEamil) {
        this.userEamil = userEamil == null ? null : userEamil.trim();
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword == null ? null : userPassword.trim();
    }

    public String getUserNickname() {
        return userNickname;
    }

    public void setUserNickname(String userNickname) {
        this.userNickname = userNickname == null ? null : userNickname.trim();
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public Integer getUserAge() {
        return userAge;
    }

    public void setUserAge(Integer userAge) {
        this.userAge = userAge;
    }

    public Integer getUserSex() {
        return userSex;
    }

    public void setUserSex(Integer userSex) {
        this.userSex = userSex;
    }

    public String getUserHead() {
        return userHead;
    }

    public void setUserHead(String userHead) {
        this.userHead = userHead == null ? null : userHead.trim();
    }

    public Integer getUserVip() {
        return userVip;
    }

    public void setUserVip(Integer userVip) {
        this.userVip = userVip;
    }

    public Integer getUserState() {
        return userState;
    }

    public void setUserState(Integer userState) {
        this.userState = userState;
    }

    public Integer getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(Integer userAddress) {
        this.userAddress = userAddress;
    }

    public String getUserProfession() {
        return userProfession;
    }

    public void setUserProfession(String userProfession) {
        this.userProfession = userProfession == null ? null : userProfession.trim();
    }

    public String getUserAttention() {
        return userAttention;
    }

    public void setUserAttention(String userAttention) {
        this.userAttention = userAttention == null ? null : userAttention.trim();
    }

    public String getUserFans() {
        return userFans;
    }

    public void setUserFans(String userFans) {
        this.userFans = userFans == null ? null : userFans.trim();
    }
}