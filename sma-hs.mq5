#import "sma-hs.dll"
void hs_begin();
void sma(int period, double &dst[], const double &src[], int len);
#import

#property indicator_chart_window
#property indicator_buffers 1
#property indicator_plots 1

#property indicator_label1 "SMA"
#property indicator_type1  DRAW_LINE
#property indicator_color1 clrRed
#property indicator_style1 STYLE_SOLID
#property indicator_width1 2

input int PERIOD = 12;

double sma_line[];

int OnInit()
{
    hs_begin();

    SetIndexBuffer(0, sma_line, INDICATOR_DATA);

    return INIT_SUCCEEDED;
}

int OnCalculate(
        const int TOTAL,
        const int PREV,
        const datetime &T[],
        const double &O[],
        const double &H[],
        const double &L[],
        const double &C[],
        const long &TICK_VOL[],
        const long &VOL[],
        const int &SP[])
{
    unsigned int begin = 0;

    if (PREV != 0) {
        begin = PREV - 1;
    }

    sma(PERIOD, sma_line, C, TOTAL);

    return TOTAL;
}
