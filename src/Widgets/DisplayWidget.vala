public class Periods.Widgets.DisplayWidget : Gtk.Grid {
    private Periods.Services.SettingsManager settings;
    private Gtk.Label day_label;
    private Gtk.Label week_label;
    private Gtk.Label month_label;
    private Gtk.Label year_label;
    private Gtk.Image icon;

    private Gtk.Revealer day_revealer;
    private Gtk.Revealer week_revealer;
    private Gtk.Revealer month_revealer;
    private Gtk.Revealer year_revealer;
    private Gtk.Revealer icon_revealer;

    construct {
        column_spacing = 4;
        margin_top = 4;

        settings = Periods.Services.SettingsManager.get_default ();
        icon = new Gtk.Image.from_icon_name ("computer-symbolic", Gtk.IconSize.MENU);
        day_label = new Gtk.Label ("DAY");
        week_label = new Gtk.Label ("WEE");
        month_label = new Gtk.Label ("MON");
        year_label = new Gtk.Label ("YEAR");

        day_revealer = new Gtk.Revealer ();
        day_revealer.transition_type = Gtk.RevealerTransitionType.SLIDE_RIGHT;
        update_day_revelear ();
        day_revealer.add (day_label);

        week_revealer = new Gtk.Revealer ();
        week_revealer.transition_type = Gtk.RevealerTransitionType.SLIDE_RIGHT;
        update_week_revealer ();
        week_revealer.add (week_label);

        month_revealer = new Gtk.Revealer ();
        month_revealer.transition_type = Gtk.RevealerTransitionType.SLIDE_RIGHT;
        update_month_revealer ();
        month_revealer.add (month_label);

        year_revealer = new Gtk.Revealer ();
        year_revealer.transition_type = Gtk.RevealerTransitionType.SLIDE_RIGHT;
        update_year_revealer ();
        year_revealer.add (year_label);

        icon_revealer = new Gtk.Revealer ();
        icon_revealer.transition_type = Gtk.RevealerTransitionType.SLIDE_LEFT;
                                      update_icon_revealer ();
        icon_revealer.add (icon);


        settings.changed.connect (() => {
                                      update_icon_revealer ();
                                      update_day_revelear ();
                                      update_week_revealer ();
                                      update_month_revealer ();
                                      update_year_revealer ();
                                  });

        add (icon_revealer);
        add (day_revealer);
        add (week_revealer);
        add (month_revealer);
        add (year_revealer);
    }

    public void set_day (int day_usage) {
        day_label.set_label (this.format_int (day_usage));
    }

    public void set_week (int week_usage) {
        week_label.set_label (this.format_int (week_usage));
    }

    public void set_month (int month_usage) {
        month_label.set_label (this.format_int (month_usage));
    }

    public void set_year (int year_usage) {
        year_label.set_label (this.format_int (year_usage));
    }

    private void update_day_revelear () {
        day_revealer.reveal_child = settings.show_day;
    }

    private void update_week_revealer () {
        week_revealer.reveal_child = settings.show_week;
    }


    private void update_month_revealer () {
        month_revealer.reveal_child = settings.show_month;
    }

    private void update_year_revealer () {
        year_revealer.reveal_child = settings.show_year;
    }

    private void update_icon_revealer () {
        icon_revealer.reveal_child = settings.show_icon;
    }

    private string format_int (int number) {
        if (number < 10) {
            return "0%i%%".printf (number);
        } else {
            return "%i%%".printf (number);
        }
    }
}
