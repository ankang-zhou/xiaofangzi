package cn.bdqn.domain;

public class Music {
    private Integer musicId;

    private String musicName;

    private String musicUrl;

    private Integer musicState;

    public Integer getMusicId() {
        return musicId;
    }

    public void setMusicId(Integer musicId) {
        this.musicId = musicId;
    }

    public String getMusicName() {
        return musicName;
    }

    public void setMusicName(String musicName) {
        this.musicName = musicName == null ? null : musicName.trim();
    }

    public String getMusicUrl() {
        return musicUrl;
    }

    public void setMusicUrl(String musicUrl) {
        this.musicUrl = musicUrl == null ? null : musicUrl.trim();
    }

    public Integer getMusicState() {
        return musicState;
    }

    public void setMusicState(Integer musicState) {
        this.musicState = musicState;
    }
}