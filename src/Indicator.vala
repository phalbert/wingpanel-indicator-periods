public class Periods.Indicator : Wingpanel.Indicator {
    const string APPNAME = "wingpanel-indicator-periods";
    private Periods.Services.Day day;
    private Periods.Services.Week week;
    private Periods.Services.Month month;
    private Periods.Services.Year year;

    private Periods.Widgets.DisplayWidget display_widget;
    private Periods.Widgets.PopoverWidget popover_widget;


    public Indicator (Wingpanel.IndicatorManager.ServerType server_type) {
        Object (
            code_name: APPNAME,
            display_name: _ ("Periods"),
            description: _ ("Periods indicator that displays days,weeks,months, etc usage in wingpanel")
            );

        day = new Periods.Services.Day ();
        week = new Periods.Services.Week ();
        month = new Periods.Services.Month ();
        year = new Periods.Services.Year ();

        visible = true;

        update ();
    }

    public override Gtk.Widget get_display_widget () {
        if (display_widget == null) {
            display_widget = new Periods.Widgets.DisplayWidget ();
            update ();
        }
        return display_widget;
    }

    public override Gtk.Widget ? get_widget () {
        if (popover_widget == null) {
            popover_widget = new Periods.Widgets.PopoverWidget (this);
        }

        return popover_widget;
    }

    public override void opened () {
        popover_widget.set_main_view ();
    }

    public override void closed () {
    }

    public void hide () {
        visible = false;
    }

    private void update () {
        if (display_widget != null) {
            Timeout.add_seconds (1, () => {
                                     display_widget.set_day (day.percentage_used);
                                     display_widget.set_week (week.percentage_used);
                                     display_widget.set_month (month.percentage_used);
                                     display_widget.set_year (year.percentage_used);

                                     update_popover_widget_data ();
                                     return true;
                                 });
        }
    }

    private void update_popover_widget_data () {
        popover_widget.update_day_info (day.used, day.total);
        popover_widget.update_week_info (week.used, week.total);
        popover_widget.update_month_info (month.used, month.total);
        popover_widget.update_year_info (year.used, year.total);
    }
}

public Wingpanel.Indicator ? get_indicator (Module module, Wingpanel.IndicatorManager.ServerType server_type) {
        debug ("Loading periods indicator");

    if (server_type != Wingpanel.IndicatorManager.ServerType.SESSION) {
        debug ("Wingpanel is not in session, not loading periods-indicator");
        return null;
    }

    var indicator = new Periods.Indicator (server_type);

    return indicator;
}
