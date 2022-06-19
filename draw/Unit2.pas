unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Ani;

type
  TForm2 = class(TForm)
    Layout1: TLayout;
    resim: TLayout;
    baslýk: TLayout;
    logo: TLayout;
    buton: TLayout;
    Image1: TImage;
    Label1: TLabel;
    Rectangle1: TRectangle;
    Image2: TImage;
    ColorAnimation1: TColorAnimation;
    Image3: TImage;
    procedure Rectangle1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}
uses unit1;

procedure TForm2.Rectangle1Click(Sender: TObject);
begin
   form1.Show;
end;

end.
