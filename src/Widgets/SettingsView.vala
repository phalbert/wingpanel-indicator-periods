public class Periods.Widgets.SettingsView : Gtk.Grid {
    private Wingpanel.Widgets.Switch show_day_switch;
    private Wingpanel.Widgets.Switch show_week_switch;
    private Wingpanel.Widgets.Switch show_month_switch;
    private Wingpanel.Widgets.Switch show_year_switch;
    private Wingpanel.Widgets.Switch show_icon_switch;
    private Periods.Services.SettingsManager settings;

    public SettingsView () {
        name = "settings";
        orientation = Gtk.Orientation.HORIZONTAL;
        hexpand = true;
    }

    construct {
        settings = Periods.Services.SettingsManager.get_default ();
        show_day_switch = new Wingpanel.Widgets.Switch (_ ("Display day usage"), settings.show_day);
        show_week_switch = new Wingpanel.Widgets.Switch (_ ("Display week usage"), settings.show_week);
        show_month_switch = new Wingpanel.Widgets.Switch (_ ("Display day usage"), settings.show_month);
        show_year_switch = new Wingpanel.Widgets.Switch (_ ("Display week usage"), settings.show_year);
        show_icon_switch = new Wingpanel.Widgets.Switch (_ ("Display icon"), settings.show_icon);

        settings.schema.bind("show-day", show_day_switch.get_switch(), "active", SettingsBindFlags.DEFAULT);
        settings.schema.bind("show-week", show_week_switch.get_switch(), "active", SettingsBindFlags.DEFAULT);
        settings.schema.bind("show-month", show_month_switch.get_switch(), "active", SettingsBindFlags.DEFAULT);
        settings.schema.bind("show-year", show_year_switch.get_switch(), "active", SettingsBindFlags.DEFAULT);
        settings.schema.bind("show-icon", show_icon_switch.get_switch(), "active", SettingsBindFlags.DEFAULT);

        attach (show_day_switch,  0, 1, 1, 1);
        attach (show_week_switch,  0, 2, 1, 1);
        attach (show_month_switch,  0, 3, 1, 1);
        attach (show_year_switch,  0, 4, 1, 1);
        attach (show_icon_switch, 0, 5, 1, 1);
    }
}
