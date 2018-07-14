public class Periods.Services.Year : GLib.Object {
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

    public Year () {
        this._percentage_used = 0;
        this._used = 0;
        this._total = 0;
    }

    private void update_percentage_used () {
        _percentage_used = (int)Math.round ((used / total) * 100);
    }

    private void update_total () {
        _total = get_number_of_days_in_year();
    }

    private void update_used () {
        _now = new DateTime.now_local ();
        _used = _now.get_day_of_year();
    }

    private int get_number_of_days_in_year(){
        GLib.List<int> list = new GLib.List<int> ();
        list.append (1);
        list.append (2);
        list.append (3);
        list.append (4);
        list.append (5);
        list.append (6);
        list.append (7);
        list.append (8);
        list.append (9);
        list.append (10);
        list.append (11);
        list.append (12);

        int total_days = 0;

        foreach (int month in list) {
            total_days += get_days_in_month(month);
        }
        
        return total_days;
    }

    private int get_days_in_month(int month_value){
        _now = new DateTime.now_local ();
        var month = Utils.get_month_enum(month_value);  
        DateYear year = (DateYear)_now.get_year ();
        return Date.get_days_in_month (month, year);
    }

}