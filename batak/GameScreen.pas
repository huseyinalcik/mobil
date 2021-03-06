unit GameScreen;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Edit, FMX.Layouts, FMX.Controls.Presentation, FMX.ListBox,
  FMX.Ani, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo, Data.Bind.Controls,
  Fmx.Bind.Navigator;

type
  THeaderFooterForm = class(TForm)
    Layout1: TLayout;
    GridPanelLayout1: TGridPanelLayout;
    GridPanelLayout2: TGridPanelLayout;
    skorA: TEdit;
    ekleA: TRectangle;
    Label1: TLabel;
    GridPanelLayout3: TGridPanelLayout;
    skorB: TEdit;
    ekleB: TRectangle;
    Label2: TLabel;
    GridPanelLayout4: TGridPanelLayout;
    Rectangle4: TRectangle;
    GridPanelLayout5: TGridPanelLayout;
    Edit3: TEdit;
    GridPanelLayout6: TGridPanelLayout;
    Edit4: TEdit;
    ColorAnimation1: TColorAnimation;
    Layout2: TLayout;
    GridPanelLayout7: TGridPanelLayout;
    elsayisi: TLabel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    ColorAnimation2: TColorAnimation;
    Rectangle1: TRectangle;
    toplamA: TLabel;
    Rectangle2: TRectangle;
    toplamB: TLabel;
    Timer1: TTimer;
    Layout3: TLayout;
    Layout4: TLayout;
    Label3: TLabel;
    Timer2: TTimer;
    FloatAnimation1: TFloatAnimation;
    FloatAnimation2: TFloatAnimation;
    Layout5: TLayout;
    Layout6: TLayout;
    GridPanelLayout8: TGridPanelLayout;
    GridPanelLayout9: TGridPanelLayout;
    kazananA: TLabel;
    kazananB: TLabel;
    kazananPuanA: TLabel;
    kazananPuanB: TLabel;
    Rectangle3: TRectangle;
    Label4: TLabel;
    ColorAnimation3: TColorAnimation;
    Rectangle5: TRectangle;
    Label5: TLabel;
    ColorAnimation4: TColorAnimation;
    Rectangle6: TRectangle;
    Label6: TLabel;
    ColorAnimation5: TColorAnimation;
    FloatAnimation3: TFloatAnimation;
    FloatAnimation4: TFloatAnimation;
    procedure ekleAClick(Sender: TObject);
    procedure ekleBClick(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Rectangle6Click(Sender: TObject);
    procedure Rectangle5Click(Sender: TObject);
    procedure Rectangle3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HeaderFooterForm: THeaderFooterForm;


implementation

{$R *.fmx}
uses MainScreen,DataScreen;
 var
   sayac:integer =0;
   sayac1:integer=0;
   topA:integer=0;
   topB:integer=0;


procedure THeaderFooterForm.ekleAClick(Sender: TObject);
var
skor:integer;
begin
if (skorA.Text ='') then
begin
 ShowMessage('Bi Say? Yaz Da Oraya!');
end
else
begin
sayac:=sayac+1;
skor:=StrToInt(skorA.Text);
topA:=topA+skor;
toplamA.Text:=topA.ToString;
listbox1.Items.Add(skor.ToString);
elsayisi.Text:=sayac.ToString;
end;


end;



procedure THeaderFooterForm.ekleBClick(Sender: TObject);
var
skor:integer;
begin
if (skorB.Text ='') then
begin
 ShowMessage('Bi Say? Yaz Da Oraya!');
end
else
begin
 skor:=StrToInt(skorB.Text);
topB:=topB+skor;
toplamB.Text:=topB.ToString;
listbox2.Items.Add(skor.ToString);
end;

end;



procedure THeaderFooterForm.ListBox1Click(Sender: TObject);
begin
      MessageDlg('Silmek ?stiyor Musunuz?', System.UITypes.TMsgDlgType.mtInformation,
    [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo], 0,
    procedure(const AResult: TModalResult)
    var
    i,toplam:integer;
    begin
      case AResult of
        mrYes:
          begin
          toplam:=0;
           listbox1.Items.Delete(listbox1.ItemIndex);
            For i:=0 to Listbox1.Count-1 do
            begin
              toplam:= toplam+StrToInt(ListBox1.Items[i]);
            end;
            sayac:=sayac-1;
            elsayisi.Text:=sayac.ToString;
             topA:=toplam;
            toplamA.Text:=topA.ToString;
          end;
        mrNo:
          begin

          end;
      end;
    end);
end;

procedure THeaderFooterForm.ListBox2Click(Sender: TObject);
begin
 MessageDlg('Silmek ?stiyor Musunuz?', System.UITypes.TMsgDlgType.mtInformation,
    [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo], 0,
    procedure(const AResult: TModalResult)
    var
    i,toplam:integer;
    begin
      case AResult of
        mrYes:
          begin
          toplam:=0;
           listbox2.Items.Delete(listbox2.ItemIndex);
            For i:=0 to Listbox2.Count-1 do
            begin
              toplam:= toplam+StrToInt(ListBox2.Items[i]);
            end;
             topB:=toplam;
            toplamB.Text:=topB.ToString;
          end;
        mrNo:
          begin

          end;
      end;
    end);
end;

procedure THeaderFooterForm.Rectangle3Click(Sender: TObject);
begin
try
  form2.Fdconnection1.Open();
  form2.Fdquery3.SQL.Text := 'INSERT INTO sonuc(takimA,skorA,takimB,skorB) VALUES (:takimA,:skorA,:takimB,:skorB)';
  form2.Fdquery3.Params.ParamByName('takimA').Value := kazananA.text;
  form2.Fdquery3.Params.ParamByName('skorA').Value := kazananPuanA.text;
  form2.Fdquery3.Params.ParamByName('takimB').Value := kazananB.text;
  form2.Fdquery3.Params.ParamByName('skorB').Value := kazananPuanB.text;
  form2.Fdquery3.ExecSQL;
  form2.Fdconnection1.Close();
finally
  form2.Fdquery3.Free;
end;
end;

procedure THeaderFooterForm.Rectangle5Click(Sender: TObject);
begin
floatanimation4.Enabled:=True;
layout5.Visible:=false;
layout3.Visible:=True;
end;

procedure THeaderFooterForm.Rectangle6Click(Sender: TObject);
begin
listbox1.Clear;
listbox2.Clear;
topA:=0;
topB:=0;
toplamA.Text:='0';
toplamB.text:='0';
elsayisi.Text:='0';
skorA.Text:='';
skorB.Text:='';
form1.biterTxt.Text:='';
floatanimation4.Enabled:=True;
floatanimation3.Enabled:=false;
layout5.Visible:=false;
layout3.Visible:=True;
HeaderFooterForm.Hide;
form1.Show;
timer1.Enabled:=true;
end;

procedure THeaderFooterForm.Timer1Timer(Sender: TObject);
begin
        //ba?lang?ctaki ka?ta biter e ula??nca oyun biter

        if (form1.biterTxt.text=toplamA.text) or (form1.biterTxt.text=toplamB.text) then
            begin
              timer1.Enabled:=false;
              ShowMessage('Oyun Bitti Sonu?lar Geliyor...');
              kazananA.Text:=edit3.Text;
              kazananB.Text:=edit4.text;
              kazananPuanA.Text:=toplamA.Text;
              kazananPuanB.Text:=toplamB.Text;
              layout5.Visible:=True;
              layout3.Visible:=False;
              floatanimation3.Enabled:=true;
              floatanimation4.Enabled:=false;
            end;

       //7. Elde Skoru gosterir
      if (sayac =7) then
      begin
      if topA<topB then
      begin
         label3.Text:=edit3.Text+' Kaybediyorsunuz bir ?eyler yapma vakti geldii!!';
      end
      else
      begin
          label3.Text:=edit4.Text+' Bu oyunu anca ?iz kurtar?r!!';
      end;
        timer2.Enabled:=true;
        layout4.Visible:=true;
        floatanimation1.Enabled:=true;
      end;


         //Her 1 saniyede kim ondeyse kaybedeni k?rm?z?ya boyar
    if topA>topB then
begin
       rectangle2.Fill.Color:=  TAlphaColorRec.orangered;
       rectangle1.Fill.Color:=  TAlphaColorRec.null;
end
else
begin
      rectangle1.Fill.Color:=  TAlphaColorRec.orangered;
      rectangle2.Fill.Color:=  TAlphaColorRec.null;
end;

if topA=topB then
begin
    rectangle1.Fill.Color:=  TAlphaColorRec.null;
      rectangle2.Fill.Color:=  TAlphaColorRec.null;
end;
end;

procedure THeaderFooterForm.Timer2Timer(Sender: TObject);

begin
 sayac1:=sayac1+1;
 if sayac1=3 then
 begin
  floatanimation2.Enabled:=true;
   timer2.Enabled:=false;
   layout4.Visible:=false;
 end;
end;

end.
