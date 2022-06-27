program yazboz;

uses
  System.StartUpCopy,
  FMX.Forms,
  GameScreen in 'GameScreen.pas' {HeaderFooterForm},
  MainScreen in 'MainScreen.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(THeaderFooterForm, HeaderFooterForm);
  Application.Run;
end.
