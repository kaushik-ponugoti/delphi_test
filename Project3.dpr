program Project3;

uses
  Vcl.Forms,
  Launcher in 'Launcher.pas' {form_launcher};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.ShowMainForm := False;
  Application.CreateForm(Tform_launcher, form_launcher);
  Application.Run;
end.
