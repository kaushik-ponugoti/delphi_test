program Project2;

uses
  Vcl.Forms,
  remote_functionality_test in 'remote_functionality_test.pas' {Form5},
  Unit6 in 'Unit6.pas' {form_homepage};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(Tform_homepage, form_homepage);
  Application.Run;
end.
