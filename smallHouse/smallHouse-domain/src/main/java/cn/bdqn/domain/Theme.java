package cn.bdqn.domain;

public class Theme {
    private Integer themeId;

    private String themeName;

    private String themeUrl;

    private Integer themeState;

    public Integer getThemeId() {
        return themeId;
    }

    public void setThemeId(Integer themeId) {
        this.themeId = themeId;
    }

    public String getThemeName() {
        return themeName;
    }

    public void setThemeName(String themeName) {
        this.themeName = themeName == null ? null : themeName.trim();
    }

    public String getThemeUrl() {
        return themeUrl;
    }

    public void setThemeUrl(String themeUrl) {
        this.themeUrl = themeUrl == null ? null : themeUrl.trim();
    }

    public Integer getThemeState() {
        return themeState;
    }

    public void setThemeState(Integer themeState) {
        this.themeState = themeState;
    }
}