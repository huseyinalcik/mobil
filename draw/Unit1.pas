unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Ani,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.Edit,
   FMX.ListBox,math;

type
  TForm1 = class(TForm)
    AnaKatman: TLayout;
    Layout1: TLayout;
    GridPanelLayout1: TGridPanelLayout;
    Rectangle1: TRectangle;
    Label1: TLabel;
    ColorAnimation1: TColorAnimation;
    Rectangle2: TRectangle;
    Label2: TLabel;
    ColorAnimation2: TColorAnimation;
    Rectangle3: TRectangle;
    Label3: TLabel;
    ColorAnimation3: TColorAnimation;
    Layout2: TLayout;
    Edit1: TEdit;
    StyleBook1: TStyleBook;
    Layout3: TLayout;
    Layout4: TLayout;
    ListBox1: TListBox;
    Label4: TLabel;
    procedure Rectangle1Click(Sender: TObject);
    procedure ListBox1ItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure Rectangle2Click(Sender: TObject);
    procedure Rectangle3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.ListBox1ItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
 MessageDlg(Listbox1.Items[ListBox1.ItemIndex]+' <-- Delete The Word?', System.UITypes.TMsgDlgType.mtInformation,
    [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo], 0,
    procedure(const AResult: TModalResult)
    begin
      case AResult of
        mrYes:
          begin

            ListBox1.Items.Delete(ListBox1.ItemIndex);

          end;
        mrNo:
          begin

          end;
      end;
    end);
end;

procedure TForm1.Rectangle1Click(Sender: TObject);
var
  a: string;
begin

  if Edit1.Text = '' then
  begin
    Showmessage('Please Do Not Leave Edit Blank ');
  end
  else
  begin
    a := Edit1.Text;
    ListBox1.Items.Add(a);
    Edit1.Text := '';
  end;
end;

procedure TForm1.Rectangle2Click(Sender: TObject);
begin
MessageDlg(' Clear List ?', System.UITypes.TMsgDlgType.mtInformation,
    [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo], 0,
    procedure(const AResult: TModalResult)
    begin
      case AResult of
        mrYes:
          begin

            ListBox1.Items.Clear;
            label4.Text:='RESULT'
          end;
        mrNo:
          begin

          end;
      end;
    end);
end;

procedure TForm1.Rectangle3Click(Sender: TObject);
var
a:integer;
begin
if listbox1.Items.Count=0 then
begin
  ShowMessage('Please Fill The List');
end
else
begin
 a:=RandomRange(0, ListBox1.Count);
ShowMessage(ListBox1.Items[a]);
label4.Text:= 'RESULT = '+ListBox1.Items[a];

end;
end;

end.
