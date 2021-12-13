const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0d1215", /* black   */
  [1] = "#575966", /* red     */
  [2] = "#A45A4E", /* green   */
  [3] = "#708466", /* yellow  */
  [4] = "#B0936C", /* blue    */
  [5] = "#DBA069", /* magenta */
  [6] = "#2E5399", /* cyan    */
  [7] = "#9bc1dd", /* white   */

  /* 8 bright colors */
  [8]  = "#6c879a",  /* black   */
  [9]  = "#575966",  /* red     */
  [10] = "#A45A4E", /* green   */
  [11] = "#708466", /* yellow  */
  [12] = "#B0936C", /* blue    */
  [13] = "#DBA069", /* magenta */
  [14] = "#2E5399", /* cyan    */
  [15] = "#9bc1dd", /* white   */

  /* special colors */
  [256] = "#0d1215", /* background */
  [257] = "#9bc1dd", /* foreground */
  [258] = "#9bc1dd",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
