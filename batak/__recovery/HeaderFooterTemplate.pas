unit HeaderFooterTemplate;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Edit, FMX.Layouts, FMX.Controls.Presentation, FMX.ListBox,
  FMX.Ani;

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
    procedure ekleAClick(Sender: TObject);
    procedure ekleBClick(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HeaderFooterForm: THeaderFooterForm;

implementation

{$R *.fmx}
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
 ShowMessage('Bi Sayı Yaz Da Oraya!');
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
 ShowMessage('Bi Sayı Yaz Da Oraya!');
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
      MessageDlg('Silmek İstiyor Musunuz?', System.UITypes.TMsgDlgType.mtInformation,
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
 MessageDlg('Silmek İstiyor Musunuz?', System.UITypes.TMsgDlgType.mtInformation,
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

procedure THeaderFooterForm.Timer1Timer(Sender: TObject);
begin
      if (sayac =9) then
      begin
      if topA<topB then
      begin
         label3.Text:=edit3.Text+' Kaybediyorsunuz bir şeyler yapma vakti geldii!!';
      end
      else
      begin
          label3.Text:=edit4.Text+' Bu oyunu anca Çiz kurtarır!!';
      end;
        timer2.Enabled:=true;
        layout4.Visible:=true;
        floatanimation1.Enabled:=true;
      end;



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
