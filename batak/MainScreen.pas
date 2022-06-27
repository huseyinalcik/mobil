unit MainScreen;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Edit, FMX.Objects,
  FMX.Ani;

type
  TForm1 = class(TForm)
    Container: TLayout;
    Header: TLayout;
    Footer: TLayout;
    Main: TLayout;
    Label1: TLabel;
    GridPanelLayout1: TGridPanelLayout;
    Label2: TLabel;
    biterTxt: TEdit;
    Image1: TImage;
    Rectangle1: TRectangle;
    ColorAnimation1: TColorAnimation;
    Layout1: TLayout;
    Rectangle2: TRectangle;
    Label3: TLabel;
    ColorAnimation2: TColorAnimation;
    procedure Rectangle1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}
uses GameScreen;

procedure TForm1.Rectangle1Click(Sender: TObject);
begin
if biterTxt.Text='' then
begin
  ShowMessage('Lütfen Bir Sayý Girin Kaçta Bitsin?');
end
else
begin
     HeaderFooterForm.Show;
end;

end;

end.
