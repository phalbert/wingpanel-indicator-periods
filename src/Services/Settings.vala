public class Periods.Services.SettingsManager : Granite.Services.Settings {
    private static SettingsManager ? instance = null;

    public bool show_day { set; get; }
    public bool show_week { set; get; }
    public bool show_month { set; get; }
    public bool show_year { set; get; }
    public bool show_icon { set; get; }

    public SettingsManager () {
        base ("com.github.phalbert.wingpanel-indicator-periods");
    }

    public static SettingsManager get_default () {
        if (instance == null) {
            instance = new SettingsManager ();
        }
        return instance;
    }
}