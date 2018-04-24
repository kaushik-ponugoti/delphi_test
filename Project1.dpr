program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {form_model},
  Unit3 in 'Unit3.pas' {form_modelless},
  Unit4 in 'Unit4.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tform_model, form_model);
  Application.CreateForm(Tform_modelless, form_modelless);
  Application.Run;
end.
