public class Periods.Services.Week : GLib.Object {
    //unit in a year wil be a week
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

    public Week () {
        this._percentage_used = 0;
        this._used = 0;
        this._total = 0;
    }

    private void update_percentage_used () {
        _percentage_used = (int)Math.round ((used / total) * 100);
    }

    private void update_total () {
        _total = 7 * 24;
    }

    private void update_used () {
        _now = new DateTime.now_local ();
        var _day_hours = _now.get_hour();
        var _current_day = _now.get_day_of_week();

        if (_current_day == 1){
            _day_hours = _now.get_hour();
        }
        else{
           var _used_days = _current_day - 1;
           _day_hours = (_used_days * 24) + _day_hours;
        }
            
        _used = _day_hours;
    }

}