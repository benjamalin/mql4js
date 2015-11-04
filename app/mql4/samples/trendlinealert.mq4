input bool TradeEnabled = false;  // Breakout trade option਀椀渀瀀甀琀 搀漀甀戀氀攀 䰀漀琀猀 㴀 ㄀⸀　㬀          ⼀⼀ 吀爀愀搀攀 䰀漀琀猀 
input int TargetProfit = 50;      // Target Profit ਀椀渀瀀甀琀 椀渀琀 匀琀漀瀀䰀漀猀猀 㴀 㔀　㬀          ⼀⼀ 匀琀漀瀀 䰀漀猀猀 
input int Slippage = 50;          // Slippage਀ 
਀椀渀瀀甀琀 戀漀漀氀 䄀氀攀爀琀倀漀瀀甀瀀 㴀 琀爀甀攀㬀   ⼀⼀ 倀漀瀀甀瀀 戀爀攀愀欀漀甀琀 渀漀琀椀昀椀挀愀琀椀漀渀 
input bool Sound = true;        // Sound breakout notification਀椀渀瀀甀琀 戀漀漀氀 䔀洀愀椀氀䄀氀攀爀琀 㴀 琀爀甀攀㬀   ⼀⼀ 䔀洀愀椀氀 戀爀攀愀欀漀甀琀 渀漀琀椀昀椀挀愀琀椀漀渀 
input bool MobileAlert = false;  // MT4 mobile notification਀ 
input int PriceDelta = 0;  // More points for breakout threshold਀ 
input int HourStart = 0;   // EA working hour starts਀椀渀瀀甀琀 椀渀琀 䠀漀甀爀䔀渀搀 㴀 ㈀㐀㬀    ⼀⼀ 䔀䄀 眀漀爀欀椀渀最 栀漀甀爀 攀渀搀猀 
਀椀渀瀀甀琀 戀漀漀氀 吀爀愀椀氀椀渀最匀琀漀瀀 㴀 昀愀氀猀攀㬀        ⼀⼀ 吀爀愀椀氀椀渀最匀琀漀瀀 琀爀愀搀攀 漀瀀琀椀漀渀猀 
input bool TrailingStopMoved = false;਀椀渀瀀甀琀 椀渀琀 吀爀愀椀氀椀渀最匀琀漀瀀倀漀椀渀琀 㴀 㔀㬀  
਀椀渀瀀甀琀 戀漀漀氀 䐀椀猀瀀氀愀礀儀甀漀琀攀 㴀 琀爀甀攀㬀             ⼀⼀ 伀瀀琀椀漀渀 漀昀 搀椀猀瀀氀愀礀 爀攀愀氀琀椀洀攀 瀀爀椀挀攀 
input bool DisplayTrendLineStatus = true;   // Option of display trendline breakout status਀ 
input bool AddPosition = false;     /// Add position trade option਀椀渀瀀甀琀 椀渀琀 倀漀猀椀琀椀漀渀匀琀攀瀀倀漀椀渀琀 㴀 ㄀　㬀 
input int PositionStepNumber = 1;਀  
double dLastPrice; ਀猀琀爀椀渀最 猀琀爀吀爀攀渀搀䰀椀渀攀一愀洀攀Ⰰ 猀琀爀唀瀀眀愀爀搀Ⰰ 猀琀爀䐀漀眀渀眀愀爀搀Ⰰ 猀琀爀䄀氀攀爀琀攀搀㬀  
int iTp, iSl, iSp, iTs, iDigiExtend, iPd, iPsp;਀椀渀琀 椀䄀爀爀漀眀刀椀最栀琀䘀漀渀琀匀椀稀攀 㴀 㠀Ⰰ 椀䰀椀渀攀䌀漀甀渀琀㴀　㬀 
color colorAlerted = C'249,236,255';਀椀渀琀 堀䄀砀椀猀 㴀 㔀　Ⰰ 夀䄀砀椀猀 㴀 㔀　Ⰰ 䘀漀渀琀匀椀稀攀㴀㈀　㬀 
਀ 
int OnInit()਀笀 
਀      猀琀爀椀渀最 猀琀爀吀爀攀渀搀氀椀渀攀䔀砀椀猀琀㴀∀∀㬀 
      ਀      
      ChartSetInteger(ChartID(),CHART_EVENT_OBJECT_CREATE,true);਀      䌀栀愀爀琀匀攀琀䤀渀琀攀最攀爀⠀䌀栀愀爀琀䤀䐀⠀⤀Ⰰ䌀䠀䄀刀吀开䔀嘀䔀一吀开伀䈀䨀䔀䌀吀开䐀䔀䰀䔀吀䔀Ⰰ琀爀甀攀⤀㬀 
      ਀      猀琀爀吀爀攀渀搀䰀椀渀攀一愀洀攀 㴀 ∀∀㬀  
      ਀       
      for(int i=0;i<ObjectsTotal();i++)   ਀      笀                                        
         strTrendlineExist = ObjectName(i);਀          
         if (ObjectType(strTrendlineExist)==OBJ_TREND) {਀          
             if (ObjectGetInteger(ChartID(),strTrendlineExist+"_ArrowLeft",OBJPROP_COLOR,0)==colorAlerted) // if the existing arrow left color = colorAlerted਀               猀琀爀吀爀攀渀搀䰀椀渀攀一愀洀攀 ⬀㴀 匀琀爀椀渀最䌀漀渀挀愀琀攀渀愀琀攀⠀∀㄀∀Ⰰ猀琀爀吀爀攀渀搀氀椀渀攀䔀砀椀猀琀Ⰰ∀㬀∀⤀㬀  ⼀⼀⼀∀㄀∀ 昀漀爀 愀氀攀爀琀攀搀 琀爀攀渀搀氀椀渀攀  
            else਀            笀   猀琀爀吀爀攀渀搀䰀椀渀攀一愀洀攀 ⬀㴀 匀琀爀椀渀最䌀漀渀挀愀琀攀渀愀琀攀⠀∀　∀Ⰰ猀琀爀吀爀攀渀搀氀椀渀攀䔀砀椀猀琀Ⰰ∀㬀∀⤀㬀  ⼀⼀⼀∀　∀ 昀漀爀 瀀攀渀搀椀渀最 琀爀攀渀搀氀椀渀攀  
                SetArrowLeftLabel(strTrendlineExist,DoubleToStr(ObjectGetValueByShift(strTrendlineExist,0),Digits),ObjectGetInteger(ChartID(),strTrendlineExist,OBJPROP_COLOR,0));਀            紀 
            }਀      紀 
      ਀      椀昀 ⠀䐀椀最椀琀猀㴀㴀㌀ 簀簀 䐀椀最椀琀猀㴀㴀㔀⤀  
         { iTp=TargetProfit*10; iSl=StopLoss*10; iSp=Slippage*10; iPd=PriceDelta*10; iTs=TrailingStopPoint*10; iDigiExtend=10; iPsp=PositionStepPoint*10; }਀      攀氀猀攀  
         { iTp=TargetProfit; iSl=StopLoss; iSp=Slippage; iPd=PriceDelta; iTs=TrailingStopPoint; iDigiExtend=1; iPsp=PositionStepPoint; }਀          
      strUpward="for upward breakout"; strDownward="for downward breakout"; strAlerted="Alerted"; ਀          
      dLastPrice = iClose(Symbol(),Period(),0);    ਀       
      DisplayTrendlineStatus();਀          
   return(INIT_SUCCEEDED);਀ 
}਀ 
void OnDeinit(const int reason)਀笀 
    int i=0;਀      
    ObjectDelete("QuoteTrendline");਀    伀戀樀攀挀琀䐀攀氀攀琀攀⠀∀匀礀洀戀漀氀吀爀攀渀搀氀椀渀攀∀⤀㬀 
    ObjectDelete("TimeTrendline"); ਀       
    if (iLineCount!=0) { for(i=iLineCount;i>=0;i--) ObjectDelete(StringConcatenate("TrendlineStatus_",i)); } ਀          
    if (reason<=1)  /// Delete trendlines & left arrows  ONLY IF this EA is removed; ਀    笀               ⼀⼀⼀ 伀渀䐀攀椀渀椀琀 爀攀愀猀漀渀猀 氀椀猀琀攀搀 愀琀 ⴀ 栀琀琀瀀㨀⼀⼀搀漀挀猀⸀洀焀氀㐀⸀挀漀洀⼀挀渀⼀挀漀渀猀琀愀渀琀猀⼀渀愀洀攀搀挀漀渀猀琀愀渀琀猀⼀甀渀椀渀椀琀 
      ਀    
      for(i=ObjectsTotal();i>=0;i--) /// reverse loop for any MQL4 delete functions as total quantity keep changing਀      笀  
        if (ObjectType(ObjectName(i))==OBJ_ARROW)//OBJ_ARROW਀           伀戀樀攀挀琀䐀攀氀攀琀攀⠀伀戀樀攀挀琀一愀洀攀⠀椀⤀⤀㬀  
        if (ObjectType(ObjectName(i))==OBJ_TREND)//OBJ_TREND ਀           伀戀樀攀挀琀䐀攀氀攀琀攀⠀伀戀樀攀挀琀一愀洀攀⠀椀⤀⤀㬀     
      }਀      紀 
 ਀紀 
