const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#37152f", /* black   */
  [1] = "#FFD57C", /* red     */
  [2] = "#7B6B87", /* green   */
  [3] = "#9D7485", /* yellow  */
  [4] = "#B49691", /* blue    */
  [5] = "#D6A794", /* magenta */
  [6] = "#EEB596", /* cyan    */
  [7] = "#f5debf", /* white   */

  /* 8 bright colors */
  [8]  = "#ab9b85",  /* black   */
  [9]  = "#FFD57C",  /* red     */
  [10] = "#7B6B87", /* green   */
  [11] = "#9D7485", /* yellow  */
  [12] = "#B49691", /* blue    */
  [13] = "#D6A794", /* magenta */
  [14] = "#EEB596", /* cyan    */
  [15] = "#f5debf", /* white   */

  /* special colors */
  [256] = "#37152f", /* background */
  [257] = "#f5debf", /* foreground */
  [258] = "#f5debf",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
