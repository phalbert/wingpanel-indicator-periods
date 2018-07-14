public class Periods.Services.Month : GLib.Object {
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

    public Month () {
        this._percentage_used = 0;
        this._used = 0;
        this._total = 0;
    }

    private void update_percentage_used () {
        _percentage_used = (int)Math.round ((used / total) * 100);
    }

    private void update_total () {
        _now = new DateTime.now_local ();
        var current_month = _now.get_month ();
        var month = Utils.get_month_enum(current_month);  
        DateYear year = (DateYear)_now.get_year ();

        _total = Date.get_days_in_month (month, year);
    }

    private void update_used () {
        _now = new DateTime.now_local ();
        _used = _now.get_day_of_month();
    }
}