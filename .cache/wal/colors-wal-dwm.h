static const char norm_fg[] = "#9bc1dd";
static const char norm_bg[] = "#0d1215";
static const char norm_border[] = "#6c879a";

static const char sel_fg[] = "#9bc1dd";
static const char sel_bg[] = "#A45A4E";
static const char sel_border[] = "#9bc1dd";

static const char urg_fg[] = "#9bc1dd";
static const char urg_bg[] = "#575966";
static const char urg_border[] = "#575966";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
