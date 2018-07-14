public class Periods.Widgets.MainView : Gtk.Grid {
    private Gtk.Label day_value_label;
    private Gtk.Label week_value_label;
    private Gtk.Label month_value_label;
    private Gtk.Label year_value_label;
    private Gtk.Label network_value_label;

    public MainView () {
        name = "main";
        orientation = Gtk.Orientation.HORIZONTAL;
        hexpand = true;
        column_spacing = 40; // to add space between label and value label
    }

    construct {
        day_value_label = create_value_label ();
        week_value_label = create_value_label ();
        month_value_label = create_value_label ();
        year_value_label = create_value_label ();
        network_value_label = create_value_label ();

        var day_label = create_name_label (_ ("Day:"));
        var week_label = create_name_label (_ ("Week:"));
        var month_label = create_name_label (_ ("Month:"));
        var year_label = create_name_label (_ ("Year:"));
        var network_label = create_name_label (_ ("Network:"));

        attach (day_label,         1, 0, 1, 1);
        attach (day_value_label,   2, 0, 1, 1);
        attach (week_label,          1, 1, 1, 1);
        attach (week_value_label,    2, 1, 1, 1);
        attach (month_label,         1, 2, 1, 1);
        attach (month_value_label,   2, 2, 1, 1);
        attach (year_label,       1, 3, 1, 1);
        attach (year_value_label, 2, 3, 1, 1);
    }

    private Gtk.Label create_name_label (string label_name) {
        var label = new Gtk.Label (label_name);
        label.halign = Gtk.Align.START;
        label.get_style_context ().add_class ("menuitem");
        label.margin_start = 9;
        return label;
    }

    private Gtk.Label create_value_label (string label_name="") {
        var label = new Gtk.Label (label_name);
        label.halign = Gtk.Align.END;
        label.get_style_context ().add_class ("menuitem");
        label.margin_end = 9;
        return label;
    }

    public void update_day (double used_day, double total_day) {
        day_value_label.set_label ("%s / %s".printf (Periods.Services.Utils.format_size (used_day), Periods.Services.Utils.format_size (total_day)));
    }

    public void update_week (double used_week, double total_week) {
        week_value_label.set_label ("%s / %s".printf (Periods.Services.Utils.format_size (used_week), Periods.Services.Utils.format_size (total_week)));
    }

    public void update_month (double used_month, double total_month) {
        month_value_label.set_label ("%s / %s".printf (Periods.Services.Utils.format_size (used_month), Periods.Services.Utils.format_size (total_month)));
    }

    public void update_year (double used_year, double total_year) {
        year_value_label.set_label ("%s / %s".printf (Periods.Services.Utils.format_size (used_year), Periods.Services.Utils.format_size (total_year)));
    }
}