਀⼀⼀⼀ 䔀䄀 䴀愀椀渀 昀甀渀挀琀椀漀渀 
਀瘀漀椀搀 伀渀吀椀挀欀⠀⤀ 
{਀    
   if ( TimeHour(TimeLocal()) < HourStart || TimeHour(TimeLocal())>= HourEnd ) return;਀    
   ProcessTrendlineAlert();਀    
   dLastPrice = iClose(Symbol(),Period(),0); ਀    
   DisplayTrendlineStatus();਀    
   if (TrailingStop) ProcessTrailingStop();਀     
   ਀紀 
਀ 
void ProcessTrendlineAlert()਀笀 
਀   甀猀栀漀爀琀 甀开猀攀瀀 㴀 匀琀爀椀渀最䜀攀琀䌀栀愀爀愀挀琀攀爀⠀∀㬀∀Ⰰ　⤀㬀 
   string strTrendlineArray[];਀    
   int iTrendlineTotal=StringSplit(strTrendLineName,u_sep,strTrendlineArray);਀   椀渀琀 椀㴀　Ⰰ 樀㴀　Ⰰ 琀椀挀欀攀琀 㴀 　㬀 
   string strCurrentTrendline="";਀    
   if (iTrendlineTotal<=0) return;਀    
   for (i=0;i<iTrendlineTotal;i++)਀      笀 
         strCurrentTrendline = StringSubstr(strTrendlineArray[i],1);਀           
         if (StringSubstr(strTrendlineArray[i],0,1)=="1" || strCurrentTrendline=="")਀            挀漀渀琀椀渀甀攀㬀 
      ਀         椀昀 ⠀匀琀爀椀渀最匀甀戀猀琀爀⠀猀琀爀吀爀攀渀搀氀椀渀攀䄀爀爀愀礀嬀椀崀Ⰰ　Ⰰ㄀⤀㴀㴀∀　∀⤀ 笀 
            double dTrendlineCurrentPrice = ObjectGetValueByShift(strCurrentTrendline,0);  ਀             
            /// upward breakout detected਀            椀昀 ⠀搀吀爀攀渀搀氀椀渀攀䌀甀爀爀攀渀琀倀爀椀挀攀㰀椀䌀氀漀猀攀⠀匀礀洀戀漀氀⠀⤀Ⰰ倀攀爀椀漀搀⠀⤀Ⰰ　⤀⬀椀倀搀⨀倀漀椀渀琀 ☀☀  
                  dTrendlineCurrentPrice>dLastPrice+iPd*Point)਀               笀 
                  StringReplace(strTrendLineName,"0"+strCurrentTrendline,"1"+strCurrentTrendline);਀                   
                   if (TradeEnabled)਀                    笀 琀椀挀欀攀琀 㴀 伀爀搀攀爀匀攀渀搀⠀匀礀洀戀漀氀⠀⤀Ⰰ伀倀开䈀唀夀Ⰰ䰀漀琀猀Ⰰ䄀猀欀Ⰰ椀匀瀀Ⰰ䈀椀搀ⴀ椀匀氀⨀倀漀椀渀琀Ⰰ䄀猀欀⬀椀吀瀀⨀倀漀椀渀琀Ⰰ猀琀爀䌀甀爀爀攀渀琀吀爀攀渀搀氀椀渀攀Ⰰ　Ⰰ　Ⰰ䄀焀甀愀⤀㬀 
                      if ( AddPosition && PositionStepNumber > 0 && PositionStepPoint > 0)਀                      笀 昀漀爀 ⠀樀㴀　㬀樀㰀倀漀猀椀琀椀漀渀匀琀攀瀀一甀洀戀攀爀㬀樀⬀⬀⤀ 
                         ticket = OrderSend(Symbol(),OP_BUYSTOP,Lots,Ask+iPsp*(j+1)*Point,iSp,Bid-(iSl-iPsp*(j+1))*Point,Ask+(iTp+iPsp*(j+1))*Point,strCurrentTrendline,0,0,Aqua);   ਀                      紀    
                    }਀                     
                  if (AlertPopup) Alert(strCurrentTrendline," Breakout - UP ", Symbol(),"_",PeriodToString(Period())," ",DoubleToStr(iClose(Symbol(),Period(),0),Digits));਀                  椀昀 ⠀䄀氀攀爀琀倀漀瀀甀瀀☀☀匀漀甀渀搀⤀ 倀氀愀礀匀漀甀渀搀⠀∀愀氀攀爀琀⸀眀愀瘀∀⤀㬀 
                  if (MobileAlert) SendNotification(strCurrentTrendline+" Breakout " +Symbol()+" UP " + PeriodToString(Period()) + " " + DoubleToStr(iClose(Symbol(),Period(),0),Digits) );਀                  椀昀 ⠀䔀洀愀椀氀䄀氀攀爀琀⤀ 匀攀渀搀䴀愀椀氀⠀猀琀爀䌀甀爀爀攀渀琀吀爀攀渀搀氀椀渀攀⬀∀ 䈀爀攀愀欀漀甀琀 ∀ ⬀匀礀洀戀漀氀⠀⤀⬀ ∀ 唀倀 ∀ ⬀ ∀ ∀ ⬀ 倀攀爀椀漀搀吀漀匀琀爀椀渀最⠀倀攀爀椀漀搀⠀⤀⤀ ⬀ ∀ ∀ ⬀ 䐀漀甀戀氀攀吀漀匀琀爀⠀椀䌀氀漀猀攀⠀匀礀洀戀漀氀⠀⤀Ⰰ倀攀爀椀漀搀⠀⤀Ⰰ　⤀Ⰰ䐀椀最椀琀猀⤀Ⰰ 
                     Symbol()+ "_" + PeriodToString(Period()) + ": UP" + "\nCurrent Price: " + DoubleToStr(iClose(Symbol(),Period(),0),Digits) ਀                     ⬀ ∀尀渀吀爀攀渀搀氀椀渀攀 倀爀椀挀攀㨀 ∀ ⬀ 䐀漀甀戀氀攀吀漀匀琀爀⠀搀吀爀攀渀搀氀椀渀攀䌀甀爀爀攀渀琀倀爀椀挀攀Ⰰ䐀椀最椀琀猀⤀   
                     + "\nServer Time: " + TimeToStr(TimeCurrent(),TIME_DATE|TIME_SECONDS));਀                      
                 ਀               紀 
            ਀            ⼀⼀⼀ 搀漀眀渀眀愀爀搀 戀爀攀愀欀漀甀琀 搀攀琀攀挀琀攀搀 
            if (dTrendlineCurrentPrice>iClose(Symbol(),Period(),0)-iPd*Point &&਀                  搀吀爀攀渀搀氀椀渀攀䌀甀爀爀攀渀琀倀爀椀挀攀㰀搀䰀愀猀琀倀爀椀挀攀ⴀ椀倀搀⨀倀漀椀渀琀⤀ 
               {਀                  匀琀爀椀渀最刀攀瀀氀愀挀攀⠀猀琀爀吀爀攀渀搀䰀椀渀攀一愀洀攀Ⰰ∀　∀⬀猀琀爀䌀甀爀爀攀渀琀吀爀攀渀搀氀椀渀攀Ⰰ∀㄀∀⬀猀琀爀䌀甀爀爀攀渀琀吀爀攀渀搀氀椀渀攀⤀㬀 
                  ਀                    椀昀 ⠀吀爀愀搀攀䔀渀愀戀氀攀搀⤀ 
                    { ticket = OrderSend(Symbol(),OP_SELL,Lots,Bid,iSp,Ask+iSl*Point,Bid-iTp*Point,strCurrentTrendline,0,0,Pink);਀                     椀昀 ⠀ 䄀搀搀倀漀猀椀琀椀漀渀 ☀☀ 倀漀猀椀琀椀漀渀匀琀攀瀀一甀洀戀攀爀 㸀 　 ☀☀ 倀漀猀椀琀椀漀渀匀琀攀瀀倀漀椀渀琀 㸀 　⤀ 
                      { for (j=0;j<PositionStepNumber;j++)਀                         琀椀挀欀攀琀 㴀 伀爀搀攀爀匀攀渀搀⠀匀礀洀戀漀氀⠀⤀Ⰰ伀倀开匀䔀䰀䰀匀吀伀倀Ⰰ䰀漀琀猀Ⰰ䈀椀搀ⴀ椀倀猀瀀⨀⠀樀⬀㄀⤀⨀倀漀椀渀琀Ⰰ椀匀瀀Ⰰ䄀猀欀⬀⠀椀匀氀ⴀ椀倀猀瀀⨀⠀樀⬀㄀⤀⤀⨀倀漀椀渀琀Ⰰ䈀椀搀ⴀ⠀椀吀瀀⬀椀倀猀瀀⨀⠀樀⬀㄀⤀⤀⨀倀漀椀渀琀Ⰰ猀琀爀䌀甀爀爀攀渀琀吀爀攀渀搀氀椀渀攀Ⰰ　Ⰰ　Ⰰ倀椀渀欀⤀㬀    
                      }  ਀                    紀 
                  ਀                  椀昀 ⠀䄀氀攀爀琀倀漀瀀甀瀀⤀ 䄀氀攀爀琀⠀猀琀爀䌀甀爀爀攀渀琀吀爀攀渀搀氀椀渀攀Ⰰ∀ 䈀爀攀愀欀漀甀琀 ⴀ 䐀伀圀一 ∀Ⰰ 匀礀洀戀漀氀⠀⤀Ⰰ∀开∀Ⰰ倀攀爀椀漀搀吀漀匀琀爀椀渀最⠀倀攀爀椀漀搀⠀⤀⤀Ⰰ∀ ∀Ⰰ䐀漀甀戀氀攀吀漀匀琀爀⠀椀䌀氀漀猀攀⠀匀礀洀戀漀氀⠀⤀Ⰰ倀攀爀椀漀搀⠀⤀Ⰰ　⤀Ⰰ䐀椀最椀琀猀⤀⤀㬀 
                  if (AlertPopup&&Sound) PlaySound("alert.wav");਀                  椀昀 ⠀䴀漀戀椀氀攀䄀氀攀爀琀⤀ 匀攀渀搀一漀琀椀昀椀挀愀琀椀漀渀⠀猀琀爀䌀甀爀爀攀渀琀吀爀攀渀搀氀椀渀攀⬀∀ 䈀爀攀愀欀漀甀琀 ∀ ⬀匀礀洀戀漀氀⠀⤀⬀∀ 䐀伀圀一 ∀ ⬀ 倀攀爀椀漀搀吀漀匀琀爀椀渀最⠀倀攀爀椀漀搀⠀⤀⤀ ⬀ ∀ ∀ ⬀ 䐀漀甀戀氀攀吀漀匀琀爀⠀椀䌀氀漀猀攀⠀匀礀洀戀漀氀⠀⤀Ⰰ倀攀爀椀漀搀⠀⤀Ⰰ　⤀Ⰰ䐀椀最椀琀猀⤀ ⤀㬀 
                  if (EmailAlert) SendMail(strCurrentTrendline+" Breakout " +Symbol()+ " DOWN " + " " + PeriodToString(Period()) + " " + DoubleToStr(iClose(Symbol(),Period(),0),Digits),਀                     匀礀洀戀漀氀⠀⤀⬀ ∀开∀ ⬀ 倀攀爀椀漀搀吀漀匀琀爀椀渀最⠀倀攀爀椀漀搀⠀⤀⤀ ⬀ ∀㨀 䐀伀圀一∀ ⬀ ∀尀渀䌀甀爀爀攀渀琀 倀爀椀挀攀㨀 ∀ ⬀ 䐀漀甀戀氀攀吀漀匀琀爀⠀椀䌀氀漀猀攀⠀匀礀洀戀漀氀⠀⤀Ⰰ倀攀爀椀漀搀⠀⤀Ⰰ　⤀Ⰰ䐀椀最椀琀猀⤀  
                     + "\nTrendline Price: " + DoubleToStr(dTrendlineCurrentPrice,Digits)  ਀                     ⬀ ∀尀渀匀攀爀瘀攀爀 吀椀洀攀㨀 ∀ ⬀ 吀椀洀攀吀漀匀琀爀⠀吀椀洀攀䌀甀爀爀攀渀琀⠀⤀Ⰰ吀䤀䴀䔀开䐀䄀吀䔀簀吀䤀䴀䔀开匀䔀䌀伀一䐀匀⤀⤀㬀 
                     ਀                 
               }਀      紀紀 
  ਀紀 
਀ 
void DisplayTrendlineStatus()਀笀 
   int YAxisTrendlineStatus;਀    
   /// display the current symbol, period, server time and price਀   椀昀 ⠀䐀椀猀瀀氀愀礀儀甀漀琀攀⤀ 
   {਀      匀攀琀吀攀砀琀䰀愀戀攀氀⠀∀匀礀洀戀漀氀吀爀攀渀搀氀椀渀攀∀Ⰰ匀礀洀戀漀氀⠀⤀⬀∀ⴀ∀⬀倀攀爀椀漀搀吀漀匀琀爀椀渀最⠀倀攀爀椀漀搀⠀⤀⤀Ⰰ 堀䄀砀椀猀Ⰰ夀䄀砀椀猀Ⰰ∀䄀爀椀愀氀∀Ⰰ䘀漀渀琀匀椀稀攀Ⰰ圀栀椀琀攀⤀㬀 
      SetTextLabel("TimeTrendline",TimeToStr(TimeCurrent(), TIME_DATE|TIME_MINUTES|TIME_SECONDS), XAxis,YAxis+FontSize*1.5,"Arial",FontSize-5,White);਀      匀攀琀吀攀砀琀䰀愀戀攀氀⠀∀儀甀漀琀攀吀爀攀渀搀氀椀渀攀∀Ⰰ䐀漀甀戀氀攀吀漀匀琀爀⠀䌀氀漀猀攀嬀　崀Ⰰ䐀椀最椀琀猀⤀Ⰰ堀䄀砀椀猀Ⰰ夀䄀砀椀猀⬀䘀漀渀琀匀椀稀攀⨀㈀⸀㔀Ⰰ∀䄀爀椀愀氀 䈀漀氀搀∀Ⰰ䘀漀渀琀匀椀稀攀⬀㠀Ⰰ䄀焀甀愀⤀㬀 
      //YAxisTrendlineStatus=YAxis+FontSize*5.5;਀   紀 
   //else YAxisTrendlineStatus=YAxis;਀    
   YAxisTrendlineStatus=YAxis+FontSize*5.5;਀    
   if (!DisplayTrendLineStatus) return;਀    
   ushort u_sep = StringGetCharacter(";",0);਀   猀琀爀椀渀最 猀琀爀吀爀攀渀搀氀椀渀攀䄀爀爀愀礀嬀崀㬀 
   ਀   椀渀琀 椀吀爀攀渀搀氀椀渀攀吀漀琀愀氀㴀匀琀爀椀渀最匀瀀氀椀琀⠀猀琀爀吀爀攀渀搀䰀椀渀攀一愀洀攀Ⰰ甀开猀攀瀀Ⰰ猀琀爀吀爀攀渀搀氀椀渀攀䄀爀爀愀礀⤀㬀 
   int i=0;਀   猀琀爀椀渀最 猀琀爀䌀甀爀爀攀渀琀吀爀攀渀搀氀椀渀攀㴀∀∀㬀 
   color cr;਀   搀漀甀戀氀攀 搀吀爀攀渀搀氀椀渀攀䌀甀爀爀攀渀琀倀爀椀挀攀㬀  
   ਀   椀昀 ⠀椀䰀椀渀攀䌀漀甀渀琀℀㴀　⤀ 笀 昀漀爀⠀椀㴀　㬀椀㰀椀䰀椀渀攀䌀漀甀渀琀㬀椀⬀⬀⤀ 伀戀樀攀挀琀䐀攀氀攀琀攀⠀匀琀爀椀渀最䌀漀渀挀愀琀攀渀愀琀攀⠀∀吀爀攀渀搀氀椀渀攀匀琀愀琀甀猀开∀Ⰰ椀⤀⤀㬀 紀  
   ਀   椀昀 ⠀椀吀爀攀渀搀氀椀渀攀吀漀琀愀氀㰀㴀　⤀ 爀攀琀甀爀渀㬀 
   ਀   椀䰀椀渀攀䌀漀甀渀琀㴀　㬀 
   ਀   昀漀爀 ⠀椀㴀　㬀椀㰀椀吀爀攀渀搀氀椀渀攀吀漀琀愀氀㬀椀⬀⬀⤀ 
      {਀         猀琀爀䌀甀爀爀攀渀琀吀爀攀渀搀氀椀渀攀 㴀 匀琀爀椀渀最匀甀戀猀琀爀⠀猀琀爀吀爀攀渀搀氀椀渀攀䄀爀爀愀礀嬀椀崀Ⰰ㄀⤀㬀 
         ਀         椀昀 ⠀匀琀爀椀渀最匀甀戀猀琀爀⠀猀琀爀吀爀攀渀搀氀椀渀攀䄀爀爀愀礀嬀椀崀Ⰰ　Ⰰ㄀⤀㴀㴀∀㄀∀⤀  ⼀⼀⼀ 猀琀愀琀甀猀 搀椀猀瀀氀愀礀 ☀ 氀攀昀琀 愀爀爀漀眀 氀愀戀攀氀 昀漀爀 愀氀攀爀琀攀搀 琀爀攀渀搀氀椀渀攀  
            {  ਀               搀吀爀攀渀搀氀椀渀攀䌀甀爀爀攀渀琀倀爀椀挀攀 㴀 伀戀樀攀挀琀䜀攀琀嘀愀氀甀攀䈀礀匀栀椀昀琀⠀猀琀爀䌀甀爀爀攀渀琀吀爀攀渀搀氀椀渀攀Ⰰ　⤀㬀  ⼀⼀⼀ 爀攀琀爀椀攀瘀攀 琀栀攀 挀甀爀爀攀渀琀 琀爀攀渀搀氀椀渀攀 瘀愀氀甀攀  
               if (iLineCount%2==0) cr = White; else cr = Aqua;਀               匀攀琀吀攀砀琀䰀愀戀攀氀⠀匀琀爀椀渀最䌀漀渀挀愀琀攀渀愀琀攀⠀∀吀爀攀渀搀氀椀渀攀匀琀愀琀甀猀开∀Ⰰ椀䰀椀渀攀䌀漀甀渀琀⤀Ⰰ 
                        StringConcatenate(strCurrentTrendline," - ",strAlerted),਀                        堀䄀砀椀猀Ⰰ夀䄀砀椀猀吀爀攀渀搀氀椀渀攀匀琀愀琀甀猀⬀⠀䘀漀渀琀匀椀稀攀ⴀ㔀⤀⨀椀䰀椀渀攀䌀漀甀渀琀Ⰰ∀䄀爀椀愀氀∀Ⰰ䘀漀渀琀匀椀稀攀ⴀ㄀　Ⰰ挀爀⤀㬀 
               /// arrow left label process for alerted trenline਀               伀戀樀攀挀琀匀攀琀䤀渀琀攀最攀爀⠀䌀栀愀爀琀䤀䐀⠀⤀Ⰰ猀琀爀䌀甀爀爀攀渀琀吀爀攀渀搀氀椀渀攀⬀∀开䄀爀爀漀眀䰀攀昀琀∀Ⰰ伀䈀䨀倀刀伀倀开䌀伀䰀伀刀Ⰰ挀漀氀漀爀䄀氀攀爀琀攀搀⤀㬀 
               ObjectSetInteger(ChartID(),strCurrentTrendline+"_ArrowLeft",OBJPROP_STYLE,STYLE_DASHDOT);਀               伀戀樀攀挀琀匀攀琀䤀渀琀攀最攀爀⠀䌀栀愀爀琀䤀䐀⠀⤀Ⰰ猀琀爀䌀甀爀爀攀渀琀吀爀攀渀搀氀椀渀攀⬀∀开䄀爀爀漀眀䰀攀昀琀∀Ⰰ伀䈀䨀倀刀伀倀开圀䤀䐀吀䠀Ⰰ㈀⤀㬀 
               iLineCount++;਀            紀 
      ਀         椀昀 ⠀匀琀爀椀渀最匀甀戀猀琀爀⠀猀琀爀吀爀攀渀搀氀椀渀攀䄀爀爀愀礀嬀椀崀Ⰰ　Ⰰ㄀⤀㴀㴀∀　∀⤀ 笀  ⼀⼀⼀ 猀琀愀琀甀猀 搀椀猀瀀氀愀礀 ☀ 氀攀昀琀 愀爀爀漀眀 氀愀戀攀氀 昀漀爀 瀀攀渀搀椀渀最 琀爀攀渀搀氀椀渀攀 
            dTrendlineCurrentPrice = ObjectGetValueByShift(strCurrentTrendline,0);   ਀            椀昀 ⠀搀吀爀攀渀搀氀椀渀攀䌀甀爀爀攀渀琀倀爀椀挀攀㸀椀䌀氀漀猀攀⠀匀礀洀戀漀氀⠀⤀Ⰰ倀攀爀椀漀搀⠀⤀Ⰰ　⤀⬀椀倀搀⨀倀漀椀渀琀⤀笀 ⼀⼀⼀ 昀漀爀 甀瀀眀愀爀搀 戀爀攀愀欀漀甀琀 
               if (iLineCount%2==0) cr = White; else cr = Aqua;਀               匀攀琀吀攀砀琀䰀愀戀攀氀⠀匀琀爀椀渀最䌀漀渀挀愀琀攀渀愀琀攀⠀∀吀爀攀渀搀氀椀渀攀匀琀愀琀甀猀开∀Ⰰ椀䰀椀渀攀䌀漀甀渀琀⤀Ⰰ 
                        StringConcatenate(strCurrentTrendline," - ",DoubleToStr(dTrendlineCurrentPrice,Digits)," ",strUpward),਀                        堀䄀砀椀猀Ⰰ夀䄀砀椀猀吀爀攀渀搀氀椀渀攀匀琀愀琀甀猀⬀⠀䘀漀渀琀匀椀稀攀ⴀ㔀⤀⨀椀䰀椀渀攀䌀漀甀渀琀Ⰰ∀䄀爀椀愀氀∀Ⰰ䘀漀渀琀匀椀稀攀ⴀ㄀　Ⰰ挀爀⤀㬀  
               iLineCount++;         ਀               紀 
            if (dTrendlineCurrentPrice<iClose(Symbol(),Period(),0)+iPd*Point){ /// for downward breakout਀               椀昀 ⠀椀䰀椀渀攀䌀漀甀渀琀─㈀㴀㴀　⤀ 挀爀 㴀 圀栀椀琀攀㬀 攀氀猀攀 挀爀 㴀 䄀焀甀愀㬀 
               SetTextLabel(StringConcatenate("TrendlineStatus_",iLineCount),਀                        匀琀爀椀渀最䌀漀渀挀愀琀攀渀愀琀攀⠀猀琀爀䌀甀爀爀攀渀琀吀爀攀渀搀氀椀渀攀Ⰰ∀ ⴀ ∀Ⰰ䐀漀甀戀氀攀吀漀匀琀爀⠀搀吀爀攀渀搀氀椀渀攀䌀甀爀爀攀渀琀倀爀椀挀攀Ⰰ䐀椀最椀琀猀⤀Ⰰ∀ ∀Ⰰ猀琀爀䐀漀眀渀眀愀爀搀⤀Ⰰ 
                        XAxis,YAxisTrendlineStatus+(FontSize-5)*iLineCount,"Arial",FontSize-10,cr); ਀               椀䰀椀渀攀䌀漀甀渀琀⬀⬀㬀          
               }਀            ⼀⼀⼀ 愀爀爀漀眀 氀攀昀琀 氀愀戀攀氀 瀀爀漀挀攀猀猀 
            ObjectSetText(strCurrentTrendline+"_ArrowLeft",DoubleToStr(dTrendlineCurrentPrice,Digits),iArrowRightFontSize,"Arial",0);਀            伀戀樀攀挀琀匀攀琀䤀渀琀攀最攀爀⠀䌀栀愀爀琀䤀䐀⠀⤀Ⰰ猀琀爀䌀甀爀爀攀渀琀吀爀攀渀搀氀椀渀攀⬀∀开䄀爀爀漀眀䰀攀昀琀∀Ⰰ伀䈀䨀倀刀伀倀开䌀伀䰀伀刀Ⰰ伀戀樀攀挀琀䜀攀琀䤀渀琀攀最攀爀⠀䌀栀愀爀琀䤀䐀⠀⤀Ⰰ猀琀爀䌀甀爀爀攀渀琀吀爀攀渀搀氀椀渀攀Ⰰ伀䈀䨀倀刀伀倀开䌀伀䰀伀刀Ⰰ　⤀⤀㬀 
            ObjectMove(ChartID(),strCurrentTrendline+"_ArrowLeft",0,Time[0],dTrendlineCurrentPrice);਀          紀 
         }਀  
 ਀ 紀 
਀ 
void ProcessTrailingStop()਀笀 
਀   搀漀甀戀氀攀 搀匀琀漀瀀氀漀猀猀㴀伀爀搀攀爀匀琀漀瀀䰀漀猀猀⠀⤀㬀 
   double dTakeProfit=OrderTakeProfit();਀   搀漀甀戀氀攀 搀伀瀀攀渀倀爀椀挀攀㴀伀爀搀攀爀伀瀀攀渀倀爀椀挀攀⠀⤀㬀 
   bool bOrderSelect, bOrderModify;਀    
   for (int i=0; i < OrdersTotal(); i++) ਀      笀 
         bOrderSelect = OrderSelect(i, SELECT_BY_POS, MODE_TRADES);਀         椀昀 ⠀伀爀搀攀爀匀礀洀戀漀氀⠀⤀ ℀㴀 匀礀洀戀漀氀⠀⤀⤀ 挀漀渀琀椀渀甀攀㬀 
      ਀         椀昀 ⠀伀爀搀攀爀吀礀瀀攀⠀⤀ 㴀㴀 伀倀开䈀唀夀⤀笀 
            if ( (dStoploss == 0.0 || dTakeProfit == 0.0) && iTp != 0 && iSl != 0) ਀               戀伀爀搀攀爀䴀漀搀椀昀礀 㴀 伀爀搀攀爀䴀漀搀椀昀礀⠀伀爀搀攀爀吀椀挀欀攀琀⠀⤀Ⰰ 伀爀搀攀爀伀瀀攀渀倀爀椀挀攀⠀⤀Ⰰ 一漀爀洀愀氀椀稀攀䐀漀甀戀氀攀⠀䄀猀欀 ⴀ 倀漀椀渀琀 ⨀ ⠀搀漀甀戀氀攀⤀椀匀氀Ⰰ 䐀椀最椀琀猀⤀Ⰰ 一漀爀洀愀氀椀稀攀䐀漀甀戀氀攀⠀䄀猀欀 ⬀ 倀漀椀渀琀 ⨀ ⠀搀漀甀戀氀攀⤀椀吀瀀Ⰰ 䐀椀最椀琀猀⤀Ⰰ 　⤀㬀 
            if ( TrailingStopMoved && iTs>0 )  ਀              笀                  
               if(Bid-OrderOpenPrice()>=Point*iTs && OrderStopLoss()<Bid-Point*iTs)਀                  戀伀爀搀攀爀䴀漀搀椀昀礀 㴀 伀爀搀攀爀䴀漀搀椀昀礀⠀伀爀搀攀爀吀椀挀欀攀琀⠀⤀Ⰰ伀爀搀攀爀伀瀀攀渀倀爀椀挀攀⠀⤀Ⰰ䈀椀搀ⴀ倀漀椀渀琀⨀⠀椀吀猀ⴀ椀䐀椀最椀䔀砀琀攀渀搀⤀Ⰰ伀爀搀攀爀吀愀欀攀倀爀漀昀椀琀⠀⤀Ⰰ　⤀㬀 
              }਀            椀昀 ⠀℀吀爀愀椀氀椀渀最匀琀漀瀀䴀漀瘀攀搀 ☀☀ 椀吀猀㸀　⤀   
              {                 ਀               椀昀 ⠀䈀椀搀 ⴀ 伀爀搀攀爀伀瀀攀渀倀爀椀挀攀⠀⤀ 㸀㴀 椀吀猀⨀倀漀椀渀琀 ☀☀ 伀爀搀攀爀匀琀漀瀀䰀漀猀猀⠀⤀ 㰀 伀爀搀攀爀伀瀀攀渀倀爀椀挀攀⠀⤀⤀  
                  bOrderModify = OrderModify(OrderTicket(), OrderOpenPrice(), OrderOpenPrice() + iDigiExtend , OrderTakeProfit(), 0); ਀              紀              
         }਀          
         if (OrderType() == OP_SELL){਀            椀昀 ⠀ ⠀搀匀琀漀瀀氀漀猀猀 㴀㴀 　⸀　 簀簀 搀吀愀欀攀倀爀漀昀椀琀 㴀㴀 　⸀　⤀ ☀☀ 椀吀瀀 ℀㴀 　 ☀☀ 椀匀氀 ℀㴀 　⤀  
               bOrderModify = OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(Bid + Point * (double)iSl, Digits), NormalizeDouble(Bid - Point * (double)iTp, Digits), 0);਀            椀昀 ⠀ 吀爀愀椀氀椀渀最匀琀漀瀀䴀漀瘀攀搀 ☀☀ 椀吀猀㸀　 ⤀   
              {                 ਀               椀昀⠀伀爀搀攀爀伀瀀攀渀倀爀椀挀攀⠀⤀ⴀ䄀猀欀 㸀㴀 椀吀猀⨀倀漀椀渀琀 ☀☀ 伀爀搀攀爀匀琀漀瀀䰀漀猀猀⠀⤀㸀䄀猀欀⬀倀漀椀渀琀⨀椀吀猀⤀ 
                  bOrderModify = OrderModify(OrderTicket(),OrderOpenPrice(),Ask+Point*(iTs-iDigiExtend),OrderTakeProfit(),0);਀              紀 
            if (!TrailingStopMoved && iTs>0)  ਀              笀                  
               if (OrderOpenPrice()-Ask >= iTs*Point && OrderStopLoss() > OrderOpenPrice()) ਀                  戀伀爀搀攀爀䴀漀搀椀昀礀 㴀 伀爀搀攀爀䴀漀搀椀昀礀⠀伀爀搀攀爀吀椀挀欀攀琀⠀⤀Ⰰ 伀爀搀攀爀伀瀀攀渀倀爀椀挀攀⠀⤀Ⰰ 伀爀搀攀爀伀瀀攀渀倀爀椀挀攀⠀⤀ ⴀ 椀䐀椀最椀䔀砀琀攀渀搀 Ⰰ 伀爀搀攀爀吀愀欀攀倀爀漀昀椀琀⠀⤀Ⰰ 　⤀㬀  
              }             ਀         紀 
}}਀ 
਀ 
਀瘀漀椀搀 匀攀琀䄀爀爀漀眀䰀攀昀琀䰀愀戀攀氀⠀猀琀爀椀渀最 猀琀爀吀爀攀渀搀䰀椀渀攀匀攀琀Ⰰ 猀琀爀椀渀最 猀琀爀吀攀砀琀Ⰰ 挀漀氀漀爀 挀爀⤀ 
{਀   伀戀樀攀挀琀䌀爀攀愀琀攀⠀䌀栀愀爀琀䤀䐀⠀⤀Ⰰ猀琀爀吀爀攀渀搀䰀椀渀攀匀攀琀⬀∀开䄀爀爀漀眀䰀攀昀琀∀Ⰰ伀䈀䨀开䄀刀刀伀圀开䰀䔀䘀吀开倀刀䤀䌀䔀Ⰰ　Ⰰ吀椀洀攀嬀　崀Ⰰ伀戀樀攀挀琀䜀攀琀嘀愀氀甀攀䈀礀匀栀椀昀琀⠀猀琀爀吀爀攀渀搀䰀椀渀攀匀攀琀Ⰰ　⤀⤀㬀 
   ObjectSetText(strTrendLineSet+"_ArrowLeft",strText,iArrowRightFontSize,"Arial",0);਀   伀戀樀攀挀琀匀攀琀䤀渀琀攀最攀爀⠀䌀栀愀爀琀䤀䐀⠀⤀Ⰰ猀琀爀吀爀攀渀搀䰀椀渀攀匀攀琀⬀∀开䄀爀爀漀眀䰀攀昀琀∀Ⰰ伀䈀䨀倀刀伀倀开䌀伀䰀伀刀Ⰰ挀爀⤀㬀 
   ObjectSetInteger(ChartID(),strTrendLineSet+"_ArrowLeft",OBJPROP_STYLE,STYLE_SOLID);਀   伀戀樀攀挀琀匀攀琀䤀渀琀攀最攀爀⠀䌀栀愀爀琀䤀䐀⠀⤀Ⰰ猀琀爀吀爀攀渀搀䰀椀渀攀匀攀琀⬀∀开䄀爀爀漀眀䰀攀昀琀∀Ⰰ伀䈀䨀倀刀伀倀开圀䤀䐀吀䠀Ⰰ㄀⤀㬀 
}਀ 
਀ 
void SetTextLabel(string nm,string tx,int xd,int yd,string fn,int fs,color ct)਀笀 
   ਀   椀昀⠀伀戀樀攀挀琀䘀椀渀搀⠀渀洀⤀㰀　⤀ 
      ObjectCreate(nm,OBJ_LABEL,0,0,0);  //--- create the Label object਀    
   ObjectSet(nm,OBJPROP_STYLE,STYLE_SOLID);                ਀   伀戀樀攀挀琀匀攀琀⠀渀洀Ⰰ伀䈀䨀倀刀伀倀开堀䐀䤀匀吀䄀一䌀䔀Ⰰ砀搀⤀㬀                  
   ObjectSet(nm,OBJPROP_YDISTANCE,yd);                    ਀   伀戀樀攀挀琀匀攀琀⠀渀洀Ⰰ伀䈀䨀倀刀伀倀开䌀伀䰀伀刀Ⰰ挀琀⤀㬀                
   ObjectSetText(nm,tx,fs,fn,ct);                    ਀ 
}਀ 
void OnChartEvent(const int id,         // Event identifier  ਀                  挀漀渀猀琀 氀漀渀最☀ 氀瀀愀爀愀洀Ⰰ   ⼀⼀ 䔀瘀攀渀琀 瀀愀爀愀洀攀琀攀爀 漀昀 氀漀渀最 琀礀瀀攀 
                  const double& dparam, // Event parameter of double type਀                  挀漀渀猀琀 猀琀爀椀渀最☀ 猀瀀愀爀愀洀⤀ ⼀⼀ 䔀瘀攀渀琀 瀀愀爀愀洀攀琀攀爀 漀昀 猀琀爀椀渀最 琀礀瀀攀 
{਀ 
   string strTrendLine;਀    
   if(id==CHARTEVENT_OBJECT_DELETE)  // once the object is deleted, the object type become missing.਀     笀 
         strTrendLine=sparam; ਀       
         StringReplace(strTrendLineName,StringConcatenate("0",strTrendLine,";"),"");਀         匀琀爀椀渀最刀攀瀀氀愀挀攀⠀猀琀爀吀爀攀渀搀䰀椀渀攀一愀洀攀Ⰰ匀琀爀椀渀最䌀漀渀挀愀琀攀渀愀琀攀⠀∀㄀∀Ⰰ猀琀爀吀爀攀渀搀䰀椀渀攀Ⰰ∀㬀∀⤀Ⰰ∀∀⤀㬀 
         ObjectDelete(ChartID(),strTrendLine+"_ArrowLeft");਀          
     }਀      
   if(id==CHARTEVENT_OBJECT_CREATE)਀     笀 
      strTrendLine=sparam;਀      椀昀 ⠀伀戀樀攀挀琀吀礀瀀攀⠀猀琀爀吀爀攀渀搀䰀椀渀攀⤀㴀㴀伀䈀䨀开吀刀䔀一䐀⤀ 
      {਀          猀琀爀吀爀攀渀搀䰀椀渀攀一愀洀攀⬀㴀匀琀爀椀渀最䌀漀渀挀愀琀攀渀愀琀攀⠀∀　∀Ⰰ猀琀爀吀爀攀渀搀䰀椀渀攀Ⰰ∀㬀∀⤀㬀 
          /// Add the Arrow Left Label ਀          匀攀琀䄀爀爀漀眀䰀攀昀琀䰀愀戀攀氀⠀猀琀爀吀爀攀渀搀䰀椀渀攀Ⰰ䐀漀甀戀氀攀吀漀匀琀爀⠀伀戀樀攀挀琀䜀攀琀嘀愀氀甀攀䈀礀匀栀椀昀琀⠀猀琀爀吀爀攀渀搀䰀椀渀攀Ⰰ　⤀Ⰰ䐀椀最椀琀猀⤀Ⰰ伀戀樀攀挀琀䜀攀琀䤀渀琀攀最攀爀⠀䌀栀愀爀琀䤀䐀⠀⤀Ⰰ猀琀爀吀爀攀渀搀䰀椀渀攀Ⰰ伀䈀䨀倀刀伀倀开䌀伀䰀伀刀Ⰰ　⤀⤀㬀 
          ਀      紀 
     }਀      
   if(id==CHARTEVENT_OBJECT_DRAG)਀     笀 
      strTrendLine=sparam;਀      椀昀 ⠀伀戀樀攀挀琀吀礀瀀攀⠀猀琀爀吀爀攀渀搀䰀椀渀攀⤀㴀㴀伀䈀䨀开吀刀䔀一䐀⤀ 
      {਀         伀戀樀攀挀琀䴀漀瘀攀⠀䌀栀愀爀琀䤀䐀⠀⤀Ⰰ猀琀爀吀爀攀渀搀䰀椀渀攀⬀∀开䄀爀爀漀眀䰀攀昀琀∀Ⰰ　Ⰰ吀椀洀攀嬀　崀Ⰰ伀戀樀攀挀琀䜀攀琀嘀愀氀甀攀䈀礀匀栀椀昀琀⠀猀琀爀吀爀攀渀搀䰀椀渀攀Ⰰ　⤀⤀㬀 
         ਀      紀 
     }  ਀      
}਀    
  ਀ 
  ਀猀琀爀椀渀最 倀攀爀椀漀搀吀漀匀琀爀椀渀最 ⠀椀渀琀 椀洀椀渀⤀ 
{਀ 
   string strprd;਀ 
   switch (imin)਀   笀 
਀   挀愀猀攀 ⠀㄀⤀㨀   
   strprd="M1"; ਀   戀爀攀愀欀㬀 
   case (2):  ਀   猀琀爀瀀爀搀㴀∀䴀㈀∀㬀  
   break;਀   挀愀猀攀 ⠀㌀⤀㨀   
   strprd="M3"; ਀   戀爀攀愀欀㬀 
   case (5):  ਀   猀琀爀瀀爀搀㴀∀䴀㔀∀㬀  
   break;਀   挀愀猀攀 ⠀㄀㔀⤀㨀   
   strprd="M15"; ਀   戀爀攀愀欀㬀 
   case (30):  ਀   猀琀爀瀀爀搀㴀∀䴀㌀　∀㬀  
   break;਀   挀愀猀攀 ⠀㘀　⤀㨀   
   strprd="H1"; ਀   戀爀攀愀欀㬀 
   case (60*4):  ਀   猀琀爀瀀爀搀㴀∀䠀㐀∀㬀  
   break;਀   挀愀猀攀 ⠀㘀　⨀㈀㐀⤀㨀   
   strprd="D1"; ਀   戀爀攀愀欀㬀 
   case (60*24*7):  ਀   猀琀爀瀀爀搀㴀∀圀㄀∀㬀  
   break;਀   紀 
਀   爀攀琀甀爀渀 ⠀猀琀爀瀀爀搀⤀㬀 
਀紀 
