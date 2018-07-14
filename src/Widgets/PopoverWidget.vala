public class Periods.Widgets.PopoverWidget : Gtk.Grid {
    private Periods.Indicator indicator;
    private Periods.Widgets.MainView main_view;
    private Periods.Widgets.SettingsView settings_view;
    private Gtk.Stack stack;

    public PopoverWidget (Periods.Indicator _indicator) {
        Object (orientation: Gtk.Orientation.VERTICAL);
        indicator = _indicator;
    }

    construct {
        main_view = new Periods.Widgets.MainView ();
        main_view.hexpand = true;
        settings_view = new Periods.Widgets.SettingsView ();

        stack = new Gtk.Stack ();
        stack.hexpand = true;
        stack.add_titled (main_view, main_view.name, _ ("Periods"));
        stack.add_titled (settings_view, settings_view.name, _ ("Settings"));

        var stack_switcher = new Gtk.StackSwitcher ();
        stack_switcher.margin = 3;
        stack_switcher.halign = Gtk.Align.FILL;
        stack_switcher.margin_start = 15;
        stack_switcher.margin_end = 15;
        stack_switcher.homogeneous = true;
        stack_switcher.stack = stack;

        var quit_button = new Gtk.ModelButton ();
        quit_button.text = _ ("Quit");
        quit_button.get_style_context ().add_class ("menuitem");
        quit_button.get_style_context ().remove_class ("button");
        quit_button.clicked.connect (() => {
                                         indicator.hide ();
                                     });

        var separator_start = new Wingpanel.Widgets.Separator ();
        separator_start.hexpand = true;

        var separator_end = new Wingpanel.Widgets.Separator ();
        separator_end.hexpand = true;

        attach (stack_switcher,  0, 0, 1, 1);
        attach (separator_start, 0, 1, 1, 1);
        attach (stack,           0, 2, 1, 1);
        attach (separator_end,   0, 3, 1, 1);
        attach (quit_button,     0, 4, 1, 1);
    }

    public void set_main_view () {
        stack.visible_child_name = main_view.name;
    }

    public void update_day_info (double used_day, double total_day) {
        main_view.update_day (used_day, total_day);
    }

    public void update_week_info (double used_week, double total_week) {
        main_view.update_week (used_week, total_week);
    }

    public void update_month_info (double used_month, double total_month) {
        main_view.update_month (used_month, total_month);
    }

    public void update_year_info (double used_year, double total_year) {
        main_view.update_year (used_year, total_year);
    }
}