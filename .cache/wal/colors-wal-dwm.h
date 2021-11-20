static const char norm_fg[] = "#f5debf";
static const char norm_bg[] = "#37152f";
static const char norm_border[] = "#ab9b85";

static const char sel_fg[] = "#f5debf";
static const char sel_bg[] = "#7B6B87";
static const char sel_border[] = "#f5debf";

static const char urg_fg[] = "#f5debf";
static const char urg_bg[] = "#FFD57C";
static const char urg_border[] = "#FFD57C";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
