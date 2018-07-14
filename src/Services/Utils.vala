using Gee;

public class Periods.Services.Utils  : GLib.Object {
    public Utils () {
    }

    construct { }

    public static string format_size (double val) {
        //  const string[] units = {
        //      N_ ("{} kB"),
        //      N_ ("{} MB"),
        //      N_ ("{} GB")
        //  };
        //  int index = -1;
        //  while (index + 1 < units.length && (val >= 1000 || index < 0)) {
        //      val /= 1000;
        //      ++index;
        //  }
        //  if (index < 0) {
        //      return ngettext ("%u B", "%u B", (ulong)val).printf ((uint)val);
        //  }

        //  // 4 significant digits
        //  var pattern = _ (units[index]).replace ("{}",
        //                                          val <   9.95 ? "%.1f" :
        //                                          val <  99.5  ? "%.0f" :
        //                                          val < 999.5  ? "%.0f" : "%.0f");
        return val.to_string();// pattern.printf (val);
    }

    public static string format_frequency (double val) {
        const string[] units = {
            N_ ("{} kHz"),
            N_ ("{} MHz"),
            N_ ("{} GHz")
        };
        int index = -1;
        while (index + 1 < units.length && (val >= 1000 || index < 0)) {
            val /= 1000;
            ++index;
        }
        if (index < 0) {
            return ngettext ("%u Hz", "%u Hz", (ulong)val).printf ((uint)val);
        }

        // 4 significant digits
        var pattern = _ (units[index]).replace ("{}",
                                                val <   9.95 ? "%.1f" :
                                                val <  99.5  ? "%.0f" :
                                                val < 999.5  ? "%.0f" : "%.0f");
        return pattern.printf (val);
    }

    public static DateMonth get_month_enum(int month){
        var map = new HashMap<int, DateMonth> ();
        // Setting values
        map.set (1, DateMonth.JANUARY);
        map.set (2, DateMonth.FEBRUARY);
        map.set (3, DateMonth.MARCH);
        map.set (4, DateMonth.APRIL);
        map.set (5, DateMonth.MAY);
        map.set (6, DateMonth.JUNE);
        map.set (7, DateMonth.JULY);
        map.set (8, DateMonth.AUGUST);
        map.set (9, DateMonth.SEPTEMBER);
        map.set (10, DateMonth.OCTOBER);
        map.set (11, DateMonth.NOVEMBER);
        map.set (12, DateMonth.DECEMBER);
    
        return map.get(month);
    }
}