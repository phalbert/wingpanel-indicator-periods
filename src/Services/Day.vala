public class Periods.Services.Day : GLib.Object {
    private int _percentage_used;
    private int _total;
    private int _used;

    private DateTime _now;
    const int _daily_hours = 24;
    const int _hour_minutes = 60;

    public int percentage_used {
        get { update_percentage_used (); return _percentage_used; }
    }
    public double total {
        get { update_total (); return _total; }
    }
    public double used {
        get { update_used (); return _used; }
    }

    public Day () {
        this._percentage_used = 0;
        this._used = 0;
        this._total = 0;
    }

    private void update_percentage_used () {
        _percentage_used = (int)Math.round ((used / total) * 100);
    }

    private void update_total () {
        var minutes_in_full_day = _daily_hours * _hour_minutes;
        _total = minutes_in_full_day;
    }

    private void update_used () {
        _now = new DateTime.now_local ();
        var full_hours = _now.get_hour();
        var minutes_in_current_hour = _now.get_minute ();
        var minutes_in_full_hours = full_hours * 60;
        var total_minutes = minutes_in_full_hours + minutes_in_current_hour;
        _used = total_minutes;
    }

}